CREATE DATABASE `transactions` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE transactions;

-- transactions.AccountBalances definition

CREATE TABLE `AccountBalances` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_date` varchar(255) DEFAULT NULL,
  `account` decimal(20,0) DEFAULT NULL,
  `trans_code` varchar(255) DEFAULT NULL,
  `amountbalance` int DEFAULT NULL,
  `amount_receivable` int DEFAULT NULL,
  `amount_ow` int DEFAULT NULL,
  `amount_success` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- transactions.Accounts definition

CREATE TABLE `Accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `account_no` decimal(20,0) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- transactions.Customers definition

CREATE TABLE `Customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `id_no` varchar(255) DEFAULT NULL,
  `account_no` int DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- transactions.SequelizeMeta definition

CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;


-- transactions.TransactionTypes definition

CREATE TABLE `TransactionTypes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_code` varchar(255) DEFAULT NULL,
  `trans_prefix` varchar(255) DEFAULT NULL,
  `trans_effect` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- transactions.Transactions definition

CREATE TABLE `Transactions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_date` varchar(255) DEFAULT NULL,
  `trans_code` varchar(255) DEFAULT NULL,
  `account_source` decimal(20,0) DEFAULT NULL,
  `account_destination` decimal(20,0) DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `amount_owe` int DEFAULT NULL,
  `amount_success` int DEFAULT NULL,
  `amount_balance_start` int DEFAULT NULL,
  `amount_balance` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- content
INSERT INTO transactions.Accounts (firstname,middlename,lastname,id_no,account_no,username,password,createdAt,updatedAt) VALUES
	 ('Alice',' ',' ','1234',1234,'Alice','1234','2022-07-17 16:27:45','2022-07-17 16:27:45'),
	 ('Bob',' ',' ','2345',2345,'Bob','2345','2022-07-17 16:27:45','2022-07-17 16:27:45');


INSERT INTO transactions.AccountBalances (trans_date,account,trans_code,amountbalance,amount_receivable,amount_ow,amount_success,createdAt,updatedAt) VALUES
	 ('2022-07-17 16:27:45',1234,'0',0,NULL,0,0,'2022-07-17 16:27:45','2022-07-17 16:28:25'),
	 ('2022-07-17 16:27:45',2345,'0',0,NULL,0,0,'2022-07-17 16:27:45','2022-07-17 16:28:25');

INSERT INTO transactions.Transactions (trans_date,trans_code,account_source,account_destination,amount,amount_owe,amount_success,amount_balance_start,amount_balance,createdAt,updatedAt) VALUES
	 ('2022-07-17 16:27:45','c',12341234,NULL,0,0,0,0,0,'2022-07-17 16:27:45','2022-07-17 16:27:45'),
	 ('2022-07-17 16:27:45','c',23452345,NULL,0,0,0,0,0,'2022-07-17 16:27:45','2022-07-17 16:27:45');