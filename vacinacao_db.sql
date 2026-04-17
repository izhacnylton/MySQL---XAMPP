-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/04/2026 às 19:48
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `vacinacao_db`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aplicacao_vacina`
--

CREATE TABLE `aplicacao_vacina` (
  `id_aplicacao` int(11) NOT NULL,
  `data_aplicacao` date NOT NULL,
  `dose` varchar(30) NOT NULL,
  `via_aplicacao` varchar(50) DEFAULT NULL,
  `local_aplicacao` varchar(50) DEFAULT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `id_paciente` int(11) NOT NULL,
  `id_profissional` int(11) NOT NULL,
  `id_lote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aplicacao_vacina`
--

INSERT INTO `aplicacao_vacina` (`id_aplicacao`, `data_aplicacao`, `dose`, `via_aplicacao`, `local_aplicacao`, `observacao`, `id_paciente`, `id_profissional`, `id_lote`) VALUES
(1, '2026-04-13', '1° dose', 'intramuscular', 'Braço esquerdo', 'Sem intercorrências', 1, 1, 1),
(2, '2026-02-23', '1° dose', 'subcutânea', 'Braço esquerdo', 'Sem intercorrências', 6, 4, 2),
(3, '2026-07-10', '1° dose', 'intramuscular', 'Coxa esquerda', 'Sem intercorrências', 7, 3, 3),
(4, '2026-10-13', '1° dose', 'oral', 'Boca', 'Sem intercorrências', 5, 2, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cargo_profissional`
--

CREATE TABLE `cargo_profissional` (
  `id_cargo` int(11) NOT NULL,
  `nome_cargo` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cargo_profissional`
--

INSERT INTO `cargo_profissional` (`id_cargo`, `nome_cargo`) VALUES
(3, 'Aplicador Vacina'),
(2, 'Enfermagem'),
(1, 'Médico'),
(4, 'Técnico em enfermagem');

-- --------------------------------------------------------

--
-- Estrutura para tabela `lote_vacina`
--

CREATE TABLE `lote_vacina` (
  `id_lote` int(11) NOT NULL,
  `numero_lote` varchar(50) NOT NULL,
  `data_validade` date NOT NULL,
  `quantidade_disponivel` int(11) NOT NULL,
  `id_vacina` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `lote_vacina`
--

INSERT INTO `lote_vacina` (`id_lote`, `numero_lote`, `data_validade`, `quantidade_disponivel`, `id_vacina`) VALUES
(1, 'LT2026001', '2027-12-31', 100, 1),
(2, 'LT2019002', '2027-12-31', 1000, 2),
(3, 'LT2026003', '2029-12-31', 150, 3),
(4, 'LT2026004', '2029-12-31', 300, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `cns` varchar(20) DEFAULT NULL,
  `data_nascimento` date NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nome`, `cpf`, `cns`, `data_nascimento`, `sexo`, `telefone`, `endereco`) VALUES
(1, 'Carlos Lima', '987.654.321-00', '9887568', '2015-03-10', 'M', '(92) 98888-0000', 'Manaus-AM'),
(2, 'Ana Beatriz', '098.765.432-11', '8932443', '2000-06-19', 'F', '(92) 93333-4444', 'Manaus-AM'),
(5, 'Débora Marques', '534.628.716-47', '7236487', '1974-12-12', 'F', '(92) 94524-6254', 'Manaus-AM'),
(6, 'Renato Miranda', '782.465.987-63', '6124365', '2026-04-16', 'M', '(92) 95342-9878', 'Manaus-AM'),
(7, 'Daniel Sampaio', '487.365.876-35', '9867086', '2025-06-16', 'M', '(92) 91524-7264', 'Manaus-AM');

-- --------------------------------------------------------

--
-- Estrutura para tabela `profissional`
--

