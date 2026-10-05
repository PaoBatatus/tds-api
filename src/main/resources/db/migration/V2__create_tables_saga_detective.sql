-- 1. Tabela Usuario
CREATE TABLE usuario (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    pontuacao_geral INT DEFAULT 0,
    perfil VARCHAR(20) NOT NULL DEFAULT 'ROLE_JOGADOR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 2. Tabela Caso
CREATE TABLE caso (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    descricao_crime TEXT NOT NULL,
    dificuldade VARCHAR(20) NOT NULL,
    limite_horas INT NOT NULL,
    imagem_capa VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 3. Tabela Suspeito
CREATE TABLE suspeito (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ocupacao VARCHAR(100),
    biografia TEXT,
    relacao_vitima VARCHAR(150),
    caso_id BIGINT NOT NULL,
    FOREIGN KEY (caso_id) REFERENCES caso(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 4. Tabela Pista
CREATE TABLE pista (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT NOT NULL,
    nivel_revelacao VARCHAR(50),
    caso_id BIGINT NOT NULL,
    FOREIGN KEY (caso_id) REFERENCES caso(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 5. Tabela Depoimento
CREATE TABLE depoimento (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    suspeito_id BIGINT NOT NULL,
    topico VARCHAR(100) NOT NULL,
    texto_resposta TEXT NOT NULL,
    custo_horas INT DEFAULT 1,
    pista_desbloqueada_id BIGINT,
    FOREIGN KEY (suspeito_id) REFERENCES suspeito(id) ON DELETE CASCADE,
    FOREIGN KEY (pista_desbloqueada_id) REFERENCES pista(id) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 6. Tabela SessaoInvestigacao (Partida)
CREATE TABLE sessao_investigacao (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    usuario_id BIGINT NOT NULL,
    caso_id BIGINT NOT NULL,
    horas_restantes INT NOT NULL,
    status VARCHAR(30) NOT NULL DEFAULT 'EM_ANDAMENTO',
    data_inicio DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_fim DATETIME,
    acusacao_realizada TEXT,
    FOREIGN KEY (usuario_id) REFERENCES usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (caso_id) REFERENCES caso(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Carga inicial de dados de teste (Seeding)
INSERT INTO usuario (nome, email, senha, perfil) 
VALUES ('Pedro Luca', 'pedro@utfpr.edu.br', '123456', 'ROLE_ADMIN');

INSERT INTO caso (titulo, descricao_crime, dificuldade, limite_horas) 
VALUES ('O Enigma da Mansão Oak', 'O Barão Oak foi encontrado inconsciente em sua biblioteca com pistas enigmáticas.', 'MÉDIO', 24);

INSERT INTO suspeito (nome, ocupacao, biografia, relacao_vitima, caso_id) 
VALUES ('Mordomo Alfred', 'Gerente da Mansão', 'Trabalha há 20 anos na mansão.', 'Empregado', 1);

INSERT INTO pista (nome, descricao, nivel_revelacao, caso_id) 
VALUES ('Relógio Quebrado', 'Relógio de bolso parado exatamente às 22:15.', 'FÁCIL', 1);