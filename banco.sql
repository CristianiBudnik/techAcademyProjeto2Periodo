CREATE TABLE categoria (
  id       INT          NOT NULL AUTO_INCREMENT,
  nome     VARCHAR(100) NOT NULL,
  descricao TEXT,
  imagem   VARCHAR(255),
  PRIMARY KEY (id)
);

CREATE TABLE produto (
  id           INT          NOT NULL AUTO_INCREMENT,
  id_categoria INT          NOT NULL,
  nome         VARCHAR(100) NOT NULL,
  descricao    TEXT,
  PRIMARY KEY (id),
  CONSTRAINT fk_produto_categoria
    FOREIGN KEY (id_categoria) REFERENCES categoria (id)
);

CREATE TABLE produto_imagem (
  id         INT          NOT NULL AUTO_INCREMENT,
  id_produto INT          NOT NULL,
  url        VARCHAR(255) NOT NULL,
  ordem      INT          NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  CONSTRAINT fk_imagem_produto
    FOREIGN KEY (id_produto) REFERENCES produto (id)
    ON DELETE CASCADE
);

CREATE TABLE atributo (
  id   INT          NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE produto_atributo (
  id_produto  INT          NOT NULL,
  id_atributo INT          NOT NULL,
  valor       VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_produto, id_atributo),
  CONSTRAINT fk_pa_produto
    FOREIGN KEY (id_produto)  REFERENCES produto  (id) ON DELETE CASCADE,
  CONSTRAINT fk_pa_atributo
    FOREIGN KEY (id_atributo) REFERENCES atributo (id) ON DELETE CASCADE
);

INSERT INTO categoria (nome, descricao, imagem) VALUES
('Janela',             'Janelas de alumínio e vidro',         NULL),
('Box para Banheiro',  'Box em vidro temperado',              NULL),
('Espelhos',           'Espelhos com diferentes acabamentos', NULL),
('Cobertura de Vidro', 'Coberturas laminadas e temperadas',   NULL);


INSERT INTO atributo (nome) VALUES
('Cor do Vidro'),
('Cor do Alumínio'),
('Espessura'),
('Linha do Alumínio');


INSERT INTO produto (id_categoria, nome, descricao) VALUES
(1, 'Janela de Correr',   'Janela em alumínio linha suprema com vedação acústica'),
(2, 'Box Frontal',        'Box em vidro temperado 8mm com ferragens inox'),
(3, 'Espelho Bisotê',     'Espelho cristal com lapidação fina e fixação invisível'),
(4, 'Cobertura Laminada', 'Cobertura em vidro laminado para áreas externas');


INSERT INTO produto_imagem (id_produto, url, ordem) VALUES
(1, 'img/cobertura/cobertura.jpeg', 1),
(1, 'img/cobertura/cobertura2.jpeg', 2),
(1, 'img/cobertura/cobertura3.jpeg', 3),
(1, 'img/cobertura/cobertura4.jpeg', 4),
(1, 'img/cobertura/cobertura5.jpeg', 5),
(1, 'img/cobertura/cobertura6.jpeg', 6),
(1, 'img/cobertura/cobertura7.jpeg', 7),
(1, 'img/cobertura/coberturaEspelhada.jpeg', 8),
(1, 'img/cobertura/coberturaEspelhada2.jpeg', 9),
(1, 'img/cobertura/coberturaEspelhada3.jpeg', 10),
(1, 'img/cobertura/coberturaVideo.mp4', 11),
(2, 'img/boxBanheiro/box1.jpeg', 1),
(2, 'img/boxBanheiro/box2.jpeg', 2),
(2, 'img/boxBanheiro/box3.jpeg', 3),
(2, 'img/boxBanheiro/box4.jpeg', 4),
(2, 'img/boxBanheiro/box5.jpeg', 5),
(2, 'img/boxBanheiro/box6.jpeg', 6),
(2, 'img/boxBanheiro/boxDourado.jpeg', 7),
(2, 'img/boxBanheiro/boxDourado2.jpeg', 8);


INSERT INTO produto_atributo (id_produto, id_atributo, valor) VALUES
(1, 1, 'Incolor'),
(1, 2, 'Natural'),
(1, 3, '6mm'),
(1, 4, 'Suprema'),
(2, 1, 'Incolor'),
(2, 3, '8mm'),
(3, 1, 'Cristal'),
(4, 1, 'Laminado'),
(4, 3, '10mm');


SELECT
  p.id,
  p.nome,
  p.descricao,
  c.nome AS categoria
FROM produto p
JOIN categoria c ON c.id = p.id_categoria
ORDER BY c.nome, p.nome;



SELECT
  p.id,
  p.nome,
  p.descricao
FROM produto p
JOIN categoria c ON c.id = p.id_categoria
WHERE c.nome = 'Janela'
ORDER BY p.nome;


SELECT
  p.nome                AS produto,
  p.descricao,
  c.nome                AS categoria,
  a.nome                AS atributo,
  pa.valor,
  pi.url                AS imagem,
  pi.ordem
FROM produto p
JOIN categoria c              ON c.id  = p.id_categoria
LEFT JOIN produto_atributo pa ON pa.id_produto  = p.id
LEFT JOIN atributo a          ON a.id  = pa.id_atributo
LEFT JOIN produto_imagem pi   ON pi.id_produto  = p.id
WHERE p.id = 1
ORDER BY pi.ordem;


SELECT
  p.id,
  p.nome,
  p.descricao,
  c.nome AS categoria,
  pi.url AS imagem_principal
FROM produto p
JOIN categoria c ON c.id = p.id_categoria
LEFT JOIN produto_imagem pi ON pi.id_produto = p.id AND pi.ordem = 1
ORDER BY c.nome, p.nome;


SELECT
  p.id,
  p.nome,
  pa.valor
FROM produto p
JOIN produto_atributo pa ON pa.id_produto  = p.id
JOIN atributo a          ON a.id  = pa.id_atributo
WHERE a.nome = 'Espessura'
ORDER BY p.nome;


SELECT
  c.nome        AS categoria,
  c.descricao,
  COUNT(p.id)   AS total_produtos
FROM categoria c
LEFT JOIN produto p ON p.id_categoria = c.id
GROUP BY c.id, c.nome, c.descricao
ORDER BY c.nome;