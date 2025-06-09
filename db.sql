#base de données

CREATE DATABASE IF NOT EXISTS hopital;
USE hopital;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(100),
    role ENUM('superadmin', 'docteur', 'infirmier', 'pharmacien', 'patient', 'directeur', 'laborantin'),
    photo VARCHAR(255),
    statut ENUM('actif', 'inactif') DEFAULT 'actif'
);

#exemple utilisateurs

INSERT INTO users (nom, prenom, email, mot_de_passe, role) VALUES
('Admin', 'Super', 'admin@hopital.com', 'admin123', 'superadmin'),
('Jean', 'Docteur', 'jean@hopital.com', 'pass123', 'docteur'),
('Pauline', 'Pharma', 'pauline@hopital.com', 'pharma123', 'pharmacien'),
('Claire', 'Patient', 'claire@hopital.com', 'patient123', 'patient');

CREATE TABLE IF NOT EXISTS ordonnance(
id INT AUTO_INCREMENT PRIMARY KEY,
id_exam INT AUTO_INCREMENT FOREIGN KEY,
id_patient INT AUTO_INCREMENT FOREIGN KEY,
nom_medoc
  );


