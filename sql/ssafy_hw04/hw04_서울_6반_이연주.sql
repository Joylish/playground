CREATE TABLE `user` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `created_at` datetime DEFAULT (now()),
  `postcode` int,
  `address` varchar(255),
  `contact1` varchar(255),
  `contact2` varchar(255)
);

CREATE TABLE `order_item` (
  `order_id` int,
  `product_number` varchar(30),
  `quantity` int DEFAULT 1,
  PRIMARY KEY (`order_id`, `product_number`)
);

CREATE TABLE `order` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `user_id` int,
  `ordered_at` datetime DEFAULT (now()),
  `payment_status` ENUM ('before', 'completed'),
  `delivery_status` ENUM ('preparing_for_delivery', 'release', 'send', 'completed'),
  `sheeping_fee` int DEFAULT 0,
  `total_order_amount` int DEFAULT 0
);

CREATE TABLE `payment` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `paid_at` datetime,
  `payment_by` ENUM ('by_deposit', 'by_mobile', 'by_card') DEFAULT (now()),
  `sheeping_fee` int DEFAULT 0,
  `total_order_amount` int DEFAULT 0
);

CREATE TABLE `delivery` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `order_id` int,
  `receiver` varchar(255),
  `postcode` int,
  `address` varchar(255),
  `contact1` varchar(255),
  `contact2` varchar(255),
  `memo` varchar(255)
);

CREATE TABLE `product` (
  `product_number` varchar(30) PRIMARY KEY,
  `name` varchar(255),
  `desc` varchar(255),
  `price` int,
  `stock` int DEFAULT 0,
  `created_at` datetime DEFAULT (now())
);

ALTER TABLE `order_item` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `order_item` ADD FOREIGN KEY (`product_number`) REFERENCES `product` (`product_number`);

ALTER TABLE `order` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

ALTER TABLE `payment` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

ALTER TABLE `delivery` ADD FOREIGN KEY (`order_id`) REFERENCES `order` (`id`);

