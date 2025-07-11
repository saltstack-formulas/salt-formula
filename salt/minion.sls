{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import salt_settings with context %}
{%- from tplroot ~ "/libtofs.jinja" import files_switch with context %}

{% if salt_settings.pin_version and salt_settings.version and grains.os_family|lower == 'debian' %}
include:
  - .pin
{% endif %}

    {%- if grains.os == 'MacOS' %}
        {% if salt_settings.install_packages %}

download-salt-minion:
            {% if salt_settings.salt_minion_pkg_source %} {# minion upgrade? #}
  file.managed:
    - name: '/tmp/salt.pkg'
    - source: {{ salt_settings.salt_minion_pkg_source }}
                    {%- if salt_settings.salt_minion_pkg_hash %}
    - source_hash: {{ salt_settings.salt_minion_pkg_hash }}
                    {% else %}
    - skip_verify: True
                    {% endif %}
    - user: {{ salt_settings.rootuser }}
    - group: {{ salt_settings.rootgroup }}
    - mode: '0644'
    - unless:
      - test -n "{{ salt_settings.version }}" && '/opt/salt/bin/salt-minion --version=.*{{ salt_settings.version }}.*'
    - require_in:
      - macpackage: salt-minion
    - retry: {{ salt_settings.retry_options | json }}
            {%- elif "workaround https://github.com/saltstack/salt/issues/49348" %}
  {% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
    {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
    {%- endif %}
  {% endif %}
            {%- endif %}

salt-minion-macos:
  file.managed:
    - onlyif: {{ grains.os == 'MacOS' }}
    - name: /Library/LaunchDaemons/com.saltstack.salt.minion.plist
    - source: https://raw.githubusercontent.com/saltstack/salt/master/pkg/macos/scripts/com.saltstack.salt.master.plist
    - source_hash: {{ salt_settings.salt_minion_macos_plist_hash }}
    - retry: {{ salt_settings.retry_options | json }}
    - require_in:
      - service: salt-minion
    - watch_in:
      - service: salt-minion
        {%- endif %}
    {%- endif %}

salt-minion:
    {% if salt_settings.install_packages %}
       {%- if grains.os == 'MacOS' and salt_settings.salt_minion_pkg_source %}
  macpackage.installed:
    - name: '/tmp/salt.pkg'
    - target: /
           {# macpackage.installed is weird with version_check, detects diff but incomplete install #}
    - force: True    {# workaround #}
    - unless:
      - test -n "{{ salt_settings.version }}" && '/opt/salt/bin/salt-minion --version=.*{{ salt_settings.version }}.*'
           {% if salt_settings.minion_service_details.state != 'ignore' %}
    - require_in:
      - service: salt-minion
           {% endif %}
    - onchanges_in:
      - cmd: remove-macpackage-salt
        {%- elif grains.os != 'MacOS' and "workaround https://github.com/saltstack/salt/issues/49348" %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
            {%- if salt_settings.version %}
    - version: {{ salt_settings.version }}
            {%- endif %}
            {% if salt_settings.minion_service_details.state != 'ignore' %}
    - require_in:
      - service: salt-minion
            {% endif %}
        {%- endif %}
    {% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path | path_join('minion.d') }}
    {%- if salt_settings.minion_config_use_TOFS %}
    - template: ''
    - source: {{ files_switch(['minion.d'],
                              lookup='salt-minion'
                 )
              }}
    {%- else %}
    - template: jinja
    - source: salt://{{ tplroot }}/files/minion.d
    - context:
        standalone: False
    {%- endif %}
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
    {% if salt_settings.minion_service_details.state != 'ignore' %}
  service.{{ salt_settings.minion_service_details.state }}:
    - enable: {{ salt_settings.minion_service_details.enabled }}
    - name: {{ salt_settings.minion_service }}
    {%- if grains.os_family in ['FreeBSD', 'Gentoo'] %}
    - retry: {{ salt_settings.retry_options | json }}
    {%- endif %}
    - watch:
      - file: remove-old-minion-conf-file
    - order: last
    {% endif %}
    {%- if not salt_settings.restart_via_at %}
  cmd.run:
        {%- if grains['saltversioninfo'] >= [ 2016, 3 ] %}
            {%- if grains['kernel'] == 'Windows' %}
    - name: 'salt-call.bat --local service.restart {{ salt_settings.minion_service }}'
            {%- else %}
    - name: 'salt-call --local service.restart {{ salt_settings.minion_service }} --out-file /dev/null'
            {%- endif %}
    - bg: True
        {%- else %}
            {%- if grains['kernel'] == 'Windows' %}
    - name: 'start powershell "Restart-Service -Name {{ salt_settings.minion_service }}"'
            {%- else %}
    # old style, pre 2016.3. fork and disown the process
    - name: |-
        exec 0>&- # close stdin
        exec 1>&- # close stdout
        exec 2>&- # close stderr
        nohup salt-call --local service.restart {{ salt_settings.minion_service }} --out-file /dev/null &
            {%- endif %}
        {%- endif %}
    - onchanges:
        {%- if salt_settings.install_packages %}
            {%- if grains.os == 'MacOS' and salt_settings.salt_minion_pkg_source %}
      - macpackage: salt-minion
            {%- elif grains.os == 'MacOS' %}
      - pkg: download-salt-minion
            {%- else %}
      - pkg: salt-minion
            {%- endif %}
        {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
    {%- else %}

  {% if grains.os_family not in ['MacOS', 'FreeBSD'] %}
  {# MacOS and FreeBSD have the 'at' command; but there's no package to install #}
at:
  pkg.installed:
    - require_in: restart-salt-minion
  {% endif %}

restart-salt-minion:
  cmd.run:
    - name: echo salt-call --local service.restart {{ salt_settings.minion_service }} | at now + 1 minute
    - order: last
    - onchanges:
        {%- if salt_settings.install_packages %}
            {%- if grains.os == 'MacOS' and salt_settings.salt_minion_pkg_source %}
      - macpackage: salt-minion
            {%- elif grains.os == 'MacOS' %}
      - pkg: download-salt-minion
            {%- else %}
      - pkg: salt-minion
            {%- endif %}
        {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
    {%- endif %}

    {% if 'inotify' in  salt_settings.get('minion', {}).get('beacons', {}) and salt_settings.get('pyinotify', False) %}
salt-minion-beacon-inotify:
  pkg.installed:
    - name: {{ salt_settings.pyinotify }}
    - require_in:
      - service: salt-minion
    - watch_in:
      - service: salt-minion
    {% endif %}

    {% if salt_settings.minion_remove_config %}
remove-default-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion
    {% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path | path_join('minion.d', '_defaults.conf') }}

    {% if grains.os == 'MacOS' %}
remove-macpackage-salt:
  file.absent:
    - name: /tmp/salt.pkg
    - force: True
    {% endif %}

    {% if not salt_settings.minion_remove_config %}
permissions-minion-config:
  file.managed:
    - name: {{ salt_settings.config_path | path_join('minion') }}
    - user: {{ salt_settings.rootuser }}
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        {{ salt_settings.rootgroup }}
        {%- endif %}
    {%- if grains['kernel'] != 'Windows' %}
    - mode: 640
    {% endif %}
    - replace: False
    {% endif %}

salt-minion-pki-dir:
  file.directory:
{% if 'pki_dir' in salt_settings.minion %}
    - name: {{ salt_settings.minion.pki_dir }}
{% else %}
    - name: {{ salt_settings.config_path | path_join('pki', 'minion') }}
{% endif %}
    - user: {{ salt_settings.rootuser }}
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        {{ salt_settings.rootgroup }}
        {%- endif %}
    {%- if grains['kernel'] != 'Windows' %}
    - mode: 700
    {% endif %}
    - makedirs: True

permissions-minion.pem:
  file.managed:
{% if 'pki_dir' in salt_settings.minion %}
    - name: {{ salt_settings.minion.pki_dir | path_join('minion.pem') }}
{% else %}
    - name: {{ salt_settings.config_path | path_join('pki', 'minion', 'minion.pem') }}
{% endif %}
    - user: {{ salt_settings.rootuser }}
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        {{ salt_settings.rootgroup }}
        {%- endif %}
    {%- if grains['kernel'] != 'Windows' %}
    - mode: 400
    {% endif %}
    - replace: False
    - require:
      - file: salt-minion-pki-dir

permissions-minion.pub:
  file.managed:
{% if 'pki_dir' in salt_settings.minion %}
    - name: {{ salt_settings.minion.pki_dir | path_join('minion.pub') }}
{% else %}
    - name: {{ salt_settings.config_path | path_join('pki', 'minion', 'minion.pub') }}
{% endif %}
    - user: {{ salt_settings.rootuser }}
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        {{ salt_settings.rootgroup }}
        {%- endif %}
    {%- if grains['kernel'] != 'Windows' %}
    - mode: 644
    {% endif %}
    - replace: False
    - require:
      - file: salt-minion-pki-dir
