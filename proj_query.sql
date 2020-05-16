USE haz77;

#A
SELECT Upayment, COUNT(Upayment) AS MOST_COMMON
FROM userpayment
GROUP BY Upayment
ORDER BY COUNT(Upayment) DESC LIMIT 1;

#B
SELECT chefmozcuisine.fk_cu_placeID , COUNT(chefmozcuisine.fk_cu_placeID) AS `cuis`, geoplaces2.name
FROM geoplaces2
JOIN place ON geoplaces2.fk_geo_placeID = place.placeID
JOIN chefmozcuisine ON chefmozcuisine.fk_cu_placeID = place.placeID
GROUP BY chefmozcuisine.fk_cu_Rcuisine, geoplaces2.name, chefmozcuisine.fk_cu_placeID
ORDER BY `cuis` DESC, name DESC LIMIT 5;




#D
select city, COUNT(fk_geo_placeID) AS num_of_restaurants
FROM geoplaces2
GROUP BY city
ORDER BY num_of_restaurants DESC LIMIT 1;

#E
SELECT city, geoplaces2.fk_geo_placeID, geoplaces2.name, AVG(rating_final.rating) AS AVG_RATING
FROM geoplaces2
JOIN rating_final ON geoplaces2.fk_geo_placeID = rating_final.fk_r_placeID
GROUP BY city, geoplaces2.fk_geo_placeID, geoplaces2.name
ORDER BY AVG_RATING DESC LIMIT 1;
