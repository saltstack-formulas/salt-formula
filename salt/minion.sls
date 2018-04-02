{% from "salt/map.jinja" import salt_settings with context %}

{% if grains.os == 'MacOS' and salt_settings.salt_minion_pkg_source != '' and salt_settings.version != '' %}
{# only download IF we know where to get the pkg from and if we know what version to check the current install (if installed) against #}
{# e.g. don't download unless it appears as though we're about to try and upgrade the minion #}
download-salt-minion:
  file.managed:
    - name: '/tmp/salt.pkg'
    - source: {{ salt_settings.salt_minion_pkg_source }}
    {% if salt_settings.salt_minion_pkg_hash != '' %}
    - source_hash: {{ salt_settings.salt_minion_pkg_hash }}
    {% else %}
    - skip_verify: True
    {% endif %}
    - user: root
    - group: wheel
    - mode: 0644
    - unless:
      - '/opt/salt/bin/salt-minion --version | grep {{ salt_settings.version }}'
    - require_in:
      - macpackage: salt-minion
{% endif %}

salt-minion:
{% if salt_settings.install_packages %}
  {%- if grains.os == 'MacOS' and salt_settings.salt_minion_pkg_source != '' and salt_settings.version != '' %}
  macpackage.installed:
    - name: '/tmp/salt.pkg'
    - target: /
    {# macpackage.installed behaves weirdly with version_check; version_check detects difference but fails to actually complete install. #}
    {# use force == True as workaround #}
    - force: True
    - version_check: /opt/salt/bin/salt-minion --version=.*{{ salt_settings.version }}.*
  {%- else %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
  {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
  {%- endif %}
  {%- endif %}
{% endif %}
  file.recurse:
    - name: {{ salt_settings.config_path }}/minion.d
    - template: jinja
    - source: salt://{{ slspath }}/files/minion.d
    - clean: {{ salt_settings.clean_config_d_dir }}
    - exclude_pat: _*
    - context:
        standalone: False
  service.running:
    - enable: True
    - name: {{ salt_settings.minion_service }}
    - require:
      - file: salt-minion
{%- if not salt_settings.restart_via_at %}
  cmd.run:
  {%- if grains['saltversioninfo'][0] >= 2016 and grains['saltversioninfo'][1] >= 3 %}
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
    {%- if grains.os == 'MacOS' %}
      - macpackage: salt-minion
    {%- else %}
      - pkg: salt-minion
    {%- endif %}
  {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
{%- else %}

  {% if grains.os != 'MacOS' %}
  {# MacOS has 'at' command; but there's no package to install #}
at:
  pkg.installed: []
  {% endif %}

restart-salt-minion:
  cmd.run:
    - name: echo salt-call --local service.restart {{ salt_settings.minion_service }} | at now + 1 minute
    - order: last
    - require:
        - pkg: at
    - onchanges:
  {%- if salt_settings.install_packages %}
      {%- if grains.os == 'MacOS' %}
      - macpackage: salt-minion
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
    - name: {{ salt_settings.config_path }}/minion.d/_defaults.conf

{% if grains.os == 'MacOS' %}
remove-macpackage-salt:
  cmd.run:
    - name: 'rm -f /tmp/salt.pkg'
    - onchanges:
      - macpackage: salt-minion
{% endif %}
