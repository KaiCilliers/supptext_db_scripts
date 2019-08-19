-- show all users
SELECT * FROM mysql.user WHERE user LIKE 'api';

-- create user for api to use
CREATE USER api@localhost IDENTIFIED BY 'admin';

-- grant permissions
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
 ON sql_supptext.*
 TO api@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
 ON sql_supptext_test.*
 TO api@localhost;
GRANT SELECT, INSERT, UPDATE, DELETE, EXECUTE
 ON sql_supptext_prod.*
 TO api@localhost;
 
-- allow connections from node
ALTER USER 'api'@'localhost' IDENTIFIED WITH mysql_native_password BY 'admin'