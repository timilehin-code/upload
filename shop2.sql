-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 13, 2025 at 08:06 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop2`
--

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `session_id`, `created_at`) VALUES
(4, NULL, '97is25ljtjltfcj8kv7s0bm7gv', '2025-08-06 15:33:55'),
(5, NULL, '1tkl2mgrvcotva3o6ls3pembch', '2025-08-06 15:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `item_id` int(11) NOT NULL,
  `cart_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(2, 4, 2, 1),
(3, 4, 3, 1),
(4, 5, 3, 22),
(5, 5, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(100) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `parent_id`) VALUES
(1, 'Gaming', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_logs`
--

CREATE TABLE `inventory_logs` (
  `log_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `change_type` enum('restock','sale','adjustment') DEFAULT NULL,
  `quantity_change` int(11) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','paid','shipped','delivered','cancelled') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `method` enum('card','bank_transfer','wallet','cod') DEFAULT NULL,
  `payment_status` enum('pending','completed','failed') DEFAULT 'pending',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT 'active',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_name`, `description`, `price`, `stock`, `category_id`, `image_url`, `status`, `created_at`) VALUES
(1, 'PlayStation 5', 'The PlayStation 5 is Sony’s flagship gaming console, offering lightning-fast load times and revolutionary DualSense controller feedback. With a sleek futuristic design, it delivers 4K graphics and ray tracing for immersive gameplay.\n\nEquipped with a custom SSD and AMD Ryzen processor, the PS5 minimizes wait times and enhances game performance. Its Tempest 3D AudioTech also provides spatial sound, placing you right in the action.\n\nThe PS5 supports backward compatibility with most PS4 games, so your existing library still has value. With exclusive titles like *Spider-Man: Miles Morales* and *Horizon Forbidden West*, it leads the next-gen race.\n\nWhether you\'re a casual gamer or hardcore enthusiast, the PlayStation 5 elevates your gaming experience with raw power and refined design.', 599.00, 15, 1, 'https://placehold.co/250x200.png', 'active', '2025-08-01 17:31:15'),
(2, 'Xbox Series X', 'The Xbox Series X by Microsoft is a powerhouse console that brings true 4K gaming at up to 120 FPS. It boasts a minimalist, tower-style design and state-of-the-art architecture that ensures maximum performance.\n\nInside, the Series X packs a custom 8-core AMD Zen 2 processor and RDNA 2 GPU that delivers ultra-smooth gameplay with stunning visual fidelity. The 1TB NVMe SSD enables instant load times and fast resume for multiple titles.\n\nWith Game Pass Ultimate, you gain access to hundreds of titles including day-one releases from Xbox Game Studios. It’s also fully backward compatible with four generations of Xbox games.\n\nWhether you’re into multiplayer, open-world, or indie games, Xbox Series X is designed to handle it all without breaking a sweat.', 579.00, 10, 1, 'https://placehold.co/250x200.png', 'active', '2025-08-01 17:31:15'),
(3, 'Nintendo Switch OLED', 'The Nintendo Switch OLED edition upgrades the hybrid gaming experience with a stunning 7-inch OLED display. Whether you’re playing docked, tabletop, or handheld, the vibrant screen enhances every title.\n\nIts improved audio, wider kickstand, and 64GB of internal storage make it the best version of the Switch to date. The tactile joy-cons and flexible modes of play cater to all types of gamers.\n\nFrom casual titles like *Animal Crossing* to intense adventures like *Zelda: Breath of the Wild*, the Switch OLED handles them all beautifully. Multiplayer is seamless both online and locally.\n\nPerfect for gamers on the go, families, or anyone who values versatility, the Switch OLED is the most polished iteration of Nintendo’s iconic console yet.', 349.99, 20, 1, 'https://placehold.co/250x200.png', 'active', '2025-08-01 17:31:15'),
(4, 'Steam Deck', 'Valve’s Steam Deck is a handheld PC gaming machine that puts your entire Steam library in the palm of your hands. With a 7-inch touchscreen and customizable controls, it feels both powerful and personal.\n\nInside, it features a custom AMD APU optimized for handheld gaming, offering great performance on AAA titles and indie gems alike. It runs on SteamOS and supports Linux and Windows.\n\nSteam Deck allows you to dock and connect to a monitor, install game launchers like Epic or Battle.net, and even use it as a mini PC. The flexibility is unmatched in the handheld gaming world.\n\nFor gamers who want to take their full PC library anywhere, the Steam Deck is an exciting evolution in portable gaming.', 499.00, 8, 1, 'https://placehold.co/250x200.png', 'active', '2025-08-01 17:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `image_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `product_id`, `user_id`, `rating`, `comment`, `created_at`) VALUES
(1, 1, NULL, 5, 'The graphics on the PS5 are just insane. It feels like I\'m playing inside a movie.', '2025-08-01 17:31:15'),
(2, 1, NULL, 4, 'The new controller changes everything. It\'s super responsive and adds depth to gameplay.', '2025-08-01 17:31:15'),
(3, 1, NULL, 5, 'Sony knocked it out of the park. Fast load times, beautiful interface, and epic exclusives.', '2025-08-01 17:31:15'),
(4, 2, NULL, 4, 'Super quiet and super powerful. I’m impressed by the build and performance.', '2025-08-01 17:31:15'),
(5, 2, NULL, 4, 'Game Pass is a game changer. So many games at your fingertips!', '2025-08-01 17:31:15'),
(6, 2, NULL, 4, 'Everything loads lightning fast and looks stunning on my 4K TV.', '2025-08-01 17:31:15'),
(7, 3, NULL, 4, 'The OLED screen is a massive upgrade — colors pop and games feel more alive.', '2025-08-01 17:31:15'),
(8, 3, NULL, 5, 'Portable gaming never looked or felt this good. It’s a joy to use.', '2025-08-01 17:31:15'),
(9, 3, NULL, 5, 'Finally a Switch that feels premium. Totally worth the upgrade!', '2025-08-01 17:31:15'),
(10, 4, NULL, 5, 'It’s like having a portable gaming laptop. Plays everything I throw at it!', '2025-08-01 17:31:15'),
(11, 4, NULL, 4, 'Build quality is great, controls feel solid, and the freedom is amazing.', '2025-08-01 17:31:15'),
(12, 4, NULL, 5, 'Absolutely revolutionary. It’s a real PC that fits in your hands.', '2025-08-01 17:31:15');

