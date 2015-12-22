I tried using mysql docker image, but I faced problems because it doesnt support
creating multiple users, databases and grants users to appropriate databases.
So I changed the image:

use ubuntu trusty rather than debian
changed entrypoint.sh by adding code to check certain environment variables and
create databases, users and grants accordingly.
Now one can create databases and users using the variables

MYSQL_USERS: list of users in form of user1:user1_password,user2:user2_pass@host,user3:user3_pass,...
MYSQL_DATABASES: list of dbs with users access list in form of db1:user1;user2, db2:user3,user4

NOTE: @host is optional for user list if not provided user will be able to access from any host
Currently grants are provided as all privileges to appropriate databases.
