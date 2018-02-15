ALTER TABLE `kcm_data`.`structures` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

ALTER TABLE `kcm_data`.`employees` 
ADD COLUMN `gender` CHAR(1) NOT NULL AFTER `age`;

ALTER TABLE `kcm_data`.`production` 
CHANGE COLUMN `shift` `shift` CHAR(1) NULL ;

ALTER TABLE `kcm_data`.`elements` 
DROP FOREIGN KEY `fk_analyse_elements`;
ALTER TABLE `kcm_data`.`elements` 
DROP COLUMN `id`,
CHANGE COLUMN `element` `Zn` VARCHAR(2) NULL ,
CHANGE COLUMN `analyse_id` `analyse_id` INT(11) NOT NULL AUTO_INCREMENT ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`analyse_id`),
DROP INDEX `element_UNIQUE` ;
ALTER TABLE `kcm_data`.`elements` 
ADD CONSTRAINT `fk_analyse_elements`
  FOREIGN KEY (`analyse_id`)
  REFERENCES `kcm_data`.`analyses` (`id`)
  ON UPDATE CASCADE;

ALTER TABLE `kcm_data`.`elements` 
ADD COLUMN `Pb` VARCHAR(2) NULL AFTER `analyse_id`,
ADD COLUMN `ZnO` DOUBLE(8,4) NULL AFTER `Pb`,
ADD COLUMN `Si20` DOUBLE(8,4) NULL AFTER `ZnO`,
ADD COLUMN `Ag` DOUBLE(8,4) NULL AFTER `Si20`,
ADD COLUMN `Bi` DOUBLE(8,4) NULL AFTER `Ag`,
ADD COLUMN `SO4` DOUBLE(8,4) NULL AFTER `Bi`,
ADD COLUMN `Au` DOUBLE(8,4) NULL AFTER `SO4`,
ADD COLUMN `Sb` DOUBLE(8,4) NULL AFTER `Au`,
ADD COLUMN `Ge` DOUBLE(8,4) NULL AFTER `Sb`;

ALTER TABLE `kcm_data`.`production` 
CHANGE COLUMN `shift` `shift` CHAR(1) NOT NULL ;

ALTER TABLE `kcm_data`.`departments` 
CHANGE COLUMN `workforce` `workforce` INT(11) NULL ;
ALTER TABLE `kcm_data`.`departments` 
CHANGE COLUMN `structure_id` `structure_id` INT(11) NULL ;

ALTER TABLE `kcm_data`.`production` 
CHANGE COLUMN `shift` `shift` CHAR(1) NULL ,
ADD COLUMN `metric tones` DOUBLE(8,2) NOT NULL AFTER `lot`;

ALTER TABLE `kcm_data`.`shipments` 
ADD COLUMN `metric_tones` DOUBLE(8,2) NOT NULL AFTER `production_id`;

ALTER TABLE `kcm_data`.`production` 
CHANGE COLUMN `metric tones` `metric tones` INT(11) NULL ;

ALTER TABLE `kcm_data`.`analyses` 
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC);

ALTER TABLE `kcm_data`.`analyses` 
CHANGE COLUMN `arbitrage` `arbitrage` VARCHAR(45) NOT NULL COMMENT 'null allowed. Syntax Won  or Lost if no arbitrage for the sample Null' ;

ALTER TABLE `kcm_data`.`elements` 
CHANGE COLUMN `Zn` `Zn` DOUBLE(8,4) NULL DEFAULT NULL ,
CHANGE COLUMN `Pb` `Pb` DOUBLE(8,4) NULL DEFAULT NULL ;

ALTER TABLE `kcm_data`.`month` 
CHANGE COLUMN `id` `id` INT(11) NOT NULL AUTO_INCREMENT ;

