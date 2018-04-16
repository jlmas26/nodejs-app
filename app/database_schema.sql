-- Criar database
CREATE DATABASE `notes`;

-- Criar tabela
CREATE TABLE `notes`.`Note` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Text` varchar(255) NOT NULL,
  `CreateDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1;

-- Criar conta exclusiva para acesso da aplicacao 
CREATE USER 'notes-api' IDENTIFIED BY 'notes-api';

-- Conceder privilegios
GRANT ALL PRIVILEGES ON *.* TO 'notes-api';