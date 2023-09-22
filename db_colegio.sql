-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 22-09-2023 a las 08:04:14
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_colegio`
--
CREATE DATABASE IF NOT EXISTS `db_colegio` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `db_colegio`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `Curso_ID` int(11) NOT NULL,
  `ProfesorID` int(11) DEFAULT NULL,
  `Tipo_curso` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Fecha_inicio` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`Curso_ID`, `ProfesorID`, `Tipo_curso`, `Fecha_inicio`) VALUES
(1, 2, 'Español', '2024-02-12'),
(2, NULL, 'Ingles', '2024-02-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `Estudiante_ID` int(11) NOT NULL,
  `ProfesorID` int(11) NOT NULL,
  `Grupo` varchar(15) COLLATE utf8_spanish_ci NOT NULL,
  `SalonID` int(11) DEFAULT NULL,
  `Cantidad_estudiantes` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`Estudiante_ID`, `ProfesorID`, `Grupo`, `SalonID`, `Cantidad_estudiantes`) VALUES
(2, 2, 'Grupo A', 2, 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `profesores`
--

CREATE TABLE `profesores` (
  `Profesor_ID` int(11) NOT NULL,
  `CursosID` int(11) DEFAULT NULL,
  `Nombre` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `Apellidos` varchar(70) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `profesores`
--

INSERT INTO `profesores` (`Profesor_ID`, `CursosID`, `Nombre`, `Apellidos`) VALUES
(2, NULL, 'Raul', 'Ramirez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salones`
--

CREATE TABLE `salones` (
  `Salon_ID` int(11) NOT NULL,
  `ProfesorID` int(11) NOT NULL,
  `Tipo_salon` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `salones`
--

INSERT INTO `salones` (`Salon_ID`, `ProfesorID`, `Tipo_salon`) VALUES
(2, 2, 'Salon de Español');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`Curso_ID`),
  ADD KEY `ProfesorID` (`ProfesorID`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`Estudiante_ID`),
  ADD KEY `Profesor-ID` (`ProfesorID`),
  ADD KEY `Salon-ID` (`SalonID`);

--
-- Indices de la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD PRIMARY KEY (`Profesor_ID`),
  ADD KEY `CursoID` (`CursosID`);

--
-- Indices de la tabla `salones`
--
ALTER TABLE `salones`
  ADD PRIMARY KEY (`Salon_ID`),
  ADD KEY `Profesor_ID` (`ProfesorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `Curso_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `Estudiante_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `profesores`
--
ALTER TABLE `profesores`
  MODIFY `Profesor_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salones`
--
ALTER TABLE `salones`
  MODIFY `Salon_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD CONSTRAINT `ProfesorID` FOREIGN KEY (`ProfesorID`) REFERENCES `profesores` (`Profesor_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD CONSTRAINT `Profesor-ID` FOREIGN KEY (`ProfesorID`) REFERENCES `profesores` (`Profesor_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `Salon-ID` FOREIGN KEY (`SalonID`) REFERENCES `salones` (`Salon_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `profesores`
--
ALTER TABLE `profesores`
  ADD CONSTRAINT `CursoID` FOREIGN KEY (`CursosID`) REFERENCES `cursos` (`Curso_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salones`
--
ALTER TABLE `salones`
  ADD CONSTRAINT `Profesor_ID` FOREIGN KEY (`ProfesorID`) REFERENCES `profesores` (`Profesor_ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
