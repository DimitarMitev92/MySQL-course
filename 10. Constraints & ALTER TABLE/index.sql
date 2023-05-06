-- UNIQUE
CREATE TABLE contacts (
	name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL UNIQUE
);

INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

-- This insert would result in an error:
INSERT INTO contacts (name, phone)
VALUES ('billybob', '8781213455');

--CHECK
CREATE TABLE users (
	username VARCHAR(20) NOT NULL,
    age INT CHECK (age > 0)
);

CREATE TABLE palindromes (
  word VARCHAR(100) CHECK(REVERSE(word) = word)
)

--NAME CONSTRAINTS
CREATE TABLE users2 (
    username VARCHAR(20) NOT NULL,
    age INT,
    CONSTRAINT age_not_negative CHECK (age >= 0)
);

CREATE TABLE palindromes2 (
  word VARCHAR(100),
  CONSTRAINT word_is_palindrome CHECK(REVERSE(word) = word)
);

--MULTIPLE COLUMN CONSTRAINTS
CREATE TABLE companies (
    name VARCHAR(255) NOT NULL,
    address VARCHAR(255) NOT NULL,
    CONSTRAINT name_address UNIQUE (name , address)
);

CREATE TABLE houses (
  purchase_price INT NOT NULL,
  sale_price INT NOT NULL,
  CONSTRAINT sprice_gt_pprice CHECK(sale_price >= purchase_price)
);

--ALTER TABLE adding columns
ALTER TABLE companies 
ADD COLUMN phone VARCHAR(15);

ALTER TABLE companies
ADD COLUMN employee_count INT NOT NULL DEFAULT 1;

--ALTER TABLE dropping columns
ALTER TABLE companies DROP COLUMN phone;

--ALTER TABLE renaming
ALTER TABLE companies
RENAME COLUMN name TO company_name;

--ALTER TABLE modifying columns
ALTER TABLE companies
MODIFY company_name VARCHAR(100) DEFAULT 'unknown';

--ALTER TABLE constraints
ALTER TABLE houses 
ADD CONSTRAINT positive_pprice CHECK (purchase_price >= 0);