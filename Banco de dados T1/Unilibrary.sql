-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Tempo de geração: 29/08/2023 às 00:49
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
-- Banco de dados: `Unilibrary`
--
CREATE DATABASE IF NOT EXISTS `Unilibrary` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `Unilibrary`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `id` int(11) NOT NULL,
  `id_turmas` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `numeroMatricula` int(11) NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autores`
--

CREATE TABLE `autores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `nacionalidade` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `autoresLivros`
--

CREATE TABLE `autoresLivros` (
  `id` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL,
  `id_autores` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimos`
--

CREATE TABLE `emprestimos` (
  `id` int(11) NOT NULL,
  `id_alunos` int(11) NOT NULL,
  `dataEmprestimo` date NOT NULL,
  `dataDevolucao` date NOT NULL,
  `dataEntrega` date NOT NULL,
  `multa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `emprestimosLivros`
--

CREATE TABLE `emprestimosLivros` (
  `id` int(11) NOT NULL,
  `id_livros` int(11) NOT NULL,
  `id_emprestimos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `livros`
--

CREATE TABLE `livros` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `quantidadePaginas` int(11) NOT NULL,
  `materia` varchar(100) NOT NULL,
  `idioma` varchar(100) NOT NULL,
  `editora` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(11) NOT NULL,
  `numeroTurma` int(11) NOT NULL,
  `nomeCurso` varchar(100) NOT NULL,
  `inicioAulas` date NOT NULL,
  `terminoAulas` date NOT NULL,
  `salas` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`id_turmas`);

--
-- Índices de tabela `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `autoresLivros`
--
ALTER TABLE `autoresLivros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk5` (`id_livros`),
  ADD KEY `fk6` (`id_autores`);

--
-- Índices de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`id_alunos`);

--
-- Índices de tabela `emprestimosLivros`
--
ALTER TABLE `emprestimosLivros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk7` (`id_livros`),
  ADD KEY `fk8` (`id_emprestimos`);

--
-- Índices de tabela `livros`
--
ALTER TABLE `livros`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `autores`
--
ALTER TABLE `autores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `autoresLivros`
--
ALTER TABLE `autoresLivros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emprestimos`
--
ALTER TABLE `emprestimos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `emprestimosLivros`
--
ALTER TABLE `emprestimosLivros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `livros`
--
ALTER TABLE `livros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `turmas`
--
ALTER TABLE `turmas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`id_turmas`) REFERENCES `turmas` (`id`);

--
-- Restrições para tabelas `autoresLivros`
--
ALTER TABLE `autoresLivros`
  ADD CONSTRAINT `fk5` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `fk6` FOREIGN KEY (`id_autores`) REFERENCES `autores` (`id`);

--
-- Restrições para tabelas `emprestimos`
--
ALTER TABLE `emprestimos`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`id_alunos`) REFERENCES `alunos` (`id`);

--
-- Restrições para tabelas `emprestimosLivros`
--
ALTER TABLE `emprestimosLivros`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`id_livros`) REFERENCES `livros` (`id`),
  ADD CONSTRAINT `fk8` FOREIGN KEY (`id_emprestimos`) REFERENCES `emprestimos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
