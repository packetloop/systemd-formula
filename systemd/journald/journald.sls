setup-systemd-journald-conf:
  file.managed:
    - name: /etc/systemd/journald.conf
    - source: salt://systemd/journald/journald.jinja
    - template: jinja
         
restart-systemd-journald:
  service.running:
    - name: systemd-journald
    - enable: True
    - watch:
      - file: /etc/systemd/journald.conf