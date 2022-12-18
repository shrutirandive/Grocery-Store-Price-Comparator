USE Grocery_Recommendation_System_Final;

-- CREATE TABLE FOR NORMALISATION

CREATE TABLE walmart_product
SELECT search_text, product_price, product_rating, quantity, product_name, category, prd_id, availability
FROM walmart_products_df;

CREATE TABLE walmart_product_branch
SELECT zipcode, branch_id, prd_id
FROM walmart_products_df;

CREATE TABLE walmart_product_links
SELECT store_link, prd_id, product_link
FROM walmart_products_df;

CREATE TABLE target_product
SELECT search_text, product_price, product_rating, quantity, product_name, category, prd_id, availability
FROM target_products_df;

CREATE TABLE target_product_branch
SELECT zipcode, branch_id, prd_id
FROM target_products_df;

CREATE TABLE target_product_links
SELECT store_link, prd_id, product_link
FROM target_products_df;

CREATE TABLE samsclub_product
SELECT search_text, product_price, product_rating, quantity, product_name, category, prd_id, availability
FROM samsclub_products_df;

CREATE TABLE samsclub_product_branch
SELECT zipcode, branch_id, prd_id
FROM samsclub_products_df;

CREATE TABLE samsclub_product_links
SELECT store_link, prd_id, product_link
FROM samsclub_products_df;

-- ADDING CONSTRAINTS TO MERCHANT BRANCH TABLE

ALTER TABLE walmart_branch
ADD CONSTRAINT `walmart_branch_fk1`
FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id);

ALTER TABLE target_branch
ADD CONSTRAINT `target_branch_fk1`
FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id);

ALTER TABLE samsclub_branch
ADD CONSTRAINT `samsclub_branch_fk1`
FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id);

ALTER TABLE instacart_products
ADD CONSTRAINT `instacart_products_fk1`
FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id);

-- ADDING CONSTRAINTS FOR MERCHANT EMPLOYEE TABLES
ALTER TABLE walmart_employees
MODIFY COLUMN branch_id INT;

ALTER TABLE target_employees
MODIFY COLUMN branch_id INT;

ALTER TABLE samsclub_employees
MODIFY COLUMN branch_id INT;

ALTER TABLE walmart_employees
ADD CONSTRAINT PRIMARY KEY (emp_id),
ADD CONSTRAINT `walmart_emp_fk1`
FOREIGN KEY (branch_id) REFERENCES walmart_branch(branch_id);

ALTER TABLE target_employees
ADD CONSTRAINT PRIMARY KEY (emp_id),
ADD CONSTRAINT `target_emp_fk1`
FOREIGN KEY (branch_id) REFERENCES target_branch(branch_id);

ALTER TABLE samsclub_employees
ADD CONSTRAINT PRIMARY KEY (emp_id),
ADD CONSTRAINT `samsclub_emp_fk1`
FOREIGN KEY (branch_id) REFERENCES samsclub_branch(branch_id);

-- ADDING CONSTRAINTS FOR NORMALISED TABLES

ALTER TABLE walmart_product_branch
MODIFY COLUMN branch_id INT;

ALTER TABLE target_product_branch
MODIFY COLUMN branch_id INT;

ALTER TABLE samsclub_product_branch
MODIFY COLUMN branch_id INT;

ALTER TABLE walmart_product
ADD CONSTRAINT PRIMARY KEY (prd_id);

ALTER TABLE target_product
ADD CONSTRAINT PRIMARY KEY (prd_id);

ALTER TABLE samsclub_product
ADD CONSTRAINT PRIMARY KEY (prd_id);

ALTER TABLE walmart_product_branch
ADD CONSTRAINT `walmart_product_branch_fk1`
FOREIGN KEY (branch_id) REFERENCES walmart_branch(branch_id);

ALTER TABLE target_product_branch
ADD CONSTRAINT `target_product_branch_fk1`
FOREIGN KEY (branch_id) REFERENCES target_branch(branch_id);

ALTER TABLE samsclub_product_branch
ADD CONSTRAINT `samsclub_product_branch_fk1`
FOREIGN KEY (branch_id) REFERENCES samsclub_branch(branch_id);

ALTER TABLE walmart_product_branch
ADD CONSTRAINT `walmart_product_branch_fk2`
FOREIGN KEY (prd_id) REFERENCES walmart_product(prd_id);

ALTER TABLE target_product_branch
ADD CONSTRAINT `target_product_branch_fk2`
FOREIGN KEY (prd_id) REFERENCES target_product(prd_id);

ALTER TABLE samsclub_product_branch
ADD CONSTRAINT `samsclub_product_branch_fk2`
FOREIGN KEY (prd_id) REFERENCES samsclub_product(prd_id);

ALTER TABLE walmart_product_links
ADD CONSTRAINT `walmart_product_links_fk1`
FOREIGN KEY (prd_id) REFERENCES walmart_product(prd_id);

ALTER TABLE target_product_links
ADD CONSTRAINT `target_product_links_fk1`
FOREIGN KEY (prd_id) REFERENCES target_product(prd_id);

ALTER TABLE samsclub_product_links
ADD CONSTRAINT `samsclub_product_links_fk1`
FOREIGN KEY (prd_id) REFERENCES samsclub_product(prd_id);

-- ADDING CONSTRAINTS FOR EMPLOYEE SALARY TABLES

ALTER TABLE samsclub_emp_salary
ADD CONSTRAINT `samsclub_emp_salary_fk1`
FOREIGN KEY (emp_id) REFERENCES samsclub_employees(emp_id);

ALTER TABLE target_emp_salary
ADD CONSTRAINT `target_emp_salary_fk1`
FOREIGN KEY (emp_id) REFERENCES target_employees(emp_id);

ALTER TABLE walmart_emp_salary
ADD CONSTRAINT `walmart_emp_salary_fk1`
FOREIGN KEY (emp_id) REFERENCES walmart_employees(emp_id);

-- DROPPING Date Of Birth Column from Employee Table

ALTER TABLE walmart_employees
DROP COLUMN dob;

ALTER TABLE target_employees
DROP COLUMN dob;

ALTER TABLE samsclub_employees
DROP COLUMN dob;

