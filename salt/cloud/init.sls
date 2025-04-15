{%- set tplroot = tpldir.split('/')[0] %}
{% from "salt/map.jinja" import salt_settings with context %}

{%- if salt_settings.use_pip %}
python-pip:
  pkg.installed

salt-cloud-pip-packages:
  pip.installed:
    - pkgs:
      - apache-libcloud
      {%- if grains['os_family'] not in ['Debian', 'RedHat'] %}
      - crypto
      {%- endif %}
      - pycrypto
    - require:
      - pkg: python-pip
{%- endif %}

{% if salt_settings.install_packages %}
salt-cloud:
  pkg.installed:
    - name: {{ salt_settings.salt_cloud }}
    {%- if salt_settings.version is defined %}
    - version: {{ salt_settings.version }}
    {%- endif %}
    {%- if salt_settings.use_pip %}
    - require:
      - pip: salt-cloud-pip-packages
    {%- endif %}
{% endif %}

{% for cert in pillar.get('salt_cloud_certs', {}) %}
{% for type in ['pem'] %}
cloud-cert-{{ cert }}-pem:
  file.managed:
    - name: {{ salt_settings.config_path }}/pki/cloud/{{ cert }}.pem
    - source: salt://{{ tplroot }}/files/key
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
        key: {{ cert }}
        type: {{ type }}
{% endfor %}
{% endfor %}

{% for cloud_section in ["maps", "profiles", "providers"] %}
salt-cloud-{{ cloud_section }}:
  file.recurse:
    - name: {{ salt_settings.config_path }}/cloud.{{ cloud_section }}.d
    - source: {{ salt_settings.cloud.template_sources[cloud_section] }}
    - template: jinja
    - makedirs: True
    - exclude_pat: _*

{% for filename in salt['pillar.get']("salt:cloud:" ~ cloud_section, {}).keys() %}
/etc/salt/cloud.{{ cloud_section }}.d/{{ filename }}:
  file.serialize:
    - dataset_pillar: salt:cloud:{{ cloud_section }}:{{ filename }}
    - formatter: yaml
    - require:
      - file: salt-cloud-{{ cloud_section }}
    {%- if cloud_section == "providers" %}
    - require_in:
      - file: salt-cloud-providers-permissions
    {%- endif %}
{% endfor %}
{% endfor %}

salt-cloud-providers-permissions:
  file.directory:
    - name: {{ salt_settings.config_path }}/cloud.providers.d
    - user: root
    - group:
        {%- if grains['kernel'] in ['FreeBSD', 'OpenBSD', 'NetBSD'] %}
        wheel
        {%- else %}
        root
        {%- endif %}
    - file_mode: 600
    - dir_mode: 700
    - recurse:
      - user
      - group
      - mode
    - require:
      - file: salt-cloud-providers