CREATE TABLE `profissional` (
  `id_profissional` int(11) NOT NULL,
  `nome` varchar(120) NOT NULL,
  `cpf` varchar(14) NOT NULL,
  `cns` varchar(20) DEFAULT NULL,
  `registro_conselho` varchar(30) DEFAULT NULL,
  `id_cargo` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `profissional`
--

INSERT INTO `profissional` (`id_profissional`, `nome`, `cpf`, `cns`, `registro_conselho`, `id_cargo`, `id_usuario`) VALUES
(1, 'Ana Souza', '789.456.675-33', '2344253', 'COREN12345', 1, 3),
(2, 'Ana Paula', '953.756.345-33', '8736483', 'CRV2817643', 2, 4),
(3, 'Ana Clara', '897.768.435-55', '23449778', 'APV87866', 3, 5),
(4, 'Gustavo Melo', '743.658.743-34', '784332', 'TECSN62433', 4, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nome_usuario` varchar(100) NOT NULL,
  `login` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `status` varchar(20) DEFAULT 'ativo',
  `perfil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nome_usuario`, `login`, `senha`, `status`, `perfil`) VALUES
(1, 'Ana Beatriz', 'Ana Beatriz', '1BA245#$', 'ativo', 'Paciente'),
(2, 'Carlos Lima', 'Carloss', '456789', 'ativo', 'Paciente'),
(3, 'Ana Souza', 'ana.souza', '123456', 'ativo', 'profissional'),
(4, 'Ana Paula', 'ana@paula', '12345678', 'ativo', 'profissional'),
(5, 'Ana Clara', 'ana.clara', '87654321', 'ativo', 'profissional'),
(7, 'Débora Marques', 'Debinha', 'deb8394', 'ativo', 'paciente'),
(8, 'Renato Miranda', 'renatao', 'ren85743', 'ativo', 'paciente'),
(9, 'Daniel Sampaio', 'dan.paio', 'dn6736847723', 'ativo', 'paciente'),
(10, 'Gustavo Melo', 'GUGU', 'GUGU843875', 'ativo', 'profissional');

-- --------------------------------------------------------

--
-- Estrutura para tabela `vacina`
--

CREATE TABLE `vacina` (
  `id_vacina` int(11) NOT NULL,
  `nome_vacina` varchar(100) NOT NULL,
  `fabricante` varchar(100) DEFAULT NULL,
  `descricao` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `vacina`
--

INSERT INTO `vacina` (`id_vacina`, `nome_vacina`, `fabricante`, `descricao`) VALUES
(1, 'Influenza', 'Butantan', 'Vacina contra gripe'),
(2, 'Covid-19', 'Sinovac/Butantan', 'Vacina contra COVID-19, ajuda a prevenir infecções graves causadas pelo coronavírus.'),
(3, 'Hepatite B', 'GlaxoSmithKline (GSK)', 'Vacina contra hepatite B, previne infecção viral que afeta o fígado.'),
(4, 'Tríplice Viral (MMR)', 'Merck Sharp & Dohme (MSD)', 'Vacina que protege contra sarampo, caxumba e rubéola.');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD PRIMARY KEY (`id_aplicacao`),
  ADD KEY `id_paciente` (`id_paciente`),
  ADD KEY `id_profissional` (`id_profissional`),
  ADD KEY `id_lote` (`id_lote`);

--
-- Índices de tabela `cargo_profissional`
--
ALTER TABLE `cargo_profissional`
  ADD PRIMARY KEY (`id_cargo`),
  ADD UNIQUE KEY `nome_cargo` (`nome_cargo`);

--
-- Índices de tabela `lote_vacina`
--
ALTER TABLE `lote_vacina`
  ADD PRIMARY KEY (`id_lote`),
  ADD UNIQUE KEY `numero_lote` (`numero_lote`),
  ADD KEY `id_vacina` (`id_vacina`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `cns` (`cns`);

--
-- Índices de tabela `profissional`
--
ALTER TABLE `profissional`
  ADD PRIMARY KEY (`id_profissional`),
  ADD UNIQUE KEY `cpf` (`cpf`),
  ADD UNIQUE KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `login` (`login`);

--
-- Índices de tabela `vacina`
--
ALTER TABLE `vacina`
  ADD PRIMARY KEY (`id_vacina`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  MODIFY `id_aplicacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `cargo_profissional`
--
ALTER TABLE `cargo_profissional`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `lote_vacina`
--
ALTER TABLE `lote_vacina`
  MODIFY `id_lote` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `profissional`
--
ALTER TABLE `profissional`
  MODIFY `id_profissional` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `vacina`
--
ALTER TABLE `vacina`
  MODIFY `id_vacina` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aplicacao_vacina`
--
ALTER TABLE `aplicacao_vacina`
  ADD CONSTRAINT `aplicacao_vacina_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_2` FOREIGN KEY (`id_profissional`) REFERENCES `profissional` (`id_profissional`),
  ADD CONSTRAINT `aplicacao_vacina_ibfk_3` FOREIGN KEY (`id_lote`) REFERENCES `lote_vacina` (`id_lote`);

--
-- Restrições para tabelas `lote_vacina`
--
ALTER TABLE `lote_vacina`
  ADD CONSTRAINT `lote_vacina_ibfk_1` FOREIGN KEY (`id_vacina`) REFERENCES `vacina` (`id_vacina`);

--
-- Restrições para tabelas `profissional`
--
ALTER TABLE `profissional`
  ADD CONSTRAINT `profissional_ibfk_1` FOREIGN KEY (`id_cargo`) REFERENCES `cargo_profissional` (`id_cargo`),
  ADD CONSTRAINT `profissional_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
