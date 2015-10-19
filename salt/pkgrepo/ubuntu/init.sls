legacy-saltstack-pkgrepo:
  pkgrepo.absent:
    - ppa: saltstack/salt

saltstack-pkgrepo:
  pkgrepo.managed:
    {% if grains['osrelease'] == '14.04' %}
    - dist: trusty
    - key_url: https://repo.saltstack.com/apt/ubuntu/ubuntu14/SALTSTACK-GPG-KEY.pub
    - name: deb http://repo.saltstack.com/apt/ubuntu/ubuntu14 trusty main
    {% elif grains['osrelease'] == '12.04' %}
    - dist: precise
    - key_url: https://repo.saltstack.com/apt/ubuntu/ubuntu12/SALTSTACK-GPG-KEY.pub
    - name: deb http://repo.saltstack.com/apt/ubuntu/ubuntu12 precise main
    {% endif %}
    - file: /etc/apt/sources.list.d/saltstack.list