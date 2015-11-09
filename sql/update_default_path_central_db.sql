/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

SET NAMES 'utf8';

USE mnemoshema;

INSERT INTO settings (`name`, `value`, `description`) 
SELECT * FROM (SELECT 'path_to_central_db', '{{PathCentralDB}}', 'Путь к папке, где располагается структура центральной базы данных. Тип вводимого значение параметра строка. \\\\MSCH\\data') AS tmp
WHERE NOT EXISTS (SELECT `name` from settings WHERE name = 'path_to_central_db') LIMIT 1;

UPDATE settings SET `value` = '{{PathCentralDB}}' WHERE `name` = 'path_to_central_db';

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;