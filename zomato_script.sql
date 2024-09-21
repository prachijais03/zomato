/*
	CREATE A DATABASE SCHEMA FOR ZOMATO
*/


/*

-- NOT NEEDED ANYMORE 

CREATE TABLE customer_profile (
	cid int AUTO_INCREMENT PRIMARY KEY,
    cname varchar(50) NOT NULL,
    cdob date,
    cmob decimal(10) NOT NULL,
    cemail varchar(100) NOT NULL,
    cgender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL
) AUTO_INCREMENT=10000;



Alter Table Customer_profile Drop column cname;
Alter Table Customer_profile Drop column cdob;
Alter Table Customer_profile Drop column cmob;
Alter Table Customer_profile Drop column cemail;
Alter Table Customer_profile Drop column cgender;
desc customer_profile;

alter table customer_profile add column profileid int;
alter table customer_profile add constraint fk_customer_profile foreign key(profileid) references profile(pid);

drop table customer_profile;

select * from customer_profile;

SHOW TABLES;
DESCRIBE customer_profile;

ALTER TABLE customer_profile MODIFY COLUMN cmob BIGINT;


INSERT INTO customer_profile (cname, cdob, cmob, cemail, cgender) VALUES 
	('John Doe', '1990-05-15', 8984984345, 'john.doe@example.com', 'MALE'),
    ('Jane Smith', '1985-09-20', 9876354678, 'jane.smith@example.com', 'FEMALE'),
    ('Alex Lee', '2000-03-10', 3764736476, 'alex.lee@example.com', 'DO NOT WANT TO SPECIFY'),
    ('Michael Brown', '1978-11-25', 9874635148, 'michael.brown@example.com', 'MALE'),
    ('Emily Johnson', '1995-07-12', 9874615748, 'emily.johnson@example.com', 'FEMALE'),
    ('Taylor Rodriguez', '1989-02-28', 9824635748, 'taylor.rodriguez@example.com', 'DO NOT WANT TO SPECIFY'),
    ('David White', '1982-08-05', 9874635248, 'david.white@example.com', 'MALE'),
    ('Olivia Garcia', '1998-04-18', 9874615748, 'olivia.garcia@example.com', 'FEMALE'),
    ('Jordan Kim', '1993-12-03', 9874635718, 'jordan.kim@example.com', 'DO NOT WANT TO SPECIFY'),
    ('Christopher Martinez', '1987-01-22', 9874135748, 'chris.martinez@example.com', 'MALE');

SELECT * FROM customer_profile;

CREATE TABLE owner_profile (
	oid int primary key auto_increment,
    oname varchar(50),
    odob date,
    omob bigint,
    oemail varchar(100),
    ogender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL
);
*/

/*
create table profile (
	pid int auto_increment primary key,
	pname varchar(50) NOT NULL,
    pdob date,
    pmob decimal(10) NOT NULL,
    pemail varchar(100) NOT NULL,
    pgender enum('MALE', 'FEMALE', 'DO NOT WANT TO SPECIFY') NOT NULL,
    ptype enum('CUSTOMER', 'OWNER', 'DELIVERY BOY') NOT NULL
) auto_increment=10000;
drop table profile;

describe profile;
alter table profile add column addressId int;
alter table profile add constraint fk_profile_address foreign key(addressId) references address(addressId);


-- Insert address 1
INSERT INTO address (line1, line2, line3, city, state, pincode)
VALUES ('123 Main Street', 'Apt 4B', NULL, 'Metropolis', 'CA', '12345');

-- Insert address 2
INSERT INTO address (line1, line2, line3, city, state, pincode)
VALUES ('456 Elm Avenue', NULL, NULL, 'Smalltown', 'NY', '54321');

select * from address;

-- Insert a customer profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('John Doe', '1990-05-15', 1234567890, 'john.doe@example.com', 'MALE', 'CUSTOMER', 100);

-- Insert an owner profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('Alice Smith', '1985-09-20', 9876543210, 'alice.smith@example.com', 'FEMALE', 'OWNER', 100);

-- Insert a delivery boy profile
INSERT INTO profile (pname, pdob, pmob, pemail, pgender, ptype, addressid)
VALUES ('Mike Johnson', '1995-07-12', 4444444444, 'mike.johnson@example.com', 'MALE', 'DELIVERY BOY', 101);


select * from profile;
*/


