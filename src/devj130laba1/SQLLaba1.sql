/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Илья
 * Created: 29.12.2020
 */

-- DEV-J130 задание 1 (Кулигин И. В.)

-- Используемая СУБД MySQL.

-- -------------------------------------------------

CREATE DATABASE DEV_J130_KuliginIlya;

USE DEV_J130_KuliginIlya;

-- -------------------------------------------------

CREATE TABLE autors
(
autor_id INT NOT NULL AUTO_INCREMENT,
autor_name VARCHAR(64) NOT NULL,
note VARCHAR(255),
PRIMARY KEY (autor_id)
);

INSERT INTO autors
(autor_name, note)
VALUES
('Arnold Grey', '-'),
('Tom Hawkins', 'new author'),
('Jim Beam', '-');

-- -------------------------------------------------

CREATE TABLE documents
(
document_id INT NOT NULL PRIMARY KEY,
document_name VARCHAR(64) NOT NULL,
text BLOB(1024),
creation_date DATE NOT NULL,
autor_id INT NOT NULL,
CONSTRAINT autors_autor_id_fk
FOREIGN KEY (autor_id)
REFERENCES autors (autor_id)
);

INSERT INTO documents
VALUES
(1, 'Project plan',  'First content',  '2020-01-01', 1),
(2, 'First report',  'Second content', '1980-05-09', 2),
(3, 'Test result',   'Third content',  '1989-06-09', 2),
(4, 'Second report', 'Report content', '2019-05-19', 3);

-- -------------------------------------------------

UPDATE autors
SET note = 'No data'
WHERE note = '-';

-- -------------------------------------------------

SELECT autors.autor_name, documents.document_id, documents.document_name FROM autors INNER JOIN documents
ON(autors.autor_id = documents.autor_id)
WHERE document_name LIKE '%report';



