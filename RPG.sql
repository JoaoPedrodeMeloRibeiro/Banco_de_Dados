-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema RPG
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema RPG
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RPG` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema new_schema1
-- -----------------------------------------------------
USE `RPG` ;

-- -----------------------------------------------------
-- Table `RPG`.`Raça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Raça` (
  `AumentoDeAtributo` VARCHAR(200) NULL,
  `Habilidades` VARCHAR(500) NULL,
  `TamanhoMédio` INT NULL,
  `LínguasConhecidas` VARCHAR(45) NULL,
  `Nomes mais comuns` VARCHAR(45) NULL,
  `id` VARCHAR(45) NOT NULL,
  `Ficha_idFicha` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Raça_Ficha1_idx` (`Ficha_idFicha` ASC) VISIBLE,
  CONSTRAINT `fk_Raça_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `RPG`.`Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table `RPG`.`Modifica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Modifica` (
  `Raça_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Raça_id`),
  INDEX `fk_Atributos_has_Raça_Raça1_idx` (`Raça_id` ASC) VISIBLE,
  CONSTRAINT `fk_Atributos_has_Raça_Raça1`
    FOREIGN KEY (`Raça_id`)
    REFERENCES `RPG`.`Raça` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table `RPG`.`Atributos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Atributos` (
  `FOR` INT NOT NULL,
  `DES` INT NOT NULL,
  `CON` INT NOT NULL,
  `INT` INT NOT NULL,
  `SAB` INT NOT NULL,
  `CAR` INT NOT NULL,
  `PontosDeVida` INT NULL,
  `CA` INT NULL,
  `PercepçãoPassiva` INT NULL AUTO_INCREMENT,
  `idProficiências` VARCHAR(45) NOT NULL,
  `Modifica_Raça_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProficiências`),
  INDEX `fk_Atributos_Modifica1_idx` (`Modifica_Raça_id` ASC) VISIBLE,
  CONSTRAINT `fk_Atributos_Modifica1`
    FOREIGN KEY (`Modifica_Raça_id`)
    REFERENCES `RPG`.`Modifica` (`Raça_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
 ;


-- -----------------------------------------------------
-- Table `RPG`.`Classe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Classe` (
  `idClasse` INT NOT NULL,
  `Proficiências` VARCHAR(45) NULL,
  `Itens Iniciais` VARCHAR(500) NULL,
  `Nível` INT NULL,
  `Dado de vida` VARCHAR(45) NULL,
  `Habilidades` VARCHAR(500) NULL,
  `Modificações` VARCHAR(45) NULL,
  PRIMARY KEY (`idClasse`))
 ;


-- -----------------------------------------------------
-- Table `RPG`.`Ficha`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Ficha` (
  `idFicha` INT NOT NULL AUTO_INCREMENT,
  `Jogador` VARCHAR(45) NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Xp` INT NULL,
  `Idade` INT NULL,
  `Inspiração` INT NULL,
  `Atributos_idProficiências` VARCHAR(45) NOT NULL,
  `Classe_idClasse` INT NOT NULL,
  PRIMARY KEY (`idFicha`, `Classe_idClasse`),
  INDEX `fk_Ficha_Atributos1_idx` (`Atributos_idProficiências` ASC) VISIBLE,
  INDEX `fk_Ficha_Classe1_idx` (`Classe_idClasse` ASC) VISIBLE,
  CONSTRAINT `fk_Ficha_Atributos1`
    FOREIGN KEY (`Atributos_idProficiências`)
    REFERENCES `RPG`.`Atributos` (`idProficiências`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ficha_Classe1`
    FOREIGN KEY (`Classe_idClasse`)
    REFERENCES `RPG`.`Classe` (`idClasse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table `RPG`.`Item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.`Item` (
  `idItens` INT NOT NULL AUTO_INCREMENT,
  `Peso` FLOAT NULL,
  `Quantidade` INT NULL,
  `Dano` VARCHAR(15) NULL,
  `Tipo` VARCHAR(45) NULL,
  `Preço` VARCHAR(45) NULL,
  `Itenscol` FLOAT NULL,
  `Ficha_idFicha` INT NOT NULL,
  PRIMARY KEY (`idItens`),
  INDEX `fk_Item_Ficha1_idx` (`Ficha_idFicha` ASC) VISIBLE,
  CONSTRAINT `fk_Item_Ficha1`
    FOREIGN KEY (`Ficha_idFicha`)
    REFERENCES `RPG`.`Ficha` (`idFicha`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `RPG`.` Modifica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `RPG`.` Modifica` (
  `Item_idItens` INT NOT NULL,
  `Atributos_idProficiências` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Item_idItens`, `Atributos_idProficiências`),
  INDEX `fk_Item_has_Atributos_Atributos1_idx` (`Atributos_idProficiências` ASC) VISIBLE,
  INDEX `fk_Item_has_Atributos_Item1_idx` (`Item_idItens` ASC) VISIBLE,
  CONSTRAINT `fk_Item_has_Atributos_Item1`
    FOREIGN KEY (`Item_idItens`)
    REFERENCES `RPG`.`Item` (`idItens`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Item_has_Atributos_Atributos1`
    FOREIGN KEY (`Atributos_idProficiências`)
    REFERENCES `RPG`.`Atributos` (`idProficiências`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
