-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2023 at 09:11 AM
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
-- Database: `online_rest`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adm_id`, `username`, `password`, `email`, `code`, `date`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'admin@gmail.com', '', '2021-04-07 08:40:28');

--
-- Triggers `admin`
--
DELIMITER $$
CREATE TRIGGER `admin_delete_trigger` AFTER DELETE ON `admin` FOR EACH ROW BEGIN
    INSERT INTO `admin_audit` (adm_id, username, password, email, code, old_data, type, new_data)
    VALUES (
        OLD.adm_id,
        OLD.username,
        OLD.password,
        OLD.email,
        OLD.code,
        CONCAT('Old data: adm_id=', OLD.adm_id, ', username=', OLD.username, ', password=', OLD.password, ', email=', OLD.email, ', code=', OLD.code),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `admin_update_trigger` AFTER UPDATE ON `admin` FOR EACH ROW BEGIN
    INSERT INTO `admin_audit` (adm_id, username, password, email, code, old_data, type, new_data)
    VALUES (
        OLD.adm_id,
        OLD.username,
        OLD.password,
        OLD.email,
        OLD.code,
        CONCAT('Old data: adm_id=', OLD.adm_id, ', username=', OLD.username, ', password=', OLD.password, ', email=', OLD.email, ', code=', OLD.code),
        'Update',
        CONCAT('New data: adm_id=', NEW.adm_id, ', username=', NEW.username, ', password=', NEW.password, ', email=', NEW.email, ', code=', NEW.code)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_audit`
--

