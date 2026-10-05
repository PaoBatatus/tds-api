CREATE TABLE pessoa (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO pessoa (nome, email) VALUES ('João Silva', 'joao.silva@email.com');
INSERT INTO pessoa (nome, email) VALUES ('Maria Santos', 'maria.santos@email.com');
INSERT INTO pessoa (nome, email) VALUES ('Carlos Oliveira', 'carlos.oliveira@email.com');