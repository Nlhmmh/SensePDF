-- Drop Database
DROP DATABASE IF EXISTS formpdf;

-- Create Database
CREATE DATABASE formpdf CHARACTER SET utf8 COLLATE utf8_general_ci;

-- Use Database before creating Table
USE formpdf;

-- Drop Table
DROP TABLE IF EXISTS form;

-- Create Tabel (form)
CREATE TABLE form
(
id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
date_to_submit varchar(200),
tax_office varchar(200),
prefecturalTaxOffice varchar(200),
selectForPrefecturalTaxOffice varchar(200),
municipalities varchar(200),
selectForMunicipalities varchar(200),
corporateNameFurigana varchar(200),
corporateName varchar(200),
headOfficeAddress1 varchar(200),
headOfficeAddress2 varchar(200),
companyPhoneNo varchar(200),
jurisdictionsAddress1 varchar(200),
jurisdictionsAddress2 varchar(200),
contactAddress1 varchar(200),
contactAddress2 varchar(200),
representativeFurigana varchar(200),
representativeName varchar(200),
representativeAddress1 varchar(200),
representativeAddress2 varchar(200),
capital varchar(200),
investment varchar(200),
companyFoundedDate varchar(200),
fiscalKara varchar(200),
fiscalMade varchar(200),
endOfFiscalYear varchar(200),
purposeOfBusiness varchar(200),
businessEvent varchar(200),
businessStartExpectedDate varchar(200),
officer varchar(200),
officerSalary varchar(200),
officeWorker varchar(200),
officeWorkerSalary varchar(200),
salesFactoryWorkers varchar(200),
salesFactoryWorkersSalary varchar(200),
others varchar(200),
othersSalary varchar(200),
taxFurigana varchar(200),
taxName varchar(200),
taxAddress varchar(200),
taxPhone varchar(200)
);

-- Insert Some Datas
INSERT INTO 
form (`id`,`date_to_submit`, `tax_office`)
VALUES
('1','2019-11-10','東京'),
('2','2020-01-01','大阪'),
('3','2020-01-01','Yangon'),
('4','2020-01-01','Mandalay');