-- --------------------------------------------------------

--
-- Table structure for table `shipping_addresses`
--

CREATE TABLE `shipping_addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `recipient_name` varchar(255) DEFAULT NULL,
  `address_line` text DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipping_addresses`
--

INSERT INTO `shipping_addresses` (`address_id`, `user_id`, `recipient_name`, `address_line`, `city`, `state`, `postal_code`, `country`, `phone`) VALUES
(1, 1, 'Tima Bello', '2 oluwaseyi close', 'Ota', 'Ogun State', '112212', 'Nigeria', '07055750001'),
(2, 1, 'Tima Bello', '2 oluwaseyi close', 'Ota', 'Ogun State', '112212', 'Nigeria', '07055750001');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `fname` varchar(100) DEFAULT NULL,
  `mname` varchar(100) DEFAULT NULL,
  `lname` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `fname`, `mname`, `lname`, `email`, `password_hash`, `phone`, `address`, `created_at`) VALUES
(1, 'Elijah', NULL, 'Bello', 'user@shop2.com', '4QrcOUm6WauvVgV/IPiDzg==', '08032827959', '5, Oluwaseyi Close, Toll-gate Bus Stop, Ado-Odo/Ota, Ogun State', '2025-08-13 16:15:09');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`),
  ADD UNIQUE KEY `category_name` (`category_name`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `image_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `inventory_logs`
--
ALTER TABLE `inventory_logs`
  ADD CONSTRAINT `inventory_logs_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `shipping_addresses`
--
ALTER TABLE `shipping_addresses`
  ADD CONSTRAINT `shipping_addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `wishlists_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
