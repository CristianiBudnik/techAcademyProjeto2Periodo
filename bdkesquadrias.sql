-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 20, 2026 at 08:49 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bdkesquadrias`
--

-- --------------------------------------------------------

--
-- Table structure for table `atributo`
--

CREATE TABLE `atributo` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `atributo`
--

INSERT INTO `atributo` (`id`, `nome`) VALUES
(1, 'Cor do Vidro'),
(2, 'Tipo do Vidro'),
(3, 'Cor do Alumínio'),
(4, 'Espessura'),
(5, 'Linha do Alumínio'),
(6, 'Disponível em Alumínio');

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `descricao`) VALUES
(1, 'Portas', 'Portas de alumínio e vidro'),
(2, 'Janelas', 'Janelas de alumínio e vidro'),
(3, 'Fachadas e Fechamentos', 'Pele de vidro, structural glazing, sacada e área gourmet'),
(4, 'Coberturas', 'Coberturas fixas, retráteis, pergolados e claraboias'),
(5, 'Guarda-Corpo', 'Guarda-corpo com vidro, com barra ou misto'),
(6, 'Portões', 'Portões deslizante, basculante, de giro e social'),
(7, 'Divisórias e Amb. Internos', 'Divisória de vidro e box para banheiro'),
(8, 'Persianas e Brises', 'Persiana integrada automática, brise fixo e brise móvel');

-- --------------------------------------------------------

--
-- Table structure for table `imagem`
--

CREATE TABLE `imagem` (
  `id` int(11) NOT NULL,
  `id_produto` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ordem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `imagem`
--

INSERT INTO `imagem` (`id`, `id_produto`, `url`, `ordem`) VALUES
(1, 1, 'img/porta/porta.jpeg', 1),
(2, 1, 'img/porta/porta2.jpeg', 2),
(3, 1, 'img/porta/porta3.jpeg', 3),
(4, 2, 'img/porta/porta4.jpeg', 1),
(5, 2, 'img/porta/porta5.jpeg', 2),
(6, 2, 'img/porta/porta6.jpeg', 3),
(7, 3, 'img/porta/porta7.jpeg', 4),
(8, 3, 'img/porta/porta8.jpeg', 5),
(9, 3, 'img/porta/porta9.jpeg', 6),
(10, 3, 'img/porta/porta10.jpeg', 7),
(11, 4, 'img/porta/portacamaleao.jpeg', 1),
(12, 4, 'img/porta/portacamaleao2.jpeg', 2),
(13, 4, 'img/porta/portacamaleao3.jpeg', 3),
(14, 4, 'img/porta/portacamaleao4.jpeg', 4),
(15, 4, 'img/porta/portacamaleao5.jpeg', 5),
(16, 15, 'img/cobertura/cobertura.jpeg', 1),
(17, 15, 'img/cobertura/cobertura2.jpeg', 2),
(18, 15, 'img/cobertura/cobertura3.jpeg', 3),
(19, 15, 'img/cobertura/cobertura4.jpeg', 4),
(20, 15, 'img/cobertura/cobertura5.jpeg', 5),
(21, 15, 'img/cobertura/cobertura6.jpeg', 6),
(22, 15, 'img/cobertura/cobertura7.jpeg', 7),
(23, 15, 'img/cobertura/coberturaEspelhada.jpeg', 8),
(24, 15, 'img/cobertura/coberturaEspelhada2.jpeg', 9),
(25, 15, 'img/cobertura/coberturaEspelhada3.jpeg', 10),
(26, 15, 'img/cobertura/coberturaVideo.mp4', 11),
(27, 27, 'img/boxBanheiro/box1.jpeg', 1),
(28, 27, 'img/boxBanheiro/box2.jpeg', 2),
(29, 27, 'img/boxBanheiro/box3.jpeg', 3),
(30, 27, 'img/boxBanheiro/box4.jpeg', 4),
(31, 27, 'img/boxBanheiro/box5.jpeg', 5),
(32, 27, 'img/boxBanheiro/box6.jpeg', 6),
(33, 27, 'img/boxBanheiro/boxDourado.jpeg', 7),
(34, 27, 'img/boxBanheiro/boxDourado2.jpeg', 8),
(35, 16, 'img/cobertura/coberturaRetratil.jpeg', 1),
(36, 16, 'img/cobertura/coberturaRetratil2.jpeg', 2),
(37, 16, 'img/cobertura/coberturaRetratil3.jpeg', 3),
(38, 16, 'img/cobertura/coberturaRetratilVideo.mp4', 4),
(39, 16, 'img/cobertura/coberturaRetratilVideo2.mp4', 5),
(40, 17, 'img/cobertura/pergolato.png', 1),
(41, 17, 'img/cobertura/pergolato2.png', 2),
(42, 17, 'img/cobertura/pergolato3.png', 3),
(43, 17, 'img/cobertura/pergolato4.png', 4),
(44, 18, 'img/cobertura/claraboia.jpeg', 1),
(45, 18, 'img/cobertura/claraboia2.jpeg', 2),
(46, 18, 'img/cobertura/claraboia3.jpeg', 3),
(47, 18, 'img/cobertura/claraboia4.jpeg', 4),
(48, 18, 'img/cobertura/claraboia5.jpeg', 5),
(49, 26, 'img/divisoria/divisoria.jpeg', 1),
(50, 26, 'img/divisoria/divisoria1.jpeg', 2),
(51, 26, 'img/divisoria/divisoria2.jpeg', 3),
(52, 26, 'img/divisoria/divisoria3.jpeg', 4),
(53, 26, 'img/divisoria/divisoria4.jpeg', 5),
(54, 26, 'img/divisoria/divisoria5.jpeg', 6),
(55, 26, 'img/divisoria/divisoria6.jpeg', 7),
(56, 26, 'img/divisoria/divisoria7.jpeg', 8),
(57, 26, 'img/divisoria/divisoria8.jpeg', 9),
(58, 26, 'img/divisoria/divisoria9.jpeg', 10),
(59, 26, 'img/divisoria/divisoria10.jpeg', 11),
(60, 29, 'img/brise/brise.jpeg', 1),
(61, 29, 'img/brise/brise2.jpeg', 2),
(62, 19, 'img/guarda-corpo/guardacorpo.jpeg', 1),
(63, 19, 'img/guarda-corpo/guardacorpo2.jpeg', 2),
(64, 19, 'img/guarda-corpo/guardacorpo3.jpeg', 3),
(65, 19, 'img/guarda-corpo/guardacorpo4.jpeg', 4),
(66, 19, 'img/guarda-corpo/guardacorpo5.jpeg', 5),
(67, 19, 'img/guarda-corpo/guardacorpo6.jpeg', 6),
(68, 19, 'img/guarda-corpo/guardacorpo7.jpeg', 7),
(69, 19, 'img/guarda-corpo/guardacorpo8.jpeg', 8),
(70, 19, 'img/guarda-corpo/guardacorpo9.jpeg', 9),
(71, 20, 'img/guarda-corpo/guardacorposacada.jpeg', 1),
(72, 20, 'img/guarda-corpo/guardacorposacada2.jpeg', 2),
(73, 20, 'img/guarda-corpo/guardacorposacada3.jpeg', 3),
(74, 20, 'img/guarda-corpo/guardacorposacada4.jpeg', 4),
(75, 20, 'img/guarda-corpo/guardacorposacada5.jpeg', 5),
(76, 20, 'img/guarda-corpo/guardacorposacada6.jpeg', 6),
(77, 20, 'img/guarda-corpo/guardacorposacada7.jpeg', 7),
(78, 21, 'img/guarda-corpo/guardacorposacadapiscina.jpeg', 1),
(79, 21, 'img/guarda-corpo/guardacorposacadapiscina2.jpeg', 2),
(80, 21, 'img/guarda-corpo/guardacorposacadapiscina3.jpeg', 3),
(81, 21, 'img/guarda-corpo/guardacorposacadapiscina4.jpeg', 4),
(82, 21, 'img/guarda-corpo/guardacorposacadapiscina5.jpeg', 5),
(83, 21, 'img/guarda-corpo/guardacorposacadapiscina6.jpeg', 6),
(84, 21, 'img/guarda-corpo/guardacorposacadapiscina7.jpeg', 7),
(85, 21, 'img/guarda-corpo/guardacorposacadapiscina8.jpeg', 8),
(86, 12, 'img/janelas/espelhado1.jpeg', 1),
(87, 12, 'img/janelas/espelhado2.jpeg', 2),
(88, 12, 'img/janelas/espelhado3.jpeg', 3),
(89, 12, 'img/janelas/espelhado4.jpeg', 4),
(90, 6, 'img/janelas/janela.jpeg', 1),
(91, 6, 'img/janelas/janela2.jpeg', 2),
(92, 6, 'img/janelas/janela3.jpeg', 3),
(93, 6, 'img/janelas/janela4.jpeg', 4),
(94, 6, 'img/janelas/janela5.jpeg', 5),
(95, 6, 'img/janelas/janela6.jpeg', 6),
(96, 6, 'img/janelas/janela7.jpeg', 7),
(97, 6, 'img/janelas/janela8.jpeg', 8),
(98, 6, 'img/janelas/janela9.jpeg', 9),
(99, 8, 'img/janelas/janelabasculante.jpeg', 1),
(100, 8, 'img/janelas/janelabasculante2.jpeg', 2),
(101, 8, 'img/janelas/janelabasculante3.jpeg', 3),
(102, 8, 'img/janelas/janelabasculante4.jpeg', 4),
(103, 7, 'img/janelas/maxiar.jpeg', 1),
(104, 7, 'img/janelas/maxiar2.jpeg', 2),
(105, 7, 'img/janelas/maxiar3.jpeg', 3),
(106, 28, 'img/janelas/perciana.jpeg', 1),
(107, 28, 'img/janelas/perciana2.jpeg', 2),
(108, 28, 'img/janelas/perciana3.jpeg', 3),
(109, 28, 'img/janelas/perciana4.jpeg', 4),
(110, 28, 'img/janelas/perciana5.jpeg', 5),
(111, 28, 'img/janelas/perciana6.jpeg', 6),
(112, 28, 'img/janelas/perciana7.jpeg', 7),
(113, 28, 'img/janelas/perciana8.jpeg', 8),
(114, 28, 'img/janelas/perciana9.jpeg', 9),
(115, 11, 'img/muro/muro.jpeg', 1),
(116, 11, 'img/muro/muro2.jpeg', 2),
(117, 11, 'img/muro/muro3.jpeg', 3),
(118, 11, 'img/muro/muro4.jpeg', 4),
(119, 11, 'img/muro/muro5.jpeg', 5),
(120, 11, 'img/muro/muro6.jpeg', 6),
(121, 11, 'img/muro/muro7.jpeg', 7),
(122, 25, 'img/portao/portaoDeVidro.jpeg', 1),
(123, 25, 'img/portao/portaoDeVidro.jpeg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `produto`
--

CREATE TABLE `produto` (
  `id` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produto`
