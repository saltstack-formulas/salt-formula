{% from "salt/map.jinja" import salt_settings with context %}

python-pip:
  pkg.installed

pycrypto:
  pip.installed:
    - require:
      - pkg: python-pip

{% if grains['os_family'] not in ['Debian', 'RedHat'] %}
crypto:
  pip.installed:
    - require:
      - pkg: python-pip
{% endif %}

apache-libcloud:
  pip.installed:
    - require:
      - pkg: python-pip

{% if salt_settings.install_packages %}
salt-cloud:
  pkg.installed:
    - name: {{ salt_settings.salt_cloud }}
    - require:
      - pip: apache-libcloud
      - pip: pycrypto
      {% if grains['os_family'] not in ['Debian', 'RedHat'] %}
      - pip: crypto
      {% endif %}
{% endif %}

{% for cert in pillar.get('salt_cloud_certs', {}) %}
{% for type in ['pem'] %}
cloud-cert-{{ cert }}-pem:
  file.managed:
    - name: {{ salt_settings.config_path }}/pki/cloud/{{ cert }}.pem
    - source: salt://{{ slspath }}/files/key
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - makedirs: True
    - defaults:
        key: {{ cert }}
        type: {{ type }}
{% endfor %}
{% endfor %}

{%- for dir, templ_path in salt_settings.cloud.template_sources.items() %}
salt-cloud-{{ dir }}:
  file.recurse:
    - name: {{ salt_settings.config_path }}/cloud.{{ dir }}.d
    - source: {{ templ_path }}
    - template: jinja
    - makedirs: True
{%- endfor %}

salt-cloud-providers-permissions:
  file.directory:
    - name: {{ salt_settings.config_path }}/cloud.providers.d
    - user: root
    - group: root
    - file_mode: 600
    - dir_mode: 700
    - recurse:
      - user
      - group
      - mode
