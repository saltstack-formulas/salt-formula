{% from "salt/map.jinja" import salt_settings with context %}

salt-minion:
{% if salt_settings.install_packages %}
  pkg.installed:
    - name: {{ salt_settings.salt_minion }}
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
    - name: '{{ salt_settings.config_path }}\salt-call.bat --local service.restart {{ salt_settings.minion_service }}'
    {%- else %}
    - name: 'salt-call --local service.restart {{ salt_settings.minion_service }} --out-file /dev/null'
    - bg: True
    {%- endif %}
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
      - pkg: salt-minion
  {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
{%- else %}
at:
  pkg.installed: []

restart-salt-minion:
  cmd.wait:
    - name: echo salt-call --local service.restart salt-minion | at now + 1 minute
    - order: last
    - require:
        - pkg: at
    - watch:
  {%- if salt_settings.install_packages %}
      - pkg: salt-minion
  {%- endif %}
      - file: salt-minion
      - file: remove-old-minion-conf-file
{%- endif %}

{% if salt_settings.minion_remove_config %}
remove-default-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion
{% endif %}

# clean up old _defaults.conf file if they have it around
remove-old-minion-conf-file:
  file.absent:
    - name: {{ salt_settings.config_path }}/minion.d/_defaults.conf
