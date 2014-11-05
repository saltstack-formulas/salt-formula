{% from "salt/package-map.jinja" import pkgs with context %}
{% set salt = pillar.get('salt', {}) -%}
{% set cloud = salt.get('cloud', {}) -%}

python-pip:
  pkg.installed

pycrypto:
  pip.installed:
    - require:
      - pkg: python-pip

crypto:
  pip.installed:
    - require:
      - pkg: python-pip

apache-libcloud:
  pip.installed:
    - require:
      - pkg: python-pip

salt-cloud:
  pkg.installed:
    - name: {{ pkgs['salt-cloud'] }}
    - require:
      - pip: apache-libcloud
      - pip: pycrypto
      - pip: crypto

{% for folder in cloud['folders'] %}
{{ folder }}:
  file.directory:
    - name: /etc/salt/{{ folder }}
    - user: root
    - group: root
    - file_mode: 744
    - dir_mode: 755
    - makedirs: True
{% endfor %}

{% for cert in pillar.get('salt_cloud_certs', {}) %}
{% for type in ['pem'] %}
cloud-cert-{{ cert }}-pem:
  file.managed:
    - name: /etc/salt/cloud.providers.d/key/{{ cert }}.pem
    - source: salt://salt/files/key
    - template: jinja
    - user: root
    - group: root
    - mode: 600
    - defaults:
        key: {{ cert }}
        type: {{ type }}
{% endfor %}
{% endfor %}

{% for providers in cloud['providers'] %}
salt-cloud-profiles-{{ providers }}:
  file.managed:
    - name: /etc/salt/cloud.profiles.d/{{ providers }}.conf
    - template: jinja
    - source: salt://salt/files/cloud.profiles.d/{{ providers }}.conf
{% endfor %}

{% for providers in cloud['providers'] %}
salt-cloud-providers-{{ providers }}:
  file.managed:
    - name: /etc/salt/cloud.providers.d/{{ providers }}.conf
    - template: jinja
    - source: salt://salt/files/cloud.providers.d/{{ providers }}.conf
{% endfor %}

{% for providers in cloud['providers'] %}
salt-cloud-maps-{{ providers }}:
  file.managed:
    - name: /etc/salt/cloud.maps.d/{{ providers }}.conf
    - template: jinja
    - source: salt://salt/files/cloud.maps.d/{{ providers }}.conf
{% endfor %}