/*
Create Table user_profile (
user_id INT auto_increment PRIMARY KEY,
user_name varchar(100),
user_dob date NOT NULL,
user_emailid varchar(100) NOT NULL,
user_contactno decimal NOT NULL,
user_gender enum('male', 'female', 'DO NOT WANT TO SPECIFY') NOT NULL,
user_type enum ('customer_profile', 'Business_profile') NOT NULL
) auto_increment=1000;
*/
show tables;
desc user_profile;
drop table user_profile;
/*
create table messages(id int primary key auto_increment, message varchar(10));
desc messages;
insert into messages(message) value ("Hi");
insert into messages(message) value ("How");
insert into messages(message) value ("Are");
insert into messages(message) value ("you?");
select * from messages;
drop table messages;

-- start transaction;
set autocommit=0;
SET SQL_SAFE_UPDATES = 0;
update messages set message="duggu";
commit;

rollback;

show tables;
*/

SHOW DATABASES;
CREATE DATABASE zomato;
USE zomato;

create table addressZ (
	addressId int primary key auto_increment,
    line1 varchar(100),
    line2 varchar(100),
    line3 varchar(100),
    city varchar(20),
    state varchar(20),
    pincode varchar(6)
) auto_increment=100;

create table user_profile(
user_id int primary key auto_increment,
user_name varchar(100),
user_dob date,
user_emailid varchar(100),
user_type enum('customer','bussiness') not null,
user_addressid int,
foreign key (user_addressid) references address (addressid)
) auto_increment =1000;
desc user_profile;

create table user_address(
user_contactno int primary key auto_increment,
user_homeaddress varchar(100),
user_officeaddress varchar(100),
user_otheraddress varchar(100),
useraddressid int,
foreign key (useraddressid) references addressZ (addressId)
) auto_increment =1000;
desc user_address;

create table payment(
payment_id int primary key auto_increment,
payment_type enum('cod','card','upi','net banking','wallet','zomato money') not null,
payment_transactionid int,
pament_transaction_time date,
payment_transaction_status enum('failed','hold','successful') not null,
payment_user_name varchar(100) ,
payment_userid int,
-- foreign key (payment_user_name) references user_profile (user_name),
foreign key (payment_userid) references user_profile (user_id)
) auto_increment =1000;
desc payment;

create table resturant(
resturant_id int primary key auto_increment,
resturant_name varchar(100),
resturant_address varchar(100),
resturant_email_id varchar(100),
resturant_openingdate date,
resturant_userid int,
foreign key (resturant_userid) references user_profile(user_id)
) auto_increment =1000;

create table review(
review_customerid int primary key auto_increment,
review_resturant enum('outstanding','Good','Average','poor'),
review_resturantid int,
review_orderid int,
foreign key (review_customerid) references user_profile(user_id),
foreign key (review_resturantid ) references resturant(resturant_id)
) auto_increment=1000;

create table orders(
order_id int primary key auto_increment,
order_itemname varchar(100),
order_itemquantity int,
order_itemprice int,
order_address varchar(100),
order_addressid int,
order_resturantid int,
order_reviewid int,
order_paymentid int,
order_userid int,
foreign key (order_addressid) references addressZ(addressid),
foreign key (order_resturantid) references resturant(resturant_id),
foreign key (order_reviewid) references review(review_customerid),
foreign key (order_paymentid) references payment(payment_id),
foreign key (order_userid) references user_profile(user_id)
) auto_increment =1000;








