CREATE TABLE categoria (
    id        INTEGER      NOT NULL AUTO_INCREMENT,
    nome      VARCHAR(100) NOT NULL,
    descricao TEXT,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE produto (
    id           INTEGER      NOT NULL AUTO_INCREMENT,
    id_categoria INTEGER      NOT NULL,
    nome         VARCHAR(100) NOT NULL,
    descricao    TEXT,
    PRIMARY KEY (id),
    FOREIGN KEY (id_categoria) REFERENCES categoria(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE imagem (
    id         INTEGER      NOT NULL AUTO_INCREMENT,
    id_produto INTEGER      NOT NULL,
    url        VARCHAR(255) NOT NULL,
    ordem      INTEGER      NOT NULL DEFAULT 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id_produto) REFERENCES produto(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE atributo (
    id   INTEGER      NOT NULL AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE produto_atributo (
    id_produto  INTEGER      NOT NULL,
    id_atributo INTEGER      NOT NULL,
    valor       VARCHAR(255) NOT NULL,
    PRIMARY KEY (id_produto, id_atributo),
    FOREIGN KEY (id_produto)  REFERENCES produto(id),
    FOREIGN KEY (id_atributo) REFERENCES atributo(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO categoria (id, nome, descricao) VALUES
    (1, 'Portas',                     'Portas de alumínio e vidro'),
    (2, 'Janelas',                    'Janelas de alumínio e vidro'),
    (3, 'Fachadas e Fechamentos',     'Pele de vidro, structural glazing, sacada e área gourmet'),
    (4, 'Coberturas',                 'Coberturas fixas, retráteis, pergolados e claraboias'),
    (5, 'Guarda-Corpo',               'Guarda-corpo com vidro, com barra ou misto'),
    (6, 'Portões',                    'Portões deslizante, basculante, de giro e social'),
    (7, 'Divisórias e Amb. Internos', 'Divisória de vidro e box para banheiro'),
    (8, 'Persianas e Brises',         'Persiana integrada automática, brise fixo e brise móvel');


INSERT INTO produto (id, id_categoria, nome, descricao) VALUES
    (1,  1, 'Porta de Correr',               NULL),
    (2,  1, 'Porta de Giro',                 NULL),
    (3,  1, 'Porta Pivotante',               NULL),
    (4,  1, 'Porta Camarão',                 NULL),
    (5,  1, 'Porta Balcão',                  NULL),
    (6,  2, 'Janela de Correr',              NULL),
    (7,  2, 'Janela Maxim-Ar',               NULL),
    (8,  2, 'Janela Basculante',             NULL),
    (9,  2, 'Janela Projetada',              NULL),
    (10, 2, 'Janela de Giro',                NULL),
    (11, 3, 'Pele de Vidro',                 NULL),
    (12, 3, 'Structural Glazing',            NULL),
    (13, 3, 'Sacada',                        NULL),
    (14, 3, 'Área Gourmet',                  NULL),
    (15, 4, 'Cobertura Fixa',                NULL),
    (16, 4, 'Cobertura Retrátil',            NULL),
    (17, 4, 'Pergolado',                     NULL),
    (18, 4, 'Claraboia',                     NULL),
    (19, 5, 'Guarda-Corpo com Vidro',        NULL),
    (20, 5, 'Guarda-Corpo com Barra',        NULL),
    (21, 5, 'Guarda-Corpo Misto',            NULL),
    (22, 6, 'Portão Deslizante',             NULL),
    (23, 6, 'Portão Basculante',             NULL),
    (24, 6, 'Portão de Giro',                NULL),
    (25, 6, 'Portão Social',                 NULL),
    (26, 7, 'Divisória de Vidro',            NULL),
    (27, 7, 'Box para Banheiro',             NULL),
    (28, 8, 'Persiana Integrada Automática', NULL),
    (29, 8, 'Brise Fixo',                    NULL),
    (30, 8, 'Brise Móvel',                   NULL);


INSERT INTO imagem (id_produto, url, ordem) VALUES
    (1,  'img/porta/porta.jpeg',                   1),
    (1,  'img/porta/porta2.jpeg',                  2),
    (1,  'img/porta/porta3.jpeg',                  3),
    (2,  'img/porta/porta4.jpeg',                  1),
    (2,  'img/porta/porta5.jpeg',                  2),
    (2,  'img/porta/porta6.jpeg',                  3),
    (2,  'img/porta/porta7.jpeg',                  4),
    (2,  'img/porta/porta8.jpeg',                  5),
    (2,  'img/porta/porta9.jpeg',                  6),
    (2,  'img/porta/porta10.jpeg',                 7),
    (4,  'img/porta/portacamaleao.jpeg',           1),
    (4,  'img/porta/portacamaleao2.jpeg',          2),
    (4,  'img/porta/portacamaleao3.jpeg',          3),
    (4,  'img/porta/portacamaleao4.jpeg',          4),
    (4,  'img/porta/portacamaleao5.jpeg',          5),
    (15, 'img/cobertura/cobertura.jpeg',           1),
    (15, 'img/cobertura/cobertura2.jpeg',          2),
    (15, 'img/cobertura/cobertura3.jpeg',          3),
    (15, 'img/cobertura/cobertura4.jpeg',           4),
    (15, 'img/cobertura/cobertura5.jpeg',           5),
    (15, 'img/cobertura/cobertura6.jpeg',           6),
    (15, 'img/cobertura/cobertura7.jpeg',           7),
    (15, 'img/cobertura/coberturaEspelhada.jpeg',   8),
    (15, 'img/cobertura/coberturaEspelhada2.jpeg',  9),
    (15, 'img/cobertura/coberturaEspelhada3.jpeg', 10),
    (15, 'img/cobertura/coberturaVideo.mp4',       11),
    (27, 'img/boxBanheiro/box1.jpeg',               1),
    (27, 'img/boxBanheiro/box2.jpeg',               2),
    (27, 'img/boxBanheiro/box3.jpeg',               3),
    (27, 'img/boxBanheiro/box4.jpeg',               4),
    (27, 'img/boxBanheiro/box5.jpeg',               5),
    (27, 'img/boxBanheiro/box6.jpeg',               6),
    (27, 'img/boxBanheiro/boxDourado.jpeg',          7),
    (27, 'img/boxBanheiro/boxDourado2.jpeg',         8);


INSERT INTO atributo (id, nome) VALUES
    (1, 'Cor do Vidro'),
    (2, 'Tipo do Vidro'),
    (3, 'Cor do Alumínio'),
    (4, 'Espessura'),
    (5, 'Linha do Alumínio'),
    (6, 'Disponível em Alumínio');


INSERT INTO produto_atributo (id_produto, id_atributo, valor) VALUES
    (1,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (1,  2, 'Temperado, Laminado, Insulado, Comum'),
    (1,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (1,  4, '6mm, 8mm ou 10mm'),
    (1,  6, 'Sim'),
    (2,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (2,  2, 'Temperado, Laminado, Insulado, Comum'),
    (2,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (2,  4, '8mm ou 10mm'),
    (2,  6, 'Sim'),
    (3,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (3,  2, 'Temperado, Laminado, Insulado, Comum'),
    (3,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (3,  4, '10mm ou 12mm'),
    (3,  6, 'Sim'),
    (4,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (4,  2, 'Temperado, Laminado, Insulado, Comum'),
    (4,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (4,  4, '6mm ou 8mm'),
    (4,  6, 'Não'),
    (5,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (5,  2, 'Temperado, Laminado, Insulado, Comum'),
    (5,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (5,  4, '6mm ou 8mm'),
    (5,  6, 'Sim'),
    (6,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (6,  2, 'Temperado, Laminado, Insulado, Comum'),
    (6,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (6,  4, '4mm, 6mm ou 8mm'),
    (6,  6, 'Não'),
    (7,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (7,  2, 'Temperado, Laminado, Insulado, Comum'),
    (7,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (7,  4, '4mm ou 6mm'),
    (7,  6, 'Não'),
    (8,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (8,  2, 'Temperado, Laminado, Insulado, Comum'),
    (8,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (8,  4, '4mm ou 6mm'),
    (8,  6, 'Não'),
    (9,  1, 'Incolor, Verde, Fumê, Espelhado'),
    (9,  2, 'Temperado, Laminado, Insulado, Comum'),
    (9,  3, 'Branco, Preto Fosco, Bronze, Natural'),
    (9,  4, '6mm ou 8mm'),
    (9,  6, 'Não'),
    (10, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (10, 2, 'Temperado, Laminado, Insulado, Comum'),
    (10, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (10, 4, '4mm, 6mm ou 8mm'),
    (10, 6, 'Sim'),
    (11, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (11, 2, 'Laminado ou Insulado'),
    (11, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (11, 4, '8mm+8mm ou 10mm+10mm'),
    (11, 6, 'Não'),
    (12, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (12, 2, 'Laminado ou Insulado'),
    (12, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (12, 4, '8mm+8mm ou 10mm+10mm'),
    (12, 6, 'Não'),
    (13, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (13, 2, 'Temperado ou Laminado'),
    (13, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (13, 4, '8mm ou 10mm'),
    (13, 6, 'Não'),
    (14, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (14, 2, 'Temperado ou Laminado'),
    (14, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (14, 4, '8mm ou 10mm'),
    (14, 6, 'Não'),
    (15, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (15, 2, 'Laminado'),
    (15, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (15, 4, '8mm ou 10mm'),
    (15, 6, 'Não'),
    (16, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (16, 2, 'Temperado ou Laminado'),
    (16, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (16, 4, '8mm ou 10mm'),
    (16, 6, 'Não'),
    (17, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (17, 2, 'Laminado'),
    (17, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (17, 4, '8mm ou 10mm'),
    (17, 6, 'Não'),
    (18, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (18, 2, 'Temperado, Laminado ou Insulado'),
    (18, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (18, 4, '8mm ou 10mm'),
    (18, 6, 'Não'),
    (19, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (19, 2, 'Temperado, Laminado, Insulado ou Comum'),
    (19, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (19, 4, '8mm ou 10mm'),
    (19, 6, 'Não'),
    (20, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (20, 2, 'Temperado, Laminado, Insulado ou Comum'),
    (20, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (20, 4, '8mm ou 10mm'),
    (20, 6, 'Não'),
    (21, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (21, 2, 'Temperado, Laminado, Insulado ou Comum'),
    (21, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (21, 4, '8mm ou 10mm'),
    (21, 6, 'Não'),
    (22, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (22, 2, 'Temperado ou Laminado'),
    (22, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (22, 4, '8mm a 12mm'),
    (22, 6, 'Sim'),
    (23, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (23, 2, 'Temperado ou Laminado'),
    (23, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (23, 4, '8mm a 12mm'),
    (23, 6, 'Sim'),
    (24, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (24, 2, 'Temperado ou Laminado'),
    (24, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (24, 4, '8mm a 12mm'),
    (24, 6, 'Sim'),
    (25, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (25, 2, 'Temperado ou Laminado'),
    (25, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (25, 4, '8mm a 12mm'),
    (25, 6, 'Sim'),
    (26, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (26, 2, 'Temperado ou Jateado'),
    (26, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (26, 4, '8mm a 10mm'),
    (26, 6, 'Não'),
    (27, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (27, 2, 'Temperado ou Jateado'),
    (27, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (27, 4, '8mm a 10mm'),
    (27, 6, 'Não'),
    (28, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (28, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (28, 6, 'Sim'),
    (29, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (29, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (29, 6, 'Sim'),
    (30, 1, 'Incolor, Verde, Fumê, Espelhado'),
    (30, 3, 'Branco, Preto Fosco, Bronze, Natural'),
    (30, 6, 'Sim');


SELECT
    p.id,
    p.nome,
    p.descricao,
    c.nome AS categoria
FROM produto p
INNER JOIN categoria c ON c.id = p.id_categoria
ORDER BY c.nome, p.nome;


SELECT p.id, p.nome, p.descricao
FROM produto p
INNER JOIN categoria c ON c.id = p.id_categoria
WHERE c.nome = 'Portas'
ORDER BY p.nome;


SELECT
    p.nome      AS produto,
    c.nome      AS categoria,
    a.nome      AS atributo,
    pa.valor,
    i.url       AS imagem,
    i.ordem
FROM produto p
INNER JOIN categoria c         ON c.id          = p.id_categoria
INNER JOIN produto_atributo pa ON pa.id_produto = p.id
INNER JOIN atributo a          ON a.id          = pa.id_atributo
INNER JOIN imagem i            ON i.id_produto  = p.id
WHERE p.id = 1
ORDER BY i.ordem;


SELECT p.id, p.nome, pa.valor
FROM produto p
INNER JOIN produto_atributo pa ON pa.id_produto = p.id
INNER JOIN atributo a          ON a.id          = pa.id_atributo
WHERE a.nome = 'Espessura'
ORDER BY p.nome;


SELECT
    c.nome      AS categoria,
    c.descricao,
    p.id        AS id_produto,
    p.nome      AS produto
FROM categoria c
INNER JOIN produto p ON p.id_categoria = c.id
ORDER BY c.nome, p.nome;