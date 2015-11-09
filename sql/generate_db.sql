-- Скрипт сгенерирован Devart dbForge Studio for MySQL, Версия 6.0.441.0
-- Домашняя страница продукта: http://www.devart.com/ru/dbforge/mysql/studio
-- Дата скрипта: 16.10.2013 0:46:03
-- Версия сервера: 5.0.67-community-nt
-- Версия клиента: 4.1

CREATE DATABASE IF NOT EXISTS mnemoshema
CHARACTER SET = cp1251
COLLATE = cp1251_general_ci;

USE mnemoshema;

-- Copyright (c) 2009 www.cryer.co.uk
-- Script is free to use provided this copyright header is included.
delimiter //

drop procedure if exists AddColumnUnlessExists//

create procedure AddColumnUnlessExists(
	IN dbName tinytext,
	IN tableName tinytext,
	IN fieldName tinytext,
	IN fieldDef text)
begin
	IF NOT EXISTS (
		SELECT * FROM information_schema.COLUMNS
		WHERE column_name=fieldName
		and table_name=tableName
		and table_schema=dbName
		)
	THEN
		set @ddl=CONCAT('ALTER TABLE `',dbName,'`.`',tableName,'` ADD COLUMN `',fieldName,'` ',fieldDef);
		prepare stmt from @ddl;
		execute stmt;
	END IF;
end;
//

drop procedure if exists AddPrimaryKeyUnlessExists//

create procedure AddPrimaryKeyUnlessExists(
  IN dbName tinytext,
  IN tableName tinytext,
  IN fieldName tinytext)
begin
  IF NOT EXISTS (
    SELECT * FROM information_schema.TABLE_CONSTRAINTS
    WHERE TABLE_SCHEMA=dbName
    and TABLE_NAME=tableName
    and CONSTRAINT_TYPE='PRIMARY KEY'
  )
  THEN
    set @ddl=CONCAT('ALTER TABLE ',dbName,'.',tableName,' ADD PRIMARY KEY(',fieldName,')');
    prepare stmt from @ddl;
    execute stmt;
  END IF;
end;
//

DROP PROCEDURE IF EXISTS AddIndexUnlessExists//
CREATE PROCEDURE AddIndexUnlessExists(
    IN dbName tinytext,
    IN tableName tinytext,
    IN indexName tinytext,
    IN columns tinytext)
BEGIN

    DECLARE IndexIsThere INTEGER;

    SELECT COUNT(1) INTO IndexIsThere
    FROM INFORMATION_SCHEMA.STATISTICS
    WHERE table_schema = dbName
    AND   table_name   = tableName
    AND   index_name   = indexName;

    IF IndexIsThere = 0 THEN
        SET @sqlstmt = CONCAT('CREATE INDEX ',indexName,' ON ',
        dbName,'.',tableName,' (',columns,')');
        PREPARE st FROM @sqlstmt;
        EXECUTE st;
        DEALLOCATE PREPARE st;
    END IF;
END
//


delimiter ';'

CREATE TABLE IF NOT EXISTS `group` (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'group', 'name', 'varchar(50) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'group', 'profile_id', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS applications (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'applications', 'name', 'varchar(255) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'applications', 'created', 'datetime NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'applications', 'app', 'longblob NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'applications', 'version', 'varchar(255) NOT NULL');

