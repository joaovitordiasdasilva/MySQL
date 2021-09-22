CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categoria(
id_categoria INT NOT NULL AUTO_INCREMENT,
tamanho VARCHAR(50) NOT NULL,
preco INT NOT NULL,
borda BOOLEAN,
PRIMARY KEY(id_categoria)
);

CREATE TABLE tb_pizza(
id_pizza INT NOT NULL AUTO_INCREMENT,
sabor VARCHAR(25) NOT NULL,
doce BOOLEAN,
refrigerante VARCHAR(25) NOT NULL,
ketchup_sache INT NOT NULL,
mostarda_sache INT NOT NULL,
fk_categoria INT,
PRIMARY KEY(id_pizza),
FOREIGN KEY (fk_categoria) REFERENCES tb_categoria (id_categoria)
);

INSERT INTO tb_categoria(tamanho, preco, borda)
VALUES
("pequeno com borda",25,true),
("pequeno sem borda",20,false),
("medio com borda",40,true),
("medio sem borda",35,false),
("grande com borda",50,true),
("grande sem borda",45,false);

INSERT INTO tb_pizza(sabor, doce, refrigerante, ketchup_sache, mostarda_sache)
VALUES
("calabresa",false,"coca=cola",true,false),
("portuguesa",false,"dolly",true,true),
("chocolate com morango",true,"fanta",false,false);

SELECT * FROM tb_categoria
WHERE preco > 45;

SELECT * FROM tb_categoria
WHERE preco BETWEEN 29 AND 60;

SELECT * FROM tb_pizza
WHERE sabor LIKE 'C%';

SELECT tamanho, sabor, refrigerante
FROM tb_pizza
INNER JOIN tb_categoria ON tb_pizza.fk_categoria = tb_categoria.id_categoria;

SELECT * FROM tb_pizza
WHERE doce = 1