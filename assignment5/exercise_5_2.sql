SELECT `users`.`id`, `users`.`name`, `tickets`.`seat_number` 
FROM `tickets` INNER JOIN `users` 
ON `users`.`id` = `tickets`.`user` AND `tickets`.`train` = 11
ORDER BY `tickets`.`seat_number` ASC;

SELECT `users`.`id`, `users`.`name`, Count(*) AS `trains_count`, Sum(`trains`.`distance`) AS `total_distance`
FROM `tickets` INNER JOIN `trains` ON `trains`.`id` = `tickets`.`train`
INNER JOIN `users` ON `users`.`id` = `tickets`.`user` GROUP BY `users`.`id`
ORDER BY `total_distance` DESC LIMIT 6;

SELECT `types`.`name` AS `type`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, `trains`.`departure`, `trains`.`arrival`, 
Round(`types`.`fare_rate` * `trains`.`distance` * 0.001, -2) AS `fare`
FROM `trains` INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON  `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id` 
ORDER BY `fair` ASC;

SELECT `trains`.`id`, `types`.`name` AS `type`, `src`.`name` AS `src_stn`, `dst`.`name` AS `dst_stn`, Count(*) AS `occupied`, `type`.`max_seats` AS `maximum` 
FROM `tickets` INNER JOIN `trains` AS `tickets`.`train` = `trains`.`id`
INNER JOIN `types` ON `trains`.`type` = `types`.`id`
INNER JOIN `stations` AS `src` ON  `trains`.`source` = `src`.`id`
INNER JOIN `stations` AS `dst` ON `trains`.`destination` = `dst`.`id` 
GROUP BY `tickets`.`train`
ORDER BY `trains`.`id` ASC;
