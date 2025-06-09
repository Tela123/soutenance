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

CREATE TABLE IF NOT EXISTS patients (
    id_patient INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    date_naissance DATE,
    sexe ENUM('M', 'F'),
    adresse TEXT,
    telephone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    groupe_sanguin VARCHAR(10),
    allergies TEXT,
    antecedents_medicaux TEXT,
    assurance VARCHAR(100)
);
CREATE TABLE IF NOT EXISTS medecins (
    id_medecin INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    specialite VARCHAR(100),
    service VARCHAR(100),
    telephone VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    horaires TEXT
);

CREATE TABLE Examens (
    id_examen INT PRIMARY KEY AUTO_INCREMENT,
    id_patient INT,
    id_medecin INT,
    id_laborantin INT,
    date_demande DATE DEFAULT CURRENT_DATE,
    date_rendu DATE,
    type_examen VARCHAR(255),
    statut ENUM('En attente', 'En cours', 'Terminé'),
    observations TEXT,
    FOREIGN KEY (id_patient) REFERENCES Patients(id_patient),
    FOREIGN KEY (id_medecin) REFERENCES Medecins(id_medecin)
    FOREIGN KEY (id_laborantin) REFERENCES Laborantin(id_laborantin)
);

CREATE TABLE Consultations (
    id_consultation INT PRIMARY KEY AUTO_INCREMENT,
    id_patient INT,
    id_medecin INT,
    date_consultation DATETIME DEFAULT CURRENT_TIMESTAMP,
    diagnostic TEXT,
    traitement TEXT,
    FOREIGN KEY (id_patient) REFERENCES Patients(id_patient),
    FOREIGN KEY (id_medecin) REFERENCES Medecins(id_medecin)
);
CREATE TABLE Hospitalisations (
    id_hospitalisation INT PRIMARY KEY AUTO_INCREMENT,
    id_patient INT,
    id_medecin INT,
    date_entree DATE,
    date_sortie DATE,
    chambre VARCHAR(10),
    motif TEXT,
    FOREIGN KEY (id_patient) REFERENCES Patients(id_patient),
    FOREIGN KEY (id_medecin) REFERENCES Medecins(id_medecin)
);
CREATE TABLE Medicaments (
    id_medicament INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100),
    categorie VARCHAR(50),
    quantite INT,
    date_expiration DATE
);
CREATE TABLE Prescriptions (
    id_prescription INT PRIMARY KEY AUTO_INCREMENT,
    id_consultation INT,
    id_medicament INT,
    dosage VARCHAR(50),
    duree VARCHAR(50),
    FOREIGN KEY (id_consultation) REFERENCES Consultations(id_consultation),
    FOREIGN KEY (id_medicament) REFERENCES Medicaments(id_medicament)
);
CREATE TABLE IF NOT EXISTS ordonnance(
id INT AUTO_INCREMENT PRIMARY KEY,
id_exam INT AUTO_INCREMENT FOREIGN KEY,
id_patient INT AUTO_INCREMENT FOREIGN KEY,
nom_medoc
  );
CREATE TABLE Facturation (
    id_facture INT PRIMARY KEY AUTO_INCREMENT,
    id_patient INT,
    montant DECIMAL(10,2),
    date_paiement DATE,
    mode_paiement VARCHAR(50),
    statut ENUM('Payé', 'En attente'),
    FOREIGN KEY (id_patient) REFERENCES Patients(id_patient)
);




