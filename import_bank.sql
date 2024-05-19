-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Май 19 2024 г., 21:24
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bank`
--

-- --------------------------------------------------------

--
-- Структура таблицы `bank_users`
--

CREATE TABLE `bank_users` (
  `id` int(11) NOT NULL,
  `text` text NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `bank_users`
--

INSERT INTO `bank_users` (`id`, `text`, `description`, `keywords`) VALUES
(12, 'Nikolay', 'engineer', 'MSU'),
(14, 'Julia', 'C++', '3 year experience'),
(17, 'Baranov', 'Engeneer', 'Ivanov'),
(18, 'Dmitry', 'C#', '1 year experience'),
(101, 'Ivan', 'Artist', 'SPBSTU'),
(102, 'Nikita', 'Ruby', '2year exp');

-- --------------------------------------------------------

--
-- Структура таблицы `borrowers`
--

CREATE TABLE `borrowers` (
  `id_borrower` int(10) NOT NULL,
  `insurance` int(10) NOT NULL,
  `bin` int(15) NOT NULL,
  `address` varchar(40) NOT NULL,
  `sum` int(8) NOT NULL,
  `conditions` text NOT NULL,
  `legal_notes` text NOT NULL,
  `contract_list` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `borrowers`
--

INSERT INTO `borrowers` (`id_borrower`, `insurance`, `bin`, `address`, `sum`, `conditions`, `legal_notes`, `contract_list`) VALUES
(1, 112, 131, 'St. Petersburd, Russia', 20000, '100 per month', '', 'loan '),
(2, 122, 131, 'Novosibirsk, Russia', 100000, '20000 per month', 'for car', 'bank loan'),
(3, 312, 3312, 'Kostroma, Russia', 300000, '30000 per month', 'for house', 'bank loan'),
(4, 1131, 9912, 'Moscow, Russia', 2000000, '200000 per month', 'for business', 'bank loan'),
(5, 1123, 1123, 'Archangelsk', 100000, '1000 per month', 'for car', 'bank loan');

-- --------------------------------------------------------

--
-- Структура таблицы `company_credits`
--

CREATE TABLE `company_credits` (
  `id` int(10) NOT NULL,
  `id_company` int(10) NOT NULL,
  `id_person` int(10) NOT NULL,
  `sum` int(8) NOT NULL,
  `percent` int(2) NOT NULL,
  `deadline` date NOT NULL,
  `conditions` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `files`
--

CREATE TABLE `files` (
  `id_file` int(11) NOT NULL,
  `id_my` int(11) NOT NULL,
  `description` text NOT NULL,
  `name_origin` text NOT NULL,
  `path` text NOT NULL,
  `date_upload` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=cp1251;

--
-- Дамп данных таблицы `files`
--

INSERT INTO `files` (`id_file`, `id_my`, `description`, `name_origin`, `path`, `date_upload`) VALUES
(16, 17, 'Закачка из менеджера', 'test file 1.pdf', 'files/test_file1.pdf', '31-03-2023  20:07:59');

-- --------------------------------------------------------

--
-- Структура таблицы `loan`
--

CREATE TABLE `loan` (
  `id` int(10) NOT NULL,
  `id_person` int(11) NOT NULL,
  `amount` int(7) NOT NULL,
  `percent` int(2) NOT NULL,
  `rate` int(5) NOT NULL,
  `deadline` date NOT NULL,
  `conditions` text NOT NULL,
  `note` text NOT NULL,
  `id_borrower` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `person`
--

CREATE TABLE `person` (
  `id` int(10) NOT NULL,
  `name` varchar(20) NOT NULL,
  `surname` varchar(20) NOT NULL,
  `patronymic` varchar(20) NOT NULL,
  `passport` varchar(20) NOT NULL,
  `insurance` int(10) NOT NULL,
  `pension` int(10) NOT NULL,
  `drive_licence` int(10) NOT NULL,
  `add_docs` text NOT NULL,
  `notes` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `bank_users`
--
ALTER TABLE `bank_users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `borrowers`
--
ALTER TABLE `borrowers`
  ADD PRIMARY KEY (`id_borrower`);

--
-- Индексы таблицы `company_credits`
--
ALTER TABLE `company_credits`
  ADD KEY `id` (`id`);

--
-- Индексы таблицы `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id_file`),
  ADD KEY `id_my` (`id_my`);

--
-- Индексы таблицы `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_borrower` (`id_borrower`),
  ADD KEY `id_person` (`id_person`);

--
-- Индексы таблицы `person`
--
ALTER TABLE `person`
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `bank_users`
--
ALTER TABLE `bank_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT для таблицы `files`
--
ALTER TABLE `files`
  MODIFY `id_file` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `company_credits`
--
ALTER TABLE `company_credits`
  ADD CONSTRAINT `company_credits_ibfk_1` FOREIGN KEY (`id`) REFERENCES `loan` (`id`);

--
-- Ограничения внешнего ключа таблицы `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`id_my`) REFERENCES `bank_users` (`id`);

--
-- Ограничения внешнего ключа таблицы `loan`
--
ALTER TABLE `loan`
  ADD CONSTRAINT `loan_ibfk_1` FOREIGN KEY (`id_borrower`) REFERENCES `borrowers` (`id_borrower`),
  ADD CONSTRAINT `loan_ibfk_2` FOREIGN KEY (`id_person`) REFERENCES `bank_users` (`id`);

--
-- Ограничения внешнего ключа таблицы `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `person_ibfk_1` FOREIGN KEY (`id`) REFERENCES `loan` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