INSERT INTO `kcm_data`.`structures` (`name`) VALUES ('OOP');
INSERT INTO `kcm_data`.`structures` (`name`) VALUES ('OOZn');
INSERT INTO `kcm_data`.`structures` (`name`) VALUES ('Trade');
INSERT INTO `kcm_data`.`structures` (`name`) VALUES ('Lucky');
INSERT INTO `kcm_data`.`structures` (`name`) VALUES ('Kcm ');

INSERT INTO `kcm_data`.`departments` (`name`, `structure_id`, `workforce`) VALUES ('Velc', '2', '300');
INSERT INTO `kcm_data`.`departments` (`name`, `structure_id`, `workforce`) VALUES ('NOP', '1', '450');
INSERT INTO `kcm_data`.`departments` (`name`, `structure_id`, `workforce`) VALUES ('Otk', '5', '25');
INSERT INTO `kcm_data`.`departments` (`name`, `structure_id`, `workforce`) VALUES ('Lab', '5', '50');
INSERT INTO `kcm_data`.`departments` (`id`, `name`, `structure_id`, `workforce`) VALUES ('5', 'Gold', '5', '75');
INSERT INTO `kcm_data`.`departments` (`name`, `structure_id`, `workforce`) VALUES ('trade', '5', '150');

INSERT INTO `kcm_data`.`employees` (`first_name`, `second_name`, `last_name`, `salary`, `department_id`, `hire_date`, `birth_date`, `education`, `level`, `shift`, `status`, `age`, `gender`) VALUES ('Teodor', 'G', 'Stefanov', '900', '3', '2006-10-17', '1983-07-10', 'Masters', '7', 'F', 'active', '34', 'M');
INSERT INTO `kcm_data`.`employees` (`first_name`, `second_name`, `last_name`, `salary`, `department_id`, `hire_date`, `birth_date`, `education`, `level`, `shift`, `status`, `age`, `gender`) VALUES ('Stilqna', 'I ', 'Ivanova', '600', '4', '2017-11-01', '1990-11-11', 'Bachelor', '5', 'A', 'active', '27', 'F');
INSERT INTO `kcm_data`.`employees` (`first_name`, `second_name`, `last_name`, `salary`, `department_id`, `hire_date`, `birth_date`, `education`, `level`, `shift`, `status`, `age`, `gender`) VALUES ('Neli', 'I ', 'Stefanova', '800', '5', '2002-07-10', '1958-01-06', 'Masters', '7', 'F', 'active', '59', 'F');
INSERT INTO `kcm_data`.`employees` (`first_name`, `second_name`, `last_name`, `salary`, `department_id`, `hire_date`, `birth_date`, `education`, `level`, `shift`, `status`, `age`, `gender`) VALUES ('Anton', 'K ', 'Ivanov', '1500', '6', '2000-12-12', '1960-12-10', 'Masters', '8', 'F', 'active', '57', 'M');

INSERT INTO `kcm_data`.`positions` (`title`, `department`, `employee`) VALUES ('QA', '3', '1');
INSERT INTO `kcm_data`.`positions` (`title`, `department`, `employee`) VALUES ('chemist', '4', '2');
INSERT INTO `kcm_data`.`positions` (`title`, `department`, `employee`) VALUES ('manager Au', '5', '3');
INSERT INTO `kcm_data`.`positions` (`title`, `department`, `employee`) VALUES ('team leader', '6', '4');

INSERT INTO `kcm_data`.`country` (`name`, `currency`) VALUES ('Bulgaria', 'Bg');
INSERT INTO `kcm_data`.`country` (`name`, `currency`) VALUES ('Turkey', 'Turkish Lira');
INSERT INTO `kcm_data`.`country` (`name`, `currency`) VALUES ('United States', 'Usd');
INSERT INTO `kcm_data`.`country` (`name`, `currency`) VALUES ('United Kingdom', 'Gbp');
INSERT INTO `kcm_data`.`country` (`name`, `currency`) VALUES ('European union', 'Euro');

INSERT INTO `kcm_data`.`departments` (`name`, `workforce`) VALUES ('Turkey', '2030');
INSERT INTO `kcm_data`.`departments` (`name`, `workforce`) VALUES ('Macedonia', '500');
INSERT INTO `kcm_data`.`departments` (`name`, `workforce`) VALUES ('Holland', '50');

