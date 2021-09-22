-- -----------
-- SCRIPTS DDL
-- -----------
CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_classe (
	id_classe INT NOT NULL AUTO_INCREMENT,
    nome_classe VARCHAR(255) NOT NULL,
	arma_classe VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_classe)
);

CREATE TABLE tb_personagem (
	id_personagem INT NOT NULL AUTO_INCREMENT,
    nome_personagem VARCHAR(255) NOT NULL,
    poder_ataque INT,
    poder_defesa INT,
    fk_classe INT,
    PRIMARY KEY(id_personagem),
    FOREIGN KEY (fk_classe) REFERENCES tb_classe (id_classe)
);

-- -----------
-- SCRIPTS DML
-- -----------
INSERT INTO tb_classe (nome_classe, arma_classe)
VALUES
("Arqueiro(a)", "Arco e Flexa"),
("Assassino(a)", "Adaga"),
("Mago(a)", "Cajado"),
("Guerreiro(a)", "Espada de duas Mãos"),
("Bardo(a)", "Cavaquinho");

INSERT INTO tb_personagem (nome_personagem, poder_ataque, poder_defesa, fk_classe)
VALUES
("Rafa", 1500, 10000, 3),
("Ronan", 200, 10000, 2),
("Priscila", 100, 10000, 1),
("Amanda", 500, 10000, 5),
("Italo", 500, 10000, 5),
("Rani", 200, 10000, 2),
("Leo", 200, 10000, 2),
("Lord Boaz", 200, 15000, 4);

SELECT * FROM tb_personagem
WHERE poder_ataque > 400;

SELECT * FROM tb_personagem
WHERE poder_defesa BETWEEN 12000 AND 18000;

SELECT * FROM tb_personagem
WHERE nome_personagem LIKE 'R%';

SELECT nome_personagem, nome_classe, arma_classe
FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.fk_classe = tb_classe.id_classe;

SELECT nome_personagem, nome_classe, arma_classe
FROM tb_personagem
INNER JOIN tb_classe ON tb_personagem.fk_classe = tb_classe.id_classe
WHERE nome_classe = 'Arqueiro(a)';