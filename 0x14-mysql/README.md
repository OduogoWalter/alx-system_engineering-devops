0x14. MySQL
DevOps | SysAdmin | MySQL
 
Resources
Read or watch:

1. | https://www.digitalocean.com/community/tutorials/how-to-choose-a-redundancy-plan-to-ensure-high-availability#sql-replication
2. | https://www.digitalocean.com/community/tutorials/how-to-set-up-replication-in-mysql
3. | https://www.databasejournal.com/ms-sql/developing-a-sql-server-backup-strategy/

What is a primary-replica cluster
MySQL primary replica setup
Build a robust database backup strategy
man or help:

mysqldump
Learning Objectives
At the end of this project, you are expected to be able to explain to anyone, without the help of Google:

General
What is the main role of a database
What is a database replica
What is the purpose of a database replica
Why database backups need to be stored in different physical locations
What operation should you regularly perform to make sure that your database backup strategy actually works

General
Allowed editors: vi, vim, emacs
All your files will be interpreted on Ubuntu 16.04 LTS
All your files should end with a new line
A README.md file, at the root of the folder of the project, is mandatory
All your Bash script files must be executable
Your Bash script must pass Shellcheck (version 0.3.7-5~ubuntu16.04.1 via apt-get) without any error
The first line of all your Bash scripts should be exactly #!/usr/bin/env bash
The second line of all your Bash scripts should be a comment explaining what is the script doing

SEVERS:
Name          |	Username| IP            | State	
110882-web-01 |	ubuntu	| 54.87.238.72	| running	
110882-web-02 |	ubuntu  | 35.153.52.13	| running	
110882-lb-01  |	ubuntu	| 54.80.212.49	| running