CREATE TABLE IF NOT EXISTS collection_point (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 120
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'collection_point', 'title', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point', 'addr', 'varchar(25) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS collection_point_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  collection_point_id int(11) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IX_collection_point_parameters (collection_point_id, name)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 68
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'collection_point_parameters', 'device_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point_parameters', 'value', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point_parameters', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'collection_point_parameters', 'type', 'int(11) DEFAULT NULL COMMENT \'1 - пользовательская найстройка\'');
call AddColumnUnlessExists('mnemoshema', 'collection_point_parameters', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS device (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 60
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'device', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device', 'collection_point_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS device_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  device_id int(11) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IX_device_parameters (device_id, name)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 65
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'device_parameters', 'value', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_parameters', 'description', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_parameters', 'type', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_parameters', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS device_sensor (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 64
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'device_sensor', 'device_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_sensor', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_sensor', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS device_sensor_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  sensor_id int(11) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX IX_device_sensor_parameters_name (sensor_id, name)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 48
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'device_sensor_parameters', 'value', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_sensor_parameters', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_sensor_parameters', 'type', 'int(11) DEFAULT NULL COMMENT \'1 - пользовательская настройка\'');
call AddColumnUnlessExists('mnemoshema', 'device_sensor_parameters', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS logs (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'logs', 'event_type', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'logs', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'logs', 'datetime', 'datetime DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'logs', 'comp_name', 'varchar(100) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS mnemoschema (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 437090
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'mnemoschema', 'name', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'mnemoschema', 'structure', 'longtext DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'mnemoschema', 'img', 'blob DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'mnemoschema', 'uuid', 'varchar(255) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS profile (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 30
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'profile', 'name', 'varchar(50) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'profile', 'description', 'text DEFAULT NULL');

CREATE TABLE IF NOT EXISTS profile_elem (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 13
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'profile_elem', 'mnemoschema_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'profile_elem', 'profile_id', 'int(11) DEFAULT NULL');

call AddIndexUnlessExists('mnemoshema', 'profile_elem', 'IX_profile_elem_mnemoschema_id', 'mnemoschema_id');
call AddIndexUnlessExists('mnemoshema', 'profile_elem', 'IX_profile_elem_profile_id', 'profile_id');

CREATE TABLE IF NOT EXISTS profile_sensor (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = MYISAM
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 29
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'profile_sensor', 'profile_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'profile_sensor', 'device_sensor_id', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'profile_sensor', 'sensor_bit_id', 'int(11) DEFAULT NULL');

call AddIndexUnlessExists('mnemoshema', 'profile_sensor', 'IX_profile_sensor_profile_id', 'profile_id');

CREATE TABLE IF NOT EXISTS sensor_bit (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 47
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'desc', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'value0', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'value1', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'sensor_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'bit', 'smallint(6) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'view', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS sensor_bit_parameters (
  id int(11) NOT NULL AUTO_INCREMENT,
  sensor_bit_id int(11) DEFAULT NULL,
  name varchar(255) DEFAULT NULL,
  PRIMARY KEY (id),
  INDEX UK_sensor_bit_parameters (sensor_bit_id, name)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 40
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'sensor_bit_parameters', 'value', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit_parameters', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit_parameters', 'type', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_bit_parameters', 'status', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS settings (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 137
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'settings', 'name', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'settings', 'value', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'settings', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'settings', 'visible', 'int DEFAULT 1');

CREATE TABLE IF NOT EXISTS user (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 42
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'user', 'login', 'varchar(50) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'password', 'varchar(100) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'profile_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'group_id', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'description', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'settings', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user', 'is_admin', 'int(11) NOT NULL DEFAULT 0');


CREATE TABLE IF NOT EXISTS reports (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'reports', 'name', 'varchar(255) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'reports', 'template', 'longblob NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'reports', 'title', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'reports', 'description', 'text DEFAULT NULL');

CREATE TABLE IF NOT EXISTS user_settings (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'user_settings', 'name', 'varchar(255) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'user_settings', 'value', 'text DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'user_settings', 'user_id', 'int(11) DEFAULT NULL');

CREATE TABLE IF NOT EXISTS img (
  id int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'img', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'name', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'img', 'blob DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'crc32', 'bigint(20) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'height', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'width', 'int(11) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'img', 'size', 'int(11) DEFAULT NULL');

-- change img.img column type to LONGBLOB

ALTER TABLE img MODIFY img LONGBLOB;

CREATE TABLE IF NOT EXISTS device_tree_group(
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'device_tree_group', 'name', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_tree_group', 'parent_uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_tree_group', 'uuid', 'varchar(255) DEFAULT NULL');
call AddColumnUnlessExists('mnemoshema', 'device_tree_group', 'record_type', 'int(11) DEFAULT NULL');

CREATE TABLE sensor_folder(
  id INT(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (id)
)
ENGINE = INNODB
AUTO_INCREMENT = 1
CHARACTER SET cp1251
COLLATE cp1251_general_ci;

call AddColumnUnlessExists('mnemoshema', 'sensor_folder', 'uuid', 'varchar(255) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_folder', 'date', 'int(11) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_folder', 'path', 'varchar(1024) NOT NULL');
call AddColumnUnlessExists('mnemoshema', 'sensor_folder', 'location', 'smallint(6) NOT NULL');

call AddIndexUnlessExists('mnemoshema', 'sensor_folder', 'IX_sensor_folder_date', 'date');
call AddIndexUnlessExists('mnemoshema', 'sensor_folder', 'IX_sensor_folder_uuid', 'uuid');