--

INSERT INTO `produto` (`id`, `id_categoria`, `nome`, `descricao`) VALUES
(1, 1, 'Porta de Correr', NULL),
(2, 1, 'Porta de Giro', NULL),
(3, 1, 'Porta Pivotante', NULL),
(4, 1, 'Porta Camarão', NULL),
(6, 2, 'Janela de Correr', NULL),
(7, 2, 'Janela Maxim-Ar', NULL),
(8, 2, 'Janela Basculante', NULL),
(11, 3, 'Pele de Vidro', NULL),
(12, 3, 'Vidro Espelhado', NULL),
(15, 4, 'Cobertura Fixa', NULL),
(16, 4, 'Cobertura Retrátil', NULL),
(17, 4, 'Pergolado', NULL),
(18, 4, 'Claraboia', NULL),
(19, 5, 'Guarda-Corpo com Vidro', NULL),
(20, 5, 'Guarda-Corpo com Barra', NULL),
(21, 5, 'Guarda-Corpo Misto', NULL),
(25, 6, 'Portão Social', NULL),
(26, 7, 'Divisória de Vidro', NULL),
(27, 7, 'Box para Banheiro', NULL),
(28, 8, 'Persiana Integrada Automática', NULL),
(29, 8, 'Brise Fixo', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `produto_atributo`
--

CREATE TABLE `produto_atributo` (
  `id_produto` int(11) NOT NULL,
  `id_atributo` int(11) NOT NULL,
  `valor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produto_atributo`
--

INSERT INTO `produto_atributo` (`id_produto`, `id_atributo`, `valor`) VALUES
(1, 1, 'Incolor, Verde, Fumê, Espelhado'),
(1, 2, 'Temperado, Laminado, Insulado, Comum'),
(1, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(1, 4, '6mm, 8mm ou 10mm'),
(1, 6, 'Sim'),
(2, 1, 'Incolor, Verde, Fumê, Espelhado'),
(2, 2, 'Temperado, Laminado, Insulado, Comum'),
(2, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(2, 4, '8mm ou 10mm'),
(2, 6, 'Sim'),
(3, 1, 'Incolor, Verde, Fumê, Espelhado'),
(3, 2, 'Temperado, Laminado, Insulado, Comum'),
(3, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(3, 4, '10mm ou 12mm'),
(3, 6, 'Sim'),
(4, 1, 'Incolor, Verde, Fumê, Espelhado'),
(4, 2, 'Temperado, Laminado, Insulado, Comum'),
(4, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(4, 4, '6mm ou 8mm'),
(4, 6, 'Não'),
(6, 1, 'Incolor, Verde, Fumê, Espelhado'),
(6, 2, 'Temperado, Laminado, Insulado, Comum'),
(6, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(6, 4, '4mm, 6mm ou 8mm'),
(6, 6, 'Não'),
(7, 1, 'Incolor, Verde, Fumê, Espelhado'),
(7, 2, 'Temperado, Laminado, Insulado, Comum'),
(7, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(7, 4, '4mm ou 6mm'),
(7, 6, 'Não'),
(8, 1, 'Incolor, Verde, Fumê, Espelhado'),
(8, 2, 'Temperado, Laminado, Insulado, Comum'),
(8, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(8, 4, '4mm ou 6mm'),
(8, 6, 'Não'),
(11, 1, 'Incolor, Verde, Fumê, Espelhado'),
(11, 2, 'Laminado ou Insulado'),
(11, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(11, 4, '8mm+8mm ou 10mm+10mm'),
(11, 6, 'Não'),
(12, 1, 'Incolor, Verde, Fumê, Espelhado'),
(12, 2, 'Laminado ou Insulado'),
(12, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(12, 4, '8mm+8mm ou 10mm+10mm'),
(12, 6, 'Não'),
(15, 1, 'Incolor, Verde, Fumê, Espelhado'),
(15, 2, 'Laminado'),
(15, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(15, 4, '8mm ou 10mm'),
(15, 6, 'Não'),
(16, 1, 'Incolor, Verde, Fumê, Espelhado'),
(16, 2, 'Temperado ou Laminado'),
(16, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(16, 4, '8mm ou 10mm'),
(16, 6, 'Não'),
(17, 1, 'Incolor, Verde, Fumê, Espelhado'),
(17, 2, 'Laminado'),
(17, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(17, 4, '8mm ou 10mm'),
(17, 6, 'Não'),
(18, 1, 'Incolor, Verde, Fumê, Espelhado'),
(18, 2, 'Temperado, Laminado ou Insulado'),
(18, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(18, 4, '8mm ou 10mm'),
(18, 6, 'Não'),
(19, 1, 'Incolor, Verde, Fumê, Espelhado'),
(19, 2, 'Temperado, Laminado, Insulado ou Comum'),
(19, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(19, 4, '8mm ou 10mm'),
(19, 6, 'Não'),
(20, 1, 'Incolor, Verde, Fumê, Espelhado'),
(20, 2, 'Temperado, Laminado, Insulado ou Comum'),
(20, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(20, 4, '8mm ou 10mm'),
(20, 6, 'Não'),
(21, 1, 'Incolor, Verde, Fumê, Espelhado'),
(21, 2, 'Temperado, Laminado, Insulado ou Comum'),
(21, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(21, 4, '8mm ou 10mm'),
(21, 6, 'Não'),
(25, 1, 'Incolor, Verde, Fumê, Espelhado'),
(25, 2, 'Temperado ou Laminado'),
(25, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(25, 4, '8mm a 12mm'),
(25, 6, 'Sim'),
(26, 1, 'Incolor, Verde, Fumê, Espelhado'),
(26, 2, 'Temperado ou Jateado'),
(26, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(26, 4, '8mm a 10mm'),
(26, 6, 'Não'),
(27, 1, 'Incolor, Verde, Fumê, Espelhado'),
(27, 2, 'Temperado ou Jateado'),
(27, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(27, 4, '8mm a 10mm'),
(27, 6, 'Não'),
(28, 1, 'Incolor, Verde, Fumê, Espelhado'),
(28, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(28, 6, 'Sim'),
(29, 1, 'Incolor, Verde, Fumê, Espelhado'),
(29, 3, 'Branco, Preto Fosco, Bronze, Natural'),
(29, 6, 'Sim');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atributo`
--
ALTER TABLE `atributo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `imagem`
--
ALTER TABLE `imagem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_produto` (`id_produto`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `produto_atributo`
--
ALTER TABLE `produto_atributo`
  ADD PRIMARY KEY (`id_produto`,`id_atributo`),
  ADD KEY `id_atributo` (`id_atributo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `atributo`
--
ALTER TABLE `atributo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `imagem`
--
ALTER TABLE `imagem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=124;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `imagem`
--
ALTER TABLE `imagem`
  ADD CONSTRAINT `imagem_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`);

--
-- Constraints for table `produto`
--
ALTER TABLE `produto`
  ADD CONSTRAINT `produto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`);

--
-- Constraints for table `produto_atributo`
--
ALTER TABLE `produto_atributo`
  ADD CONSTRAINT `produto_atributo_ibfk_1` FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`),
  ADD CONSTRAINT `produto_atributo_ibfk_2` FOREIGN KEY (`id_atributo`) REFERENCES `atributo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