CREATE TABLE `admin_audit` (
  `id` int(11) NOT NULL,
  `adm_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `code` varchar(222) NOT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`d_id`, `rs_id`, `title`, `slogan`, `price`, `img`) VALUES
(1, 1, 'Paneer Saag', 'Cottage cheese cooked with fresh ground spinach, onion, garlic and indian herbs.', 390.00, '606d72f3cb12f.jpg'),
(2, 1, 'Chicken Achari', 'Dahi, achar, tomatoes, mustard oil, fennel seeds', 250.00, '606d73302ece2.jpg'),
(3, 1, 'Murgh Tikka Biryani', 'Chicken Tikka Biryani Recipe is the famous Indian delicacy of Punjabi Cuisine. Boneless Chicken is marinated in spicy mix of Yogurt and Spices.', 470.00, '606d73771366a.jpg'),
(4, 1, 'Murgh Zafrani Kabab', 'Murgh Zafrani Kabab. A plateful of succulent pieces of meat, straight out of tandoor, is tough to resist.', 380.00, '606d73d2d37f4.jpg'),
(5, 2, 'Pink Spaghetti Gamberoni', 'Spaghetti pasta, grilled shrimps, parmesan cheese, with our homemade pink sauce,', 380.00, '606d7491a9d13.jpg'),
(6, 2, 'Cheesy Mashed Potato', 'Covered with mozzarella cheese.', 250.00, '606d74c416da5.jpg'),
(7, 2, 'Crispy Chicken Strips', 'Fried chicken strips, served with special honey mustard sauce.', 460.00, '606d74f6ecbbb.jpg'),
(8, 2, 'Lemon Grilled Chicken And Pasta', 'Marinated rosemary grilled chicken breast served with mashed potatoes and your choice of pasta.', 380.00, '606d752a209c3.jpg'),
(9, 3, 'Vegetable Fried Rice', 'Chinese rice wok with cabbage, beans, carrots, and spring onions.', 350.00, '606d7575798fb.jpg'),
(10, 3, 'Prawn Crackers', '12 pieces deep-fried prawn crackers', 120.00, '606d75a7e21ec.jpg'),
(11, 3, 'Spring Rolls', 'Lightly seasoned shredded cabbage, onion and carrots, wrapped in house made spring roll wrappers, deep fried to golden brown.', 470.00, '606d75ce105d0.jpg'),
(12, 3, 'Manchurian Chicken', 'Chicken pieces slow cooked with spring onions in our house made manchurian style sauce.', 500.00, '606d7600dc54c.jpg'),
(13, 4, ' Buffalo Wings', 'Fried chicken wings tossed in spicy Buffalo sauce served with crisp celery sticks and Blue cheese dip.', 450.00, '606d765f69a19.jpg'),
(14, 4, 'Mac N Cheese Bites', 'Served with our traditional spicy queso and marinara sauce.', 350.00, '606d768a1b2a1.jpg'),
(15, 4, 'Signature Potato Twisters', 'Spiral sliced potatoes, topped with our traditional spicy queso, Monterey Jack cheese, pico de gallo, sour cream and fresh cilantro.', 320.00, '606d76ad0c0cb.jpg'),
(16, 4, 'Meatballs Penne Pasta', 'Garlic-herb beef meatballs tossed in our house-made marinara sauce and penne pasta topped with fresh parsley.', 470.00, '606d76eedbb99.jpg');

--
-- Triggers `dishes`
--
DELIMITER $$
CREATE TRIGGER `dishes_delete_trigger` AFTER DELETE ON `dishes` FOR EACH ROW BEGIN
    INSERT INTO `dishes_audit` (d_id, rs_id, title, slogan, price, img, old_data, type, new_data)
    VALUES (
        OLD.d_id,
        OLD.rs_id,
        OLD.title,
        OLD.slogan,
        OLD.price,
        OLD.img,
        CONCAT('Old data: d_id=', OLD.d_id, ', rs_id=', OLD.rs_id, ', title=', OLD.title, ', slogan=', OLD.slogan, ', price=', OLD.price, ', img=', OLD.img),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `dishes_update_trigger` AFTER UPDATE ON `dishes` FOR EACH ROW BEGIN
    INSERT INTO `dishes_audit` (d_id, rs_id, title, slogan, price, img, old_data, type, new_data)
    VALUES (
        OLD.d_id,
        OLD.rs_id,
        OLD.title,
        OLD.slogan,
        OLD.price,
        OLD.img,
        CONCAT('Old data: d_id=', OLD.d_id, ', rs_id=', OLD.rs_id, ', title=', OLD.title, ', slogan=', OLD.slogan, ', price=', OLD.price, ', img=', OLD.img),
        'Update',
        CONCAT('New data: d_id=', NEW.d_id, ', rs_id=', NEW.rs_id, ', title=', NEW.title, ', slogan=', NEW.slogan, ', price=', NEW.price, ', img=', NEW.img)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dishes_audit`
--

CREATE TABLE `dishes_audit` (
  `id` int(11) NOT NULL,
  `d_id` int(222) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `slogan` varchar(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img` varchar(222) NOT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `remark`
--

CREATE TABLE `remark` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `remark`
--
DELIMITER $$
CREATE TRIGGER `remark_delete_trigger` AFTER DELETE ON `remark` FOR EACH ROW BEGIN
    INSERT INTO `remark_audit` (frm_id, status, remark, remarkDate, old_data, type, new_data)
    VALUES (
        OLD.frm_id,
        OLD.status,
        OLD.remark,
        OLD.remarkDate,
        CONCAT('Old data: frm_id=', OLD.frm_id, ', status=', OLD.status, ', remark=', OLD.remark, ', remarkDate=', OLD.remarkDate),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `remark_update_trigger` AFTER UPDATE ON `remark` FOR EACH ROW BEGIN
    INSERT INTO `remark_audit` (frm_id, status, remark, remarkDate, old_data, type, new_data)
    VALUES (
        OLD.frm_id,
        OLD.status,
        OLD.remark,
        OLD.remarkDate,
        CONCAT('Old data: frm_id=', OLD.frm_id, ', status=', OLD.status, ', remark=', OLD.remark, ', remarkDate=', OLD.remarkDate),
        'Update',
        CONCAT('New data: frm_id=', NEW.frm_id, ', status=', NEW.status, ', remark=', NEW.remark, ', remarkDate=', NEW.remarkDate)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `remark_audit`
--

CREATE TABLE `remark_audit` (
  `id` int(11) NOT NULL,
  `frm_id` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`rs_id`, `c_id`, `title`, `email`, `phone`, `url`, `o_hr`, `c_hr`, `o_days`, `address`, `image`, `date`) VALUES
(1, 1, 'Gazebo', 'gazebo@gmail.com', '4312533432', 'www.gazebo.com', '12pm', '12am', 'Mon-Sat', 'Borivali', '606d71a81ec5d.jpg', '2021-04-07 09:18:19'),
(2, 2, 'Eataly', 'eataly@gmail.com', '0557426406', 'www.eataly.com', '11am', '9pm', 'Mon-Sat', 'Goregaon', '606d720b5fc71.jpg', '2021-04-07 08:49:15'),
(3, 3, 'Mainland China', 'mainland@china.com', '4326538776', 'www.mainlandchina.com', '8am', '9pm', 'Mon-Fri', 'Malad', '606d72653306f.jpg', '2021-04-07 08:50:45'),
(4, 4, 'TGI Fridays', 'tgi@gmail.com', '2342353325', 'www.tgif.com', '9am', '9pm', 'Mon-Sat', 'Lower Parel', '606d72a49503a.jpg', '2021-04-07 08:51:48');

--
-- Triggers `restaurant`
--
DELIMITER $$
CREATE TRIGGER `restaurant_delete_trigger` AFTER DELETE ON `restaurant` FOR EACH ROW BEGIN
    INSERT INTO `restaurant_audit` (rs_id, c_id, title, email, phone, url, o_hr, c_hr, o_days, address, image, old_data, type, new_data)
    VALUES (
        OLD.rs_id,
        OLD.c_id,
        OLD.title,
        OLD.email,
        OLD.phone,
        OLD.url,
        OLD.o_hr,
        OLD.c_hr,
        OLD.o_days,
        OLD.address,
        OLD.image,
        CONCAT('Old data: rs_id=', OLD.rs_id, ', c_id=', OLD.c_id, ', title=', OLD.title, ', email=', OLD.email, ', phone=', OLD.phone, ', url=', OLD.url, ', o_hr=', OLD.o_hr, ', c_hr=', OLD.c_hr, ', o_days=', OLD.o_days, ', address=', OLD.address, ', image=', OLD.image),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `restaurant_update_trigger` AFTER UPDATE ON `restaurant` FOR EACH ROW BEGIN
    INSERT INTO `restaurant_audit` (rs_id, c_id, title, email, phone, url, o_hr, c_hr, o_days, address, image, old_data, type, new_data)
    VALUES (
        OLD.rs_id,
        OLD.c_id,
        OLD.title,
        OLD.email,
        OLD.phone,
        OLD.url,
        OLD.o_hr,
        OLD.c_hr,
        OLD.o_days,
        OLD.address,
        OLD.image,
        CONCAT('Old data: rs_id=', OLD.rs_id, ', c_id=', OLD.c_id, ', title=', OLD.title, ', email=', OLD.email, ', phone=', OLD.phone, ', url=', OLD.url, ', o_hr=', OLD.o_hr, ', c_hr=', OLD.c_hr, ', o_days=', OLD.o_days, ', address=', OLD.address, ', image=', OLD.image),
        'Update',
        CONCAT('New data: rs_id=', NEW.rs_id, ', c_id=', NEW.c_id, ', title=', NEW.title, ', email=', NEW.email, ', phone=', NEW.phone, ', url=', NEW.url, ', o_hr=', NEW.o_hr, ', c_hr=', NEW.c_hr, ', o_days=', NEW.o_days, ', address=', NEW.address, ', image=', NEW.image)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_audit`
--

CREATE TABLE `restaurant_audit` (
  `id` int(11) NOT NULL,
  `rs_id` int(222) NOT NULL,
  `c_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `url` varchar(222) NOT NULL,
  `o_hr` varchar(222) NOT NULL,
  `c_hr` varchar(222) NOT NULL,
  `o_days` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `image` text NOT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `res_category`
--

CREATE TABLE `res_category` (
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `res_category`
--

INSERT INTO `res_category` (`c_id`, `c_name`, `date`) VALUES
(1, 'Pakistani', '2023-12-15 07:32:19'),
(2, 'Italian', '2021-04-07 08:45:23'),
(3, 'Chinese', '2021-04-07 08:45:25'),
(4, 'American', '2021-04-07 08:45:28');

--
-- Triggers `res_category`
--
DELIMITER $$
CREATE TRIGGER `res_category_delete_trigger` AFTER DELETE ON `res_category` FOR EACH ROW BEGIN
    INSERT INTO `res_category_audit` (c_id, c_name, old_data, type, new_data)
    VALUES (
        OLD.c_id,
        OLD.c_name,
        CONCAT('Old data: c_id=', OLD.c_id, ', c_name=', OLD.c_name),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `res_category_update_trigger` AFTER UPDATE ON `res_category` FOR EACH ROW BEGIN
    INSERT INTO `res_category_audit` (c_id, c_name, old_data, type, new_data)
    VALUES (
        OLD.c_id,
        OLD.c_name,
        CONCAT('Old data: c_id=', OLD.c_id, ', c_name=', OLD.c_name),
        'Update',
        CONCAT('New data: c_id=', NEW.c_id, ', c_name=', NEW.c_name)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `res_category_audit`
--

CREATE TABLE `res_category_audit` (
  `id` int(11) NOT NULL,
  `c_id` int(222) NOT NULL,
  `c_name` varchar(222) NOT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL DEFAULT 1,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`u_id`, `username`, `f_name`, `l_name`, `email`, `phone`, `password`, `address`, `status`, `date`) VALUES
(1, 'SAL', 'Salman', 'Ansari', 'salman@gmail.com', '1324325445', 'a32de55ffd7a9c4101a0c5c8788b38ed', 'Mira Road', 1, '2021-04-07 08:43:49'),
(2, 'PAR', 'Parth', 'Desai', 'parth@gmail.com', '4325345332', 'bc28715006af20d0e961afd053a984d9', 'Vasai', 1, '2021-04-07 08:44:35'),
(3, 'HIT', 'Hitesh', 'Gosavi', 'hitesh@gmail.com', '4325345332', '58b2318af54435138065ee13dd8bea16', 'Malad', 1, '2021-04-07 08:44:53');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `users_delete_trigger` AFTER DELETE ON `users` FOR EACH ROW BEGIN
    INSERT INTO `users_audit` (u_id, username, f_name, l_name, email, phone, password, address, status, old_data, type, new_data)
    VALUES (
        OLD.u_id,
        OLD.username,
        OLD.f_name,
        OLD.l_name,
        OLD.email,
        OLD.phone,
        OLD.password,
        OLD.address,
        OLD.status,
        CONCAT('Old data: u_id=', OLD.u_id, ', username=', OLD.username, ', f_name=', OLD.f_name, ', l_name=', OLD.l_name, ', email=', OLD.email, ', phone=', OLD.phone, ', password=', OLD.password, ', address=', OLD.address, ', status=', OLD.status),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `users_update_trigger` AFTER UPDATE ON `users` FOR EACH ROW BEGIN
    INSERT INTO `users_audit` (u_id, username, f_name, l_name, email, phone, password, address, status, old_data, type, new_data)
    VALUES (
        OLD.u_id,
        OLD.username,
        OLD.f_name,
        OLD.l_name,
        OLD.email,
        OLD.phone,
        OLD.password,
        OLD.address,
        OLD.status,
        CONCAT('Old data: u_id=', OLD.u_id, ', username=', OLD.username, ', f_name=', OLD.f_name, ', l_name=', OLD.l_name, ', email=', OLD.email, ', phone=', OLD.phone, ', password=', OLD.password, ', address=', OLD.address, ', status=', OLD.status),
        'Update',
        CONCAT('New data: u_id=', NEW.u_id, ', username=', NEW.username, ', f_name=', NEW.f_name, ', l_name=', NEW.l_name, ', email=', NEW.email, ', phone=', NEW.phone, ', password=', NEW.password, ', address=', NEW.address, ', status=', NEW.status)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_audit`
--

CREATE TABLE `users_audit` (
  `id` int(11) NOT NULL,
  `u_id` int(222) NOT NULL,
  `username` varchar(222) NOT NULL,
  `f_name` varchar(222) NOT NULL,
  `l_name` varchar(222) NOT NULL,
  `email` varchar(222) NOT NULL,
  `phone` varchar(222) NOT NULL,
  `password` varchar(222) NOT NULL,
  `address` text NOT NULL,
  `status` int(222) NOT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users_orders`
--

CREATE TABLE `users_orders` (
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Triggers `users_orders`
--
DELIMITER $$
CREATE TRIGGER `users_orders_delete_trigger` AFTER DELETE ON `users_orders` FOR EACH ROW BEGIN
    INSERT INTO `users_orders_audit` (o_id, u_id, title, quantity, price, status, old_data, type, new_data)
    VALUES (
        OLD.o_id,
        OLD.u_id,
        OLD.title,
        OLD.quantity,
        OLD.price,
        OLD.status,
        CONCAT('Old data: o_id=', OLD.o_id, ', u_id=', OLD.u_id, ', title=', OLD.title, ', quantity=', OLD.quantity, ', price=', OLD.price, ', status=', OLD.status),
        'Delete',
        NULL
    );
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `users_orders_update_trigger` AFTER UPDATE ON `users_orders` FOR EACH ROW BEGIN
    INSERT INTO `users_orders_audit` (o_id, u_id, title, quantity, price, status, old_data, type, new_data)
    VALUES (
        OLD.o_id,
        OLD.u_id,
        OLD.title,
        OLD.quantity,
        OLD.price,
        OLD.status,
        CONCAT('Old data: o_id=', OLD.o_id, ', u_id=', OLD.u_id, ', title=', OLD.title, ', quantity=', OLD.quantity, ', price=', OLD.price, ', status=', OLD.status),
        'Update',
        CONCAT('New data: o_id=', NEW.o_id, ', u_id=', NEW.u_id, ', title=', NEW.title, ', quantity=', NEW.quantity, ', price=', NEW.price, ', status=', NEW.status)
    );
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users_orders_audit`
--

CREATE TABLE `users_orders_audit` (
  `id` int(11) NOT NULL,
  `o_id` int(222) NOT NULL,
  `u_id` int(222) NOT NULL,
  `title` varchar(222) NOT NULL,
  `quantity` int(222) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `status` varchar(222) DEFAULT NULL,
  `old_data` text DEFAULT NULL,
  `type` enum('Update','Delete') NOT NULL,
  `new_data` text DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adm_id`);

--
-- Indexes for table `admin_audit`
--
ALTER TABLE `admin_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`d_id`);

--
-- Indexes for table `dishes_audit`
--
ALTER TABLE `dishes_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `remark`
--
ALTER TABLE `remark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `remark_audit`
--
ALTER TABLE `remark_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`rs_id`);

--
-- Indexes for table `restaurant_audit`
--
ALTER TABLE `restaurant_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `res_category`
--
ALTER TABLE `res_category`
  ADD PRIMARY KEY (`c_id`);

--
-- Indexes for table `res_category_audit`
--
ALTER TABLE `res_category_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `users_audit`
--
ALTER TABLE `users_audit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users_orders`
--
ALTER TABLE `users_orders`
  ADD PRIMARY KEY (`o_id`);

--
-- Indexes for table `users_orders_audit`
--
ALTER TABLE `users_orders_audit`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adm_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_audit`
--
ALTER TABLE `admin_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `d_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `dishes_audit`
--
ALTER TABLE `dishes_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remark`
--
ALTER TABLE `remark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `remark_audit`
--
ALTER TABLE `remark_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `rs_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `restaurant_audit`
--
ALTER TABLE `restaurant_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `res_category`
--
ALTER TABLE `res_category`
  MODIFY `c_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `res_category_audit`
--
ALTER TABLE `res_category_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int(222) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_audit`
--
ALTER TABLE `users_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_orders`
--
ALTER TABLE `users_orders`
  MODIFY `o_id` int(222) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users_orders_audit`
--
ALTER TABLE `users_orders_audit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
