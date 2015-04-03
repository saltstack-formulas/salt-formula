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
    - name: /etc/salt/pki/cloud/{{ cert }}.pem
    - source: salt://salt/files/key
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

{%- for dir in ['providers', 'profiles', 'maps'] %}
{%- set source = salt_settings.cloud.template_sources.get(dir) %}
salt-cloud-{{ dir }}:
  file.recurse:
    - name: /etc/salt/cloud.{{ dir }}.d
    - source: {{ source }}
    - template: jinja
    - user: root
    - group: root
    - dir_mode: 755
    - file_mode: 644
    - makedirs: True
{%- endfor %}