UPDATE `kcm_data`.`departments` SET `name`='Erdemir' WHERE `id`='7';
UPDATE `kcm_data`.`departments` SET `name`='Sasa' WHERE `id`='8';
UPDATE `kcm_data`.`departments` SET `name`='Mcm' WHERE `id`='9';

INSERT INTO `kcm_data`.`production` (`shift`, `type`, `department_id`, `production_date`, `name`, `lot`, `metric tones`) VALUES ('A', 'own', '2', '2017-11-12', 'Pb 99,99', '235', '150');
INSERT INTO `kcm_data`.`production` (`type`, `department_id`, `production_date`, `name`, `lot`, `metric tones`) VALUES ('outsorce', '7', '2015-11-23', 'Zn 99', '12', '40');
INSERT INTO `kcm_data`.`production` (`shift`, `type`, `department_id`, `production_date`, `name`, `lot`, `metric tones`) VALUES ('B', 'own', '1', '2016-01-11', 'shlak', '45', '200');
INSERT INTO `kcm_data`.`production` (`type`, `department_id`, `production_date`, `name`, `lot`, `metric tones`) VALUES ('outsorce', '8', '2016-04-09', 'Zn conc', '34', '438');

INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `arbitrage`, `lot`) VALUES ('1', '2017-01-01', 'own', 'yes', '235');
INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `arbitrage`, `lot`) VALUES ('1', '2017-01-22', 'outsorce', 'yes', '235');
INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `lot`) VALUES ('2', '2015-11-22', 'outsorce', '12');
INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `arbitrage`, `lot`) VALUES ('3', '2017-03-24', 'own', 'no', '45');
INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `arbitrage`, `lot`) VALUES ('3', '2017-04-25', 'own', 'no', '45');
INSERT INTO `kcm_data`.`analyses` (`production_id`, `date_analyzed`, `type`, `arbitrage`, `lot`) VALUES ('4', '2016-07-13', 'outsorce', 'yes', '34');

UPDATE `kcm_data`.`analyses` SET `id`='7', `arbitrage`='won' WHERE `id`='11';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='won' WHERE `id`='1';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='won' WHERE `id`='2';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='no' WHERE `id`='3';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='lost' WHERE `id`='4';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='lost' WHERE `id`='5';
UPDATE `kcm_data`.`analyses` SET `arbitrage`='won' WHERE `id`='6';

INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `Si20`, `Ag`, `Bi`, `Au`) VALUES ('17.34', '1', '55.65', '13.13', '0.0005', '0.0004', '0.0001');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `Si20`, `Ag`, `Bi`, `Au`) VALUES ('21.31', '2', '60.21', '12.45', '0.004', '0003', '0.002');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `ZnO`) VALUES ('99.995', '3', '0.0001');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `Si20`, `Ge`) VALUES ('10.11', '4', '1.20', '35.23', '23.21');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `Si20`, `Ge`) VALUES ('8.32', '5', '0.75', '45.36', '22.13');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `ZnO`, `Si20`, `Ge`) VALUES ('56.61', '6', '12.31', '12.11', '15.32', '24.23');
INSERT INTO `kcm_data`.`elements` (`Zn`, `analyse_id`, `Pb`, `ZnO`, `Si20`, `Ge`) VALUES ('71.12', '7', '11.78', '15.23', '12.15', '18.23');

INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1701', '521', '243', '40000');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1702', '750', '524', '55777');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1703', '745', '487', '53445');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1704', '811', '523', '35000');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1705', '911', '755', '61211');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1706', '889', '911', '58888');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1707', '621', '700', '45000');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1708', '357', '354', '25000');
INSERT INTO `kcm_data`.`month` (`month_code`, `shipments`, `analyses`, `metric tones`) VALUES ('1709', '455', '522', '38745');

