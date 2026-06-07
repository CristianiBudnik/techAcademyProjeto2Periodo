SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `categoria` (
  `id`        INT           NOT NULL AUTO_INCREMENT,
  `nome`      VARCHAR(100)  NOT NULL,
  `descricao` TEXT,
  `imagem`    VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `produto` (
  `id`           INT           NOT NULL AUTO_INCREMENT,
  `id_categoria` INT           NOT NULL,
  `nome`         VARCHAR(100)  NOT NULL,
  `descricao`    TEXT,
  `ativo`        TINYINT(1)    NOT NULL DEFAULT 1,
  `criado_em`    DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_produto_categoria`
    FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `produto_imagem` (
  `id`          INT           NOT NULL AUTO_INCREMENT,
  `id_produto`  INT           NOT NULL,
  `url`         VARCHAR(255)  NOT NULL,
  `ordem`       INT           NOT NULL DEFAULT 0,
  `descricao`   TEXT,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_imagem_produto`
    FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `atributo` (
  `id`    INT           NOT NULL AUTO_INCREMENT,
  `nome`  VARCHAR(100)  NOT NULL,
  `tipo`  ENUM('text','number','select') NOT NULL DEFAULT 'text',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `produto_atributo` (
  `id`           INT           NOT NULL AUTO_INCREMENT,
  `id_produto`   INT           NOT NULL,
  `id_atributo`  INT           NOT NULL,
  `valor`        VARCHAR(255)  NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_patributo_produto`
    FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_patributo_atributo`
    FOREIGN KEY (`id_atributo`) REFERENCES `atributo` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `variacao` (
  `id`    INT           NOT NULL AUTO_INCREMENT,
  `nome`  VARCHAR(100)  NOT NULL,
  `tipo`  VARCHAR(100),          -- ex: "Tamanho", "Acabamento"
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `produto_variacao` (
  `id`           INT            NOT NULL AUTO_INCREMENT,
  `id_produto`   INT            NOT NULL,
  `id_variacao`  INT            NOT NULL,
  `preco`        DECIMAL(10,2),          -- NULL = preço sob consulta
  `disponivel`   TINYINT(1)     NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_pvariacao_produto`
    FOREIGN KEY (`id_produto`) REFERENCES `produto` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pvariacao_variacao`
    FOREIGN KEY (`id_variacao`) REFERENCES `variacao` (`id`)
    ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `categoria` (`nome`, `descricao`, `imagem`) VALUES
('Janela',             'Janelas de alumínio e vidro',         NULL),
('Box para Banheiro',  'Box em vidro temperado',              NULL),
('Espelhos',           'Espelhos com diferentes acabamentos', NULL),
('Cobertura de Vidro', 'Coberturas laminadas e temperadas',   NULL);


INSERT INTO `atributo` (`nome`, `tipo`) VALUES
('Cor do Vidro',      'select'),
('Cor do Alumínio',   'select'),
('Espessura',         'select'),
('Linha do Alumínio', 'text');


INSERT INTO `variacao` (`nome`, `tipo`) VALUES
('1,20 x 1,00 m', 'Tamanho'),
('1,50 x 1,20 m', 'Tamanho'),
('2,00 x 1,50 m', 'Tamanho'),
('Sob medida',     'Tamanho');


INSERT INTO `produto` (`id_categoria`, `nome`, `descricao`) VALUES
(1, 'Janela de Correr',    'Janela em alumínio linha suprema com vedação acústica'),
(2, 'Box Frontal',         'Box em vidro temperado 8mm com ferragens inox'),
(3, 'Espelho Bisotê',      'Espelho cristal com lapidação fina e fixação invisível'),
(4, 'Cobertura Laminada',  'Cobertura em vidro laminado para áreas externas');


INSERT INTO `produto_atributo` (`id_produto`, `id_atributo`, `valor`) VALUES
(1, 1, 'Incolor'),
(1, 2, 'Natural'),
(1, 3, '6mm'),
(1, 4, 'Suprema'),
(2, 1, 'Incolor'),
(2, 3, '8mm'),
(3, 1, 'Cristal'),
(4, 1, 'Laminado'),
(4, 3, '10mm');


INSERT INTO `produto_variacao` (`id_produto`, `id_variacao`, `preco`, `disponivel`) VALUES
(1, 1, NULL, 1),
(1, 2, NULL, 1),
(1, 4, NULL, 1),
(2, 4, NULL, 1),
(3, 4, NULL, 1),
(4, 4, NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
