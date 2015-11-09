use mysql;
UPDATE `user` SET `Host` = '%' WHERE `Host` = 'localhost' AND `user` = 'root';
UPDATE `user` SET password = PASSWORD('1234567890') where `user` = 'root';
FLUSH PRIVILEGES;