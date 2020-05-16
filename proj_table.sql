USE haz77;

CREATE TABLE `haz77`.`chefmozcuisine` (
  `fk_cu_placeID` INT NOT NULL,
  `fk_cu_Rcuisine` VARCHAR(45) NOT NULL);
  
CREATE TABLE `haz77`.`chefmozhours4` (
  `fk_hr_placeID` INT NOT NULL,
  `hours` VARCHAR(100) NOT NULL,
  `days` VARCHAR(45) NOT NULL);
  
CREATE TABLE `haz77`.`chefmozparking` (
  `fk_pa_placeID` INT NOT NULL,
  `parking_lot` VARCHAR(45) NOT NULL);

CREATE TABLE `haz77`.`chefmozaccepts` (
  `fk_a_placeID` INT NOT NULL,
  `Rpayment` VARCHAR(45) NOT NULL);



CREATE TABLE `haz77`.`userpayment` (
  `fk_p_userID` VARCHAR(45) NOT NULL,
  `Upayment` VARCHAR(45) NOT NULL);


CREATE TABLE `haz77`.`userprofile` (
  `userID` VARCHAR(45) NOT NULL,
  `latitude` VARCHAR(45) NOT NULL,
  `longitude` VARCHAR(45) NOT NULL,
  `smoker` VARCHAR(45) NOT NULL,
  `drink_level` VARCHAR(45) NOT NULL,
  `dress_preference` VARCHAR(45) NOT NULL,
  `ambience` VARCHAR(45) NOT NULL,
  `transport` VARCHAR(45) NOT NULL,
  `marital_status` VARCHAR(45) NOT NULL,
  `hijos` VARCHAR(45) NOT NULL,
  `birth_year` VARCHAR(45) NOT NULL,
  `interest` VARCHAR(45) NOT NULL,
  `personality` VARCHAR(45) NOT NULL,
  `religion` VARCHAR(45) NOT NULL,
  `activity` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `weight` VARCHAR(45) NOT NULL,
  `budget` VARCHAR(45) NOT NULL,
  `height` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`userID`));
  
CREATE TABLE `haz77`.`usercuisine` (
  `fk_c_userID` VARCHAR(45) NOT NULL,
  `fk_c_Rcuisine` VARCHAR(45) NULL);
  
CREATE TABLE `haz77`.`rating_final` (
  `fk_r_userID` VARCHAR(45) NOT NULL,
  `fk_r_placeID` INT NOT NULL,
  `rating` INT NOT NULL,
  `food_rating` INT NOT NULL,
  `service_rating` INT NOT NULL);

CREATE TABLE `haz77`.`geoplaces2` (
  `fk_geo_placeID` INT NOT NULL,
  `latitude` VARCHAR(45) NOT NULL,
  `longitude` VARCHAR(45) NOT NULL,
  `the_geom_meter` VARCHAR(200) NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(100) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  `alcohol` VARCHAR(45) NOT NULL,
  `smoking_area` VARCHAR(45) NOT NULL,
  `dress_code` VARCHAR(45) NOT NULL,
  `accessibility` VARCHAR(45) NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `url` VARCHAR(45) NOT NULL,
  `Rambience` VARCHAR(45) NOT NULL,
  `franchise` VARCHAR(45) NOT NULL,
  `area` VARCHAR(45) NOT NULL,
  `other_services` VARCHAR(45) NOT NULL);

CREATE TABLE `haz77`.`place` (
`placeID` INT NOT NULL,
  PRIMARY KEY (`placeID`));

CREATE TABLE `haz77`.`cuisine` (
`Rcuisine` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Rcuisine`));


#relationship
ALTER TABLE chefmozcuisine
ADD CONSTRAINT fk_cu_placeID
FOREIGN KEY (fk_cu_placeID) REFERENCES place(placeID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE chefmozaccepts
ADD CONSTRAINT fk_a_placeID
FOREIGN KEY (fk_a_placeID) REFERENCES place(placeID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE chefmozcuisine
ADD CONSTRAINT fk_cu_Rcuisine
FOREIGN KEY (fk_cu_Rcuisine) REFERENCES cuisine(Rcuisine)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE chefmozhours4
ADD CONSTRAINT fk_hr_placeID
FOREIGN KEY (fk_hr_placeID) REFERENCES place (placeID) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE chefmozparking
ADD CONSTRAINT fk_pa_placeID
FOREIGN KEY (fk_pa_placeID) REFERENCES place (placeID) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE userpayment
ADD CONSTRAINT fk_p_userID
FOREIGN KEY (fk_p_userID) REFERENCES userprofile (userID) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE usercuisine
ADD CONSTRAINT fk_c_userID
FOREIGN KEY (fk_c_userID) REFERENCES userprofile (userID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usercuisine
ADD CONSTRAINT fk_c_Rcuisine
FOREIGN KEY (fk_c_Rcuisine) REFERENCES cuisine (Rcuisine) 
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE rating_final
ADD CONSTRAINT fk_r_userID
FOREIGN KEY (fk_r_userID) REFERENCES userprofile (userID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rating_final
ADD CONSTRAINT fk_r_placeID
FOREIGN KEY (fk_r_placeID) REFERENCES place (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE geoplaces2
ADD CONSTRAINT fk_geo_placeID
FOREIGN KEY (fk_geo_placeID) REFERENCES place (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;


