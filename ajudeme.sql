-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 27-Jun-2019 às 04:51
-- Versão do servidor: 10.1.38-MariaDB
-- versão do PHP: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ajudeme`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `campanha`
--

CREATE TABLE `campanha` (
  `idCampanha` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  `data` date NOT NULL,
  `meta` float NOT NULL,
  `arrecadado` float NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `campanha`
--

INSERT INTO `campanha` (`idCampanha`, `name`, `status`, `data`, `meta`, `arrecadado`, `descricao`, `Usuario_idUsuario`) VALUES
(1, 'campanha legal', 1, '2019-06-12', 12345, 123, 'Campanha bem util', 1),
(2, 'CAMPANHA MAIS PAULERAINDA', 1, '2019-06-27', 30000, 10000, 'QUARENTAKATAMEM', 1),
(3, 'Nova campanha', 1, '2019-06-29', 40000, 1, 'Essa e a descricao legal', 1),
(6, 'Campanha de Teste', 0, '0000-00-00', 200, 0, 'aaaaaaa', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `doacao`
--

CREATE TABLE `doacao` (
  `idDoacao` int(11) NOT NULL,
  `nome` varchar(100) CHARACTER SET latin1 NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 NOT NULL,
  `data` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(45) NOT NULL,
  `valor` int(11) NOT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Campanha_idCampanha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `doacao`
--

INSERT INTO `doacao` (`idDoacao`, `nome`, `email`, `data`, `status`, `valor`, `Usuario_idUsuario`, `Campanha_idCampanha`) VALUES
(2, '', '', '2019-06-26 22:07:07', '1', 100, 3, 1),
(3, '', '', '2019-06-26 22:08:52', '1', 20, 3, 1),
(11, 'qweqw', 'luis@gmail.com', '2019-06-27 00:38:20', '', 100, 3, 2),
(12, 'nome', 'e@mai.l', '2019-06-27 00:40:12', '', 10, 3, 2),
(13, 'eu', 'eu@euzinho.euzao', '2019-06-27 00:46:40', '', 10, 3, 2),
(14, 'novamente', 'eu@aqui.denovo', '2019-06-27 00:47:41', '', 20, 3, 2),
(15, 'asd', 'wee@ad.sa', '2019-06-27 00:48:27', '', 234, 3, 2),
(16, 'eu', 'vinte@mil.ze', '2019-06-27 01:20:27', '', 20000, 3, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto`
--

CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` int(11) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `trofeu`
--

CREATE TABLE `trofeu` (
  `idTrofeu` int(11) NOT NULL,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeC` varchar(45) NOT NULL,
  `email` varchar(80) NOT NULL,
  `senha` varchar(100) NOT NULL,
  `tipoUsuario` int(11) NOT NULL,
  `tipoDoc` int(11) NOT NULL,
  `documento` varchar(45) NOT NULL,
  `pontos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nomeC`, `email`, `senha`, `tipoUsuario`, `tipoDoc`, `documento`, `pontos`) VALUES
(1, 'luis', 'luis@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1, 0, '12345', 0),
(2, 'prisco', 'email@do.prisco', '827ccb0eea8a706c4c34a16891f84e7b', 0, 0, '123456', 0),
(3, 'ar', 'ar@tu.zao', '81dc9bdb52d04dc20036dbd8313ed055', 0, 0, '12345678', 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_produto`
--

CREATE TABLE `usuario_has_produto` (
  `Usuario_idUsuario` int(11) NOT NULL,
  `Produto_idProduto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario_has_trofeu`
--

CREATE TABLE `usuario_has_trofeu` (
  `Usuario_idUsuario` int(11) NOT NULL,
  `Trofeu_idTrofeu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `campanha`
--
ALTER TABLE `campanha`
  ADD PRIMARY KEY (`idCampanha`),
  ADD KEY `fk_Campanha_Usuario_idx` (`Usuario_idUsuario`);

--
-- Indexes for table `doacao`
--
ALTER TABLE `doacao`
  ADD PRIMARY KEY (`idDoacao`),
  ADD KEY `fk_Doacao_Usuario1_idx` (`Usuario_idUsuario`),
  ADD KEY `fk_Doacao_Campanha1_idx` (`Campanha_idCampanha`);

--
-- Indexes for table `produto`
--
ALTER TABLE `produto`
  ADD PRIMARY KEY (`idProduto`);

--
-- Indexes for table `trofeu`
--
ALTER TABLE `trofeu`
  ADD PRIMARY KEY (`idTrofeu`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- Indexes for table `usuario_has_produto`
--
ALTER TABLE `usuario_has_produto`
  ADD PRIMARY KEY (`Usuario_idUsuario`,`Produto_idProduto`),
  ADD KEY `fk_Usuario_has_Produto_Produto1_idx` (`Produto_idProduto`),
  ADD KEY `fk_Usuario_has_Produto_Usuario1_idx` (`Usuario_idUsuario`);

--
-- Indexes for table `usuario_has_trofeu`
--
ALTER TABLE `usuario_has_trofeu`
  ADD PRIMARY KEY (`Usuario_idUsuario`,`Trofeu_idTrofeu`),
  ADD KEY `fk_Usuario_has_Trofeu_Trofeu1_idx` (`Trofeu_idTrofeu`),
  ADD KEY `fk_Usuario_has_Trofeu_Usuario1_idx` (`Usuario_idUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `campanha`
--
ALTER TABLE `campanha`
  MODIFY `idCampanha` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doacao`
--
ALTER TABLE `doacao`
  MODIFY `idDoacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `produto`
--
ALTER TABLE `produto`
  MODIFY `idProduto` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trofeu`
--
ALTER TABLE `trofeu`
  MODIFY `idTrofeu` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `campanha`
--
ALTER TABLE `campanha`
  ADD CONSTRAINT `fk_Campanha_Usuario` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
