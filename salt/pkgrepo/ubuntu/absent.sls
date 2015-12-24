drop-saltstack-pkgrepo:
  pkgrepo.absent:
    - name: deb http://repo.saltstack.com/apt/ubuntu/{{ grains['lsb_distrib_release'] }}/amd64/latest {{ grains['lsb_distrib_codename'] }} main
    - file: /etc/apt/sources.list.d/saltstack.list
    - key_url: https://repo.saltstack.com/apt/ubuntu/{{ grains['lsb_distrib_release'] }}/amd64/latest/SALTSTACK-GPG-KEY.pub