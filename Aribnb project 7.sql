create database Aribnb;
use Aribnb;
create table aribnb_hosts(host_id INT primary key,
host_name VARCHAR(150),
host_since DATE,
host_location VARCHAR(150),
host_response_time VARCHAR(200),
host_response_rate INT,
host_acceptance_rate INT,
host_is_superhost BOOLEAN,
host_neighbourhood VARCHAR(100),
host_listings_count INT,
host_has_profile_pic BOOLEAN,
host_identity_verified BOOLEAN
);
insert into aribnb_hosts values(100,'amazon','1997-09-09','uk','monday',10000,12000,1,'walmart',1200,1,1),(200,'puma','1990-07-09','new york','friday',20000,230000,1,'nike',1300,1,0);
select * from aribnb_hosts;

CREATE TABLE listing (
    id INT,
    listing_name VARCHAR(100),
    street VARCHAR(300),
    neighbourhood_cleansed VARCHAR(150),
    neighbourhood_group_cleansed VARCHAR(150),
    city VARCHAR(150),
    state VARCHAR(5),
    zipcode VARCHAR(20),
    latitude FLOAT,
    longitude FLOAT,
    is_location_exact BOOLEAN,
    property_type VARCHAR(150),
    room_type VARCHAR(150),
    accommodates INT,
    bathrooms INT,
    bedrooms INT,
    beds INT,
    bed_type VARCHAR(200),
    square_feet INT,
    price FLOAT,
    weekly_price FLOAT,
    monthly_price FLOAT,
    security_deposit FLOAT,
    cleaning_fee FLOAT,
    guests_included INT,
    extra_people FLOAT,
    minimum_nights INT,
    maximum_nights INT,
    has_availability BOOLEAN,
    availability_30 INT,
    availability_60 INT,
    availability_90 INT,
    availability_365 INT,
    calendar_updated DATE,
    number_of_reviews INT,
    first_review DATE,
    last_review DATE,
    review_scores_rating INT,
    review_scores_accuracy INT,
    review_scores_cleanliness INT,
    review_scores_checkin INT,
    review_scores_communication INT,
    review_scores_location INT,
    review_scores_value INT,
    requires_license BOOLEAN,
    instant_bookable BOOLEAN,
    cancellation_policy VARCHAR(200),
    require_guest_profile_picture BOOLEAN,
    require_guest_phone_verification BOOLEAN,
    reviews_per_month FLOAT,
    host_id INT,
    FOREIGN KEY (host_id)
        REFERENCES aribnb_hosts (host_id)
);
insert into listing values(201,'tcs','mtm','yes','yes','nagercoil','goa','nalloor',12.0,10.2,1,'asset','delux',12,4,3,5,'good',12,1500,2000,1000,12.0,2.0,2000,3.0,2,5,1,1,2,3,4,'2012-09-9-09',30,'2012-09-12','2022-08-23',1,2,3,4,5,6,7,1,12,'yes',1,1,1.0,100);
select * from listing;
alter table listing modify column id int primary key;

CREATE TABLE property_availability (
    listing_id INT,
    FOREIGN KEY (listing_id)
        REFERENCES listing (id),
    available_date DATE,
    available BOOLEAN,
    price FLOAT
);
insert into property_availability values(201,'2022-12-09',1,1800);
alter table property_availability modify column listing_id int primary key;


create table property_reviews (review_id INT primary key,
listing_id INT,foreign key(listing_id) references property_availability(listing_id),
review_date DATE,
reviewer_id INT,
reviewer_name VARCHAR(100),
comments MEDIUMTEXT
);
insert into property_reviews values(1201,201,'2012-05-12',1001,'sam bilings','not bad');

-- 2 --

SELECT 
    h.host_name,
    h.host_id,
    h.host_location,
    l.listing_name,
    l.street,
    l.city
FROM
    aribnb_hosts h
        JOIN
    listing l ON h.host_id = l.host_id;

-- 3 --

SELECT 
    beds, bedrooms, bed_type
FROM
    listing;

-- 4 --


-- 5 --

SELECT 
    p.price, p.available_date, r.review_date, r.reviewer_id
FROM
    property_availability p
        LEFT JOIN
    property_reviews r ON p.listing_id = r.listing_id; 
    
-- 6 --

SELECT 
    review_id, listing_id, reviewer_id
FROM
    property_reviews;

-- 7 --

	SELECT 
    review_scores_rating,
    review_scores_accuracy,
    review_scores_cleanliness,
    review_scores_checkin,
    review_scores_communication,
    review_scores _location
FROM
    listing;
