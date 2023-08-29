-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 22/08/2023 às 01:21
-- Versão do servidor: 5.7.39
-- Versão do PHP: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `Unicars`
--
CREATE DATABASE IF NOT EXISTS `Unicars` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Unicars`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `cpf`, `endereco`, `telefone`) VALUES
(1, 'João Manuel Luís da Mota', '93785583303', 'Quadra E-19', '8239497536'),
(2, 'Julio Raul Manuel dos Santos', '30636308456', 'Rua das Camélias', '6528521183'),
(3, 'Ester Kamilly Ribeiro', '37413673460', 'Rua Getulio Vargas 411', '9926869077');

-- --------------------------------------------------------

--
-- Estrutura para tabela `marcas`
--

CREATE TABLE `marcas` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `localFabricacao` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `marcas`
--

INSERT INTO `marcas` (`id`, `nome`, `localFabricacao`) VALUES
(1, 'Audi', 'Alemanha'),
(2, 'BMW', 'Alemanha'),
(3, 'Ferrari', 'Italia');

-- --------------------------------------------------------

--
-- Estrutura para tabela `veiculos`
--

CREATE TABLE `veiculos` (
  `id` int(11) NOT NULL,
  `placa` varchar(7) NOT NULL,
  `id_marcas` int(11) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `cor` varchar(100) NOT NULL,
  `anoFabricacao` year(4) NOT NULL,
  `anoModelo` year(4) NOT NULL,
  `valorCompra` float NOT NULL,
  `valorVenda` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `veiculos`
--

INSERT INTO `veiculos` (`id`, `placa`, `id_marcas`, `modelo`, `cor`, `anoFabricacao`, `anoModelo`, `valorCompra`, `valorVenda`) VALUES
(1, 'HON0961', 1, 'A8', 'Azul', 2006, 2007, 170.466, 198.393),
(2, 'HZF1509', 2, 'X1 XDRIVE', 'Preto', 2015, 2016, 280.599, 299.959),
(3, 'MOM4376', 3, '360 Spider', 'Dourado', 2001, 2002, 540.999, 552.129);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendas`
--

CREATE TABLE `vendas` (
  `id` int(11) NOT NULL,
  `id_veiculos` int(11) NOT NULL,
  `id_clientes` int(11) NOT NULL,
  `id_vendedores` int(11) NOT NULL,
  `dataVenda` date NOT NULL,
  `valorVenda` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `vendas`
--

INSERT INTO `vendas` (`id`, `id_veiculos`, `id_clientes`, `id_vendedores`, `dataVenda`, `valorVenda`) VALUES
(1, 1, 3, 2, '2023-08-21', 198.393),
(2, 2, 1, 1, '2020-04-06', 299.959),
(3, 3, 2, 3, '2018-02-10', 552.129);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vendedores`
--

CREATE TABLE `vendedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `dataEntradaEmpresa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `vendedores`
--

INSERT INTO `vendedores` (`id`, `nome`, `cpf`, `dataEntradaEmpresa`) VALUES
(1, 'Vinicius Márcio Melo', '39275270929', '2002-05-08'),
(2, 'Raimundo Giovanni César da Costa', '67835345706', '2006-04-10'),
(3, 'Ruan Filipe da Costa', '13691533418', '2019-06-18');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `veiculos`
--
ALTER TABLE `veiculos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_marcas`);

--
-- Índices de tabela `vendas`
--
ALTER TABLE `vendas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk2` (`id_clientes`),
  ADD KEY `fk3` (`id_veiculos`),
  ADD KEY `fk4` (`id_vendedores`);

--
-- Índices de tabela `vendedores`
--
ALTER TABLE `vendedores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `marcas`
--
ALTER TABLE `marcas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `veiculos`
--
ALTER TABLE `veiculos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendas`
--
ALTER TABLE `vendas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `vendedores`
--
ALTER TABLE `vendedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `veiculos`
--
ALTER TABLE `veiculos`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_marcas`) REFERENCES `marcas` (`id`);

--
-- Restrições para tabelas `vendas`
--
ALTER TABLE `vendas`
  ADD CONSTRAINT `fk2` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_veiculos`) REFERENCES `veiculos` (`id`),
  ADD CONSTRAINT `fk4` FOREIGN KEY (`id_vendedores`) REFERENCES `vendedores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
