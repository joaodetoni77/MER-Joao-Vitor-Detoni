-- -----------------------------------------------------
-- Link GitHub: https://github.com/joaodetoni77/MER-Joao-Vitor-Detoni.git
-- Link Drive/Draw.io: https://drive.google.com/file/d/1-VJEJ4uBGxF6-OEPntpNyksyrXbr6pS-/view?usp=sharing

-- -----------------------------------------------------

DROP DATABASE IF EXISTS `detoni`;
CREATE SCHEMA `detoni` DEFAULT CHARACTER SET utf8;
USE `detoni`;

-- -----------------------------------------------------
-- Tabela `detoni`.`Escola`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Escola`;
CREATE TABLE `detoni`.`Escola` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cnpj` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Cargo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Cargo`;
CREATE TABLE `detoni`.`Cargo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Direcao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Direcao`;
CREATE TABLE `detoni`.`Direcao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `salario` DOUBLE NOT NULL,
  `Escola_id` INT NOT NULL,
  `Cargo_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Escola_id`) REFERENCES `detoni`.`Escola` (`id`),
  FOREIGN KEY (`Cargo_id`) REFERENCES `detoni`.`Cargo` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Curso`;
CREATE TABLE `detoni`.`Curso` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `carga_horaria` INT NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Aluno`;
CREATE TABLE `detoni`.`Aluno` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `cpf` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Matricula`;
CREATE TABLE `detoni`.`Matricula` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` INT NOT NULL,
  `data_cadastro` DATE NOT NULL,
  `Curso_id` INT NOT NULL,
  `Aluno_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Curso_id`) REFERENCES `detoni`.`Curso` (`id`),
  FOREIGN KEY (`Aluno_id`) REFERENCES `detoni`.`Aluno` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Professor`;
CREATE TABLE `detoni`.`Professor` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `salario` DOUBLE NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Turma`;
CREATE TABLE `detoni`.`Turma` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `codigo_identificacao` INT NOT NULL,
  `vagas` INT NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Disciplina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Disciplina`;
CREATE TABLE `detoni`.`Disciplina` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `carga_horaria` INT NOT NULL,
  `id_disciplina` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`id_disciplina`) REFERENCES `detoni`.`Disciplina` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Projeto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Projeto`;
CREATE TABLE `detoni`.`Projeto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `resumo` VARCHAR(500) NOT NULL,
  `Professor_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Professor_id`) REFERENCES `detoni`.`Professor` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Anotacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Anotacao`;
CREATE TABLE `detoni`.`Anotacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(500) NOT NULL,
  `Disciplina_id` INT NOT NULL,
  `Aluno_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Disciplina_id`) REFERENCES `detoni`.`Disciplina` (`id`),
  FOREIGN KEY (`Aluno_id`) REFERENCES `detoni`.`Aluno` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Categoria`;
CREATE TABLE `detoni`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Avaliacao`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Avaliacao`;
CREATE TABLE `detoni`.`Avaliacao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricao` TEXT(1000) NOT NULL,
  `nota` DOUBLE NOT NULL,
  `Disciplina_id` INT NOT NULL,
  `Aluno_id` INT NOT NULL,
  `Categoria_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`Disciplina_id`) REFERENCES `detoni`.`Disciplina` (`id`),
  FOREIGN KEY (`Aluno_id`) REFERENCES `detoni`.`Aluno` (`id`),
  FOREIGN KEY (`Categoria_id`) REFERENCES `detoni`.`Categoria` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Projeto_has_Aluno`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Projeto_has_Aluno`;
CREATE TABLE `detoni`.`Projeto_has_Aluno` (
  `Projeto_id` INT NOT NULL,
  `Aluno_id` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  FOREIGN KEY (`Projeto_id`) REFERENCES `detoni`.`Projeto` (`id`),
  FOREIGN KEY (`Aluno_id`) REFERENCES `detoni`.`Aluno` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Disciplina_has_Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Disciplina_has_Turma`;
CREATE TABLE `detoni`.`Disciplina_has_Turma` (
  `Disciplina_id` INT NOT NULL,
  `Turma_id` INT NOT NULL,
  `carga_horaria` INT NOT NULL,
  FOREIGN KEY (`Disciplina_id`) REFERENCES `detoni`.`Disciplina` (`id`),
  FOREIGN KEY (`Turma_id`) REFERENCES `detoni`.`Turma` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Professor_has_Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Professor_has_Turma`;
CREATE TABLE `detoni`.`Professor_has_Turma` (
  `Professor_id` INT NOT NULL,
  `Turma_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  FOREIGN KEY (`Professor_id`) REFERENCES `detoni`.`Professor` (`id`),
  FOREIGN KEY (`Turma_id`) REFERENCES `detoni`.`Turma` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Escola_has_Curso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Escola_has_Curso`;
CREATE TABLE `detoni`.`Escola_has_Curso` (
  `Escola_id` INT NOT NULL,
  `Curso_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  FOREIGN KEY (`Escola_id`) REFERENCES `detoni`.`Escola` (`id`),
  FOREIGN KEY (`Curso_id`) REFERENCES `detoni`.`Curso` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Curso_has_Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Curso_has_Professor`;
CREATE TABLE `detoni`.`Curso_has_Professor` (
  `Curso_id` INT NOT NULL,
  `Professor_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  FOREIGN KEY (`Curso_id`) REFERENCES `detoni`.`Curso` (`id`),
  FOREIGN KEY (`Professor_id`) REFERENCES `detoni`.`Professor` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Disciplina_has_Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Disciplina_has_Professor`;
CREATE TABLE `detoni`.`Disciplina_has_Professor` (
  `Disciplina_id` INT NOT NULL,
  `Professor_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  FOREIGN KEY (`Disciplina_id`) REFERENCES `detoni`.`Disciplina` (`id`),
  FOREIGN KEY (`Professor_id`) REFERENCES `detoni`.`Professor` (`id`));


-- -----------------------------------------------------
-- Tabela `detoni`.`Curso_has_Turma`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `detoni`.`Curso_has_Turma`;
CREATE TABLE `detoni`.`Curso_has_Turma` (
  `Curso_id` INT NOT NULL,
  `Turma_id` INT NOT NULL,
  `data_inicio` DATE NOT NULL,
  FOREIGN KEY (`Curso_id`) REFERENCES `detoni`.`Curso` (`id`),
  FOREIGN KEY (`Turma_id`) REFERENCES `detoni`.`Turma` (`id`));