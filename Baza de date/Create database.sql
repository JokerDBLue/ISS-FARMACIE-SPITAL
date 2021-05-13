--CREATE DATABASE farmacie;

CREATE TABLE Farmacist(
    id_farmacist SERIAL PRIMARY KEY,
    username VARCHAR(50),
    nume VARCHAR(50),
    prenume VARCHAR(50),
    tip_utilizator VARCHAR(15),
    password VARCHAR(50)
);

CREATE TABLE Sectie(
    id_sectie SERIAL PRIMARY KEY,
    adresa VARCHAR(50),
    nume VARCHAR(30)
);

CREATE TABLE Medic(
    id_medic SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    nume VARCHAR(50),
    prenume VARCHAR(50),
    tip_utilizator VARCHAR(15),
    password VARCHAR(50),
    id_sectie INT,
    CONSTRAINT fk_sectie
                     FOREIGN KEY (id_sectie)
                     REFERENCES Sectie(id_sectie) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Produs(
    id_produs SERIAL PRIMARY KEY ,
    nume VARCHAR(50) UNIQUE,
    pret FLOAT,
    cantitate INT
);

CREATE TABLE Comanda(
    id_medic INT,
    id_produs INT,
    id_comanda VARCHAR(20),
    nume_sectie VARCHAR(50),
    status VARCHAR(40),
    id_farmacist INT,
    cantitate INT,
    CONSTRAINT fk_medic
                    FOREIGN KEY (id_medic)
                    REFERENCES Medic(id_medic) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_produs
                     FOREIGN KEY (id_produs)
                     REFERENCES Produs(id_produs) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_farmacist
                    FOREIGN KEY (id_farmacist)
                    REFERENCES Farmacist(id_farmacist) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT pk_comanda
                    PRIMARY KEY (id_comanda)
);

CREATE TABLE StocSectie(
    id_sectie INT,
    id_produs INT,
    cantitate INT,
    CONSTRAINT fk_sectie
                     FOREIGN KEY (id_sectie)
                     REFERENCES Sectie(id_sectie) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_produs
                     FOREIGN KEY (id_produs)
                     REFERENCES Produs(id_produs) ON UPDATE CASCADE ON DELETE CASCADE
);