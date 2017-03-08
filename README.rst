
===========
Barman formula
===========

Barman is an open source project for postgreSQL backups. More at pgbarman.org

Sample pillars
==============

###TODO

.. code-block:: yaml

    barman:
      client:
        enabled: true

GIT with user setup

.. code-block:: yaml

    git:
      client:
        enabled: true
        user:
        - user:
            name: jdoe
            email: j@doe.com

Reclass with GIT with user setup

.. code-block:: yaml

    git:
      client:
        enabled: true
        user:
        - user: ${linux:system:user:jdoe}

Read more
=========

* http://www.pgbarman.org/
* https://www.postgresql.org/