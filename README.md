
Barman formula
===========

Barman is an open source project for postgreSQL backups. More at pgbarman.org

Sample pillars
==============

```
barman:
  host:
    enabled: true
    user: barman
    backup_dir: /backup/barman
    backups:
      - name: "portal"
        hostname: 10.1.1.1
        port: 5465
        database: portal 
        username: barman
        password: barman
        type: ssh
        server_pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTbS45Vy8FlQfjCagvuvwg8CHHG2u1M3lK1tyD2KjEvTyBt/PgaLTUU/yVX9tigRuk43zSt08fDrc9xp4M3WkS3m9Vvzo+iWujrL9j2HVuIxgUs8EwQv3H8pMlSp49/XdmSXIx7gy95PHkPZIf/A40Doyd4v5COyA6UbVyV137EXgRUpcyhI/SI+9J5KrcpYUY47FzBYmV0ihX7XKJ1z9W8O72b7SAlL/U1OaSFf9hsPX0O7PTj2nAAJMj8Q65vMNYcN5b7k68kd+eTDb1ShxsIaqPvbudZkdewXO2VZq88VLaxBmpav6gAgKdj/qBpMg04c05lz2CEkZr+NHU2no1 postgres@portal
      - name: "intranettp21atlasportaldb"
        hostname: 10.1.1.1
        port: 5465
        database: otherdb
        username: barman
        password: barman
        type: ssh
        server_pubkey: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCTbS45Vy8FlQfjCagvuvwg8CHHG2u1M3lK1tyD2KjEvTyBt/PgaLTUU/yVX9tigRuk43zSt08fDrc9xp4M3WkS3m9Vvzo+iWujrL9j2HVuIxgUs8EwQv3H8pMlSp49/XdmSXIx7gy95PHkPZIf/A40Doyd4v5COyA6UbVyV137EXgRUpcyhI/SI+9J5KrcpYUY47FzBYmV0ihX7XKJ1z9W8O72b7SAlL/U1OaSFf9hsPX0O7PTj2nAAJMj8Q65vMNYcN5b7k68kd+eTDb1ShxsIaqPvbudZkdewXO2VZq88VLaxBmpav6gAgKdj/qBpMg04c05lz2CEkZr+NHU2no1 postgres@portal
``

Creates user barman
Connects to 10.1.1.1 and creates a backup job via rsync.
Each Database must be defined seperately
user barman must be enabled on the postgres server and must be a superuser

Read more
=========

* http://www.pgbarman.org/
* https://www.postgresql.org/
