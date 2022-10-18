-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema parking_lot
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema parking_lot
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `parking_lot` DEFAULT CHARACTER SET utf8 ;
USE `parking_lot` ;

-- -----------------------------------------------------
-- Table `parking_lot`.`turnos_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`turnos_usuarios` (
  `idturnos_usuarios` INT NOT NULL,
  `horario_turno` DATETIME NOT NULL,
  `descripcion_turnos` VARCHAR(40) NULL,
  PRIMARY KEY (`idturnos_usuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`tipo_usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`tipo_usuarios` (
  `idtipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `nombre_usuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipo_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`usuarios` (
  `idusuarios` INT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `contraseña` VARCHAR(40) NOT NULL,
  `nombre_usuario` VARCHAR(45) NULL,
  `apellido_usuario` VARCHAR(45) NULL,
  `turnos_usuarios_idturnos_usuarios` INT NOT NULL,
  `tipo_usuarios_idtipo_usuario` INT NOT NULL,
  PRIMARY KEY (`idusuarios`, `turnos_usuarios_idturnos_usuarios`, `tipo_usuarios_idtipo_usuario`),
  INDEX `fk_usuarios_turnos_usuarios1_idx` (`turnos_usuarios_idturnos_usuarios` ASC) VISIBLE,
  INDEX `fk_usuarios_tipo_usuarios1_idx` (`tipo_usuarios_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_turnos_usuarios1`
    FOREIGN KEY (`turnos_usuarios_idturnos_usuarios`)
    REFERENCES `parking_lot`.`turnos_usuarios` (`idturnos_usuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_tipo_usuarios1`
    FOREIGN KEY (`tipo_usuarios_idtipo_usuario`)
    REFERENCES `parking_lot`.`tipo_usuarios` (`idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`atencion cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`atencion cliente` (
  `idatencion cliente` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATETIME NULL,
  `usuarios_idusuarios` INT NOT NULL,
  `usuarios_turnos_usuarios_idturnos_usuarios` INT NOT NULL,
  `usuarios_tipo_usuarios_idtipo_usuario` INT NOT NULL,
  PRIMARY KEY (`idatencion cliente`, `usuarios_idusuarios`, `usuarios_turnos_usuarios_idturnos_usuarios`, `usuarios_tipo_usuarios_idtipo_usuario`),
  UNIQUE INDEX `idatencion cliente_UNIQUE` (`idatencion cliente` ASC) VISIBLE,
  INDEX `fk_atencion cliente_usuarios1_idx` (`usuarios_idusuarios` ASC, `usuarios_turnos_usuarios_idturnos_usuarios` ASC, `usuarios_tipo_usuarios_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_atencion cliente_usuarios1`
    FOREIGN KEY (`usuarios_idusuarios` , `usuarios_turnos_usuarios_idturnos_usuarios` , `usuarios_tipo_usuarios_idtipo_usuario`)
    REFERENCES `parking_lot`.`usuarios` (`idusuarios` , `turnos_usuarios_idturnos_usuarios` , `tipo_usuarios_idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`cliente` (
  `dni_cliente` INT NOT NULL,
  `numero_cliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(50) NOT NULL,
  `apellido` VARCHAR(50) NOT NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(70) NULL,
  `atencion cliente_idatencion cliente` INT NOT NULL,
  `atencion cliente_usuarios_idusuarios` INT NOT NULL,
  `atencion cliente_usuarios_turnos_usuarios_idturnos_usuarios` INT NOT NULL,
  `atencion cliente_usuarios_tipo_usuarios_idtipo_usuario` INT NOT NULL,
  UNIQUE INDEX `dni_cliente_UNIQUE` (`dni_cliente` ASC) VISIBLE,
  UNIQUE INDEX `numero_cliente_UNIQUE` (`numero_cliente` ASC) VISIBLE,
  PRIMARY KEY (`dni_cliente`, `atencion cliente_idatencion cliente`, `atencion cliente_usuarios_idusuarios`, `atencion cliente_usuarios_turnos_usuarios_idturnos_usuarios`, `atencion cliente_usuarios_tipo_usuarios_idtipo_usuario`),
  INDEX `fk_cliente_atencion cliente1_idx` (`atencion cliente_idatencion cliente` ASC, `atencion cliente_usuarios_idusuarios` ASC, `atencion cliente_usuarios_turnos_usuarios_idturnos_usuarios` ASC, `atencion cliente_usuarios_tipo_usuarios_idtipo_usuario` ASC) VISIBLE,
  CONSTRAINT `fk_cliente_atencion cliente1`
    FOREIGN KEY (`atencion cliente_idatencion cliente` , `atencion cliente_usuarios_idusuarios` , `atencion cliente_usuarios_turnos_usuarios_idturnos_usuarios` , `atencion cliente_usuarios_tipo_usuarios_idtipo_usuario`)
    REFERENCES `parking_lot`.`atencion cliente` (`idatencion cliente` , `usuarios_idusuarios` , `usuarios_turnos_usuarios_idturnos_usuarios` , `usuarios_tipo_usuarios_idtipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`sector_estacionamiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`sector_estacionamiento` (
  `idsector` INT NOT NULL,
  `descrpcion_sector` VARCHAR(80) NULL,
  PRIMARY KEY (`idsector`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`parcela`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`parcela` (
  `idparcela` INT NOT NULL,
  `descripcion_parcela` VARCHAR(60) NULL,
  `sector_estacionamiento_idsector` INT NOT NULL,
  PRIMARY KEY (`idparcela`, `sector_estacionamiento_idsector`),
  UNIQUE INDEX `idparcela_UNIQUE` (`idparcela` ASC) VISIBLE,
  INDEX `fk_parcela_sector_estacionamiento1_idx` (`sector_estacionamiento_idsector` ASC) VISIBLE,
  CONSTRAINT `fk_parcela_sector_estacionamiento1`
    FOREIGN KEY (`sector_estacionamiento_idsector`)
    REFERENCES `parking_lot`.`sector_estacionamiento` (`idsector`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`vehiculos` (
  `idvehiculos` INT NOT NULL AUTO_INCREMENT,
  `petente` INT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `cliente_dni_cliente` INT NOT NULL,
  `parcela_idparcela` INT NOT NULL,
  PRIMARY KEY (`idvehiculos`, `cliente_dni_cliente`, `parcela_idparcela`),
  UNIQUE INDEX `idvehiculos_UNIQUE` (`idvehiculos` ASC) VISIBLE,
  UNIQUE INDEX `petente_UNIQUE` (`petente` ASC) VISIBLE,
  INDEX `fk_vehiculos_cliente1_idx` (`cliente_dni_cliente` ASC) VISIBLE,
  INDEX `fk_vehiculos_parcela1_idx` (`parcela_idparcela` ASC) VISIBLE,
  CONSTRAINT `fk_vehiculos_cliente1`
    FOREIGN KEY (`cliente_dni_cliente`)
    REFERENCES `parking_lot`.`cliente` (`dni_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vehiculos_parcela1`
    FOREIGN KEY (`parcela_idparcela`)
    REFERENCES `parking_lot`.`parcela` (`idparcela`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`detalle` (
  `idnumero_detalle` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(45) NULL,
  `precio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idnumero_detalle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `parking_lot`.`factura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `parking_lot`.`factura` (
  `idnumero_factura` INT NOT NULL AUTO_INCREMENT,
  `fecha_factura` DATETIME NOT NULL,
  `cliente_dni_cliente` INT NOT NULL,
  `detalle_idnumero_detalle` INT NOT NULL,
  PRIMARY KEY (`idnumero_factura`, `cliente_dni_cliente`, `detalle_idnumero_detalle`),
  INDEX `fk_factura_cliente1_idx` (`cliente_dni_cliente` ASC) VISIBLE,
  INDEX `fk_factura_detalle1_idx` (`detalle_idnumero_detalle` ASC) VISIBLE,
  CONSTRAINT `fk_factura_cliente1`
    FOREIGN KEY (`cliente_dni_cliente`)
    REFERENCES `parking_lot`.`cliente` (`dni_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_detalle1`
    FOREIGN KEY (`detalle_idnumero_detalle`)
    REFERENCES `parking_lot`.`detalle` (`idnumero_detalle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
