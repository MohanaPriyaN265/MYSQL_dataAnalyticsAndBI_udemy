USE SALES;
CREATE TABLE SALES
(
	PURCHASE_NUMBER INT NOT NULL PRIMARY KEY auto_increment,
    DATE_OF_PURCHASE DATE NOT NULL,
    CUSTOMER_ID INT,
    ITEM_CODE VARCHAR(10) NOT NULL
);
ALTER TABLE SALES
ADD FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMERS (CUSTOMER_ID) ON DELETE CASCADE;

ALTER TABLE SALES
DROP FOREIGN KEY sales_ibfk_1;
DROP TABLE SALES;

CREATE TABLE SALES
(
	PURCHASE_NUMBER INT auto_increment,
    DATE_OF_PURCHASE DATE NOT NULL,
    CUSTOMER_ID INT,
    ITEM_CODE VARCHAR(10) NOT NULL,
PRIMARY KEY (PURCHASE_NUMBER)
);



CREATE TABLE CUSTOMERS
(
	CUSTOMER_ID INT AUTO_INCREMENT ,
    FIRST_NAME VARCHAR(255) ,
    LAST_NAME VARCHAR(255) ,
    EMAIL_ADDRESS VARCHAR(255),
    NUMBER_OF_COMPLAINTS INT, 
PRIMARY KEY (CUSTOMER_ID)
);
ALTER TABLE CUSTOMERS
ADD COLUMN GENDER ENUM('M','F') AFTER LAST_NAME;

ALTER TABLE CUSTOMERS
CHANGE COLUMN NUMBER_OF_COMPLAINTS NUMBER_OF_COMPLAINTS INT DEFAULT 0;

INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,GENDER,EMAIL_ADDRESS,NUMBER_OF_COMPLAINTS)
VALUES('JOHN','MACKINLEY','M','JOHN.MCKINLEY@365CAREERS.COM',0);

INSERT INTO CUSTOMERS(FIRST_NAME,LAST_NAME,GENDER)
VALUES('PETER','FIGARO','M');

SELECT * FROM CUSTOMERS;


ALTER TABLE CUSTOMERS
ADD UNIQUE KEY (EMAIL_ADDRESS);

ALTER TABLE CUSTOMERS
DROP INDEX EMAIL_ADDRESS;
    
SELECT * FROM SALES.CUSTOMERS;
    
DROP TABLE CUSTOMERS;

CREATE TABLE COMPANIES (
    COMPANY_ID INTEGER,
    COMPANY_NAME VARCHAR(255) NOT NULL,
    HEADQUARTERS_PHONE_NUMBER VARCHAR(255),
    PRIMARY KEY (COMPANY_ID)
)
;

ALTER TABLE COMPANIES
MODIFY COMPANY_NAME VARCHAR(255) NULL;

ALTER TABLE COMPANIES
CHANGE COLUMN COMPANY_ID COMPANY_ID INTEGER AUTO_INCREMENT;

DROP TABLE COMPANIES;
