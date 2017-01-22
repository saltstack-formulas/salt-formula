{%- from "salt/map.jinja" import salt_settings with context %}

{%- set gitfs_keys=salt['pillar.get']('salt:gitfs:keys', {}) %}

{%- for key, keyvalues in gitfs_keys.items() %}
{%- for type, keydata in keyvalues.items() %}
gitfs-key-{{ key }}-{{ type }}:
  file.managed:
    - name: {{ salt_settings.config_path }}/pki/gitfs/{{ key }}.{{ type }}
    - source: salt://salt/files/gitfs_key.jinja
    - template: jinja
    - user: root
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        root
        {%- endif %}
    - mode: 600
    - makedirs: True
    - defaults:
        key: {{ key }}
        type: {{ type }}
{%- endfor %}
{%- endfor %}
