-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE campaign (
    cf_id int   NOT NULL,
    contact_id int   NOT NULL,
    company_name varchar(100)   NOT NULL,
    description varchar(100)   NOT NULL,
    goal real   NOT NULL,
    pledged real   NOT NULL,
    outcome varchar(15)   NOT NULL,
    backers_count int   NOT NULL,
    country varchar(3)   NOT NULL,
    currency varchar(5)   NOT NULL,
    launched_date date   NOT NULL,
    end_date date   NOT NULL,
    category_id varchar(4)   NOT NULL,
    subcategory_id varchar(8)   NOT NULL,
    CONSTRAINT pk_campaign PRIMARY KEY (
        contact_id
     )
);

CREATE TABLE category (
    category varchar(4)   NOT NULL,
    categories varchar(15)   NOT NULL,
    CONSTRAINT pk_category PRIMARY KEY (
        category
     )
);

CREATE TABLE subcategory (
    subcategory varchar(8)   NOT NULL,
    subcategories varchar(30)   NOT NULL,
    CONSTRAINT pk_subcategory PRIMARY KEY (
        subcategory
     )
);

CREATE TABLE contacts (
    contact_id int   NOT NULL,
    first_name varchar(20)   NOT NULL,
    last_name varchar(20)   NOT NULL,
    email varchar(100)   NOT NULL,
    CONSTRAINT pk_contacts PRIMARY KEY (
        contact_id
     )
);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category (category);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory (subcategory);

ALTER TABLE contacts ADD CONSTRAINT fk_contacts_contact_id FOREIGN KEY(contact_id)
REFERENCES campaign (contact_id);

