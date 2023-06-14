# Note Irods - https://docs.irods.org/4.3.0

## Server

Un server irods a un "catalog_service_role" qui peux être soie consumer soit provider (4.2 les deux). (Il n'est pas obligatoire)

- **Consumer** : un serveur dans ce role ce connect a une zone existante pour y rajouter des ressources de stockages supplémentaires.
- **Provider** : un serveur dans ce role gère une Zone, gère les connexion a la base de donnée et les iCAT catalogue de métadonnée qu'il en dépend et peux surtout donnée des ressources de stockage. Généralement les iRODS Zone n'on qu'un seul server en mode provider. (mais c'est possible)

**Un provider n'est qu'un consumer qui donne un point de coordination pour une zone e gère les métadonnées**

**Le plus simple iRODS possible consiste en un serveur provider et rien d'autre**

## Database

Il faut des plugins afin de faire marché le lien entre iRODS et la base de données, les plugins existe sur Oracle, MySQl ou PostGreSQL.

Le type de la base de donees est stocker généralement ici : `/etc/irods/database_config.json`

Contenue du fichier
```json
"catalog_database_type" : "postgres",
```
et il est utilisé dans le fichier python setup_irods.py.

**Le script iRODS de setup (qui gère aussi le plugin) a besoin d'une connexion a la DB existante**

**iRODS ne créer ou ne gère aucune Db en elle même mais seulement les table, il faut donc créer une instance de base de donnée avant d'installer iRODS**

exemple de creation  de base de donné PostgreSQL sous ubuntu : 

```bash
$ (sudo) su - postgres
postgres$ psql
psql> CREATE USER irods WITH PASSWORD 'testpassword';
psql> CREATE DATABASE "ICAT";
psql> GRANT ALL PRIVILEGES ON DATABASE "ICAT" TO irods;

\l # voir les permissions
```
Si c'est fait en local il ne faut pas oublier de mettre localhost dans le setup_irods.py

**sudo python3 -m pip install pyodbc** -> EST ESSENTIEL 

**The setup_irods.py script below will prompt for, and then create, if necessary, a service account and service group which will own and operate the iRODS server binaries:** -> DONC POUR LE SERVEUR

**Le paquet nixpkgs de iRODS de Nix pkgs installe tout grace aux git : https://github.com/irods/irods/tree/main et https://github.com/irods/irods_client_icommands/tree/main**

LISTE DES ICOMMANDS (pour user) : https://docs.irods.org/4.3.0/icommands/user/