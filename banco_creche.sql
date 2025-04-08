-- Active: 1744119904384@@localhost@3306@creche
CREATE TABLE crianca (
    crianca_id INT PRIMARY KEY AUTO_INCREMENT,
    nome_da_crianca VARCHAR(100) NOT NULL,
    data_de_nascimento DATE NOT NULL,

    responsavel_1 VARCHAR(100) NOT NULL,
    telefone_responsavel_1 VARCHAR(20),
    profissao_responsavel_1 VARCHAR(100),
    local_trabalho_responsavel_1 VARCHAR(100),
    telefone_trabalho_responsavel_1 VARCHAR(20),

    responsavel_2 VARCHAR(100),
    telefone_responsavel_2 VARCHAR(20),
    profissao_responsavel_2 VARCHAR(100),
    local_trabalho_responsavel_2 VARCHAR(100),
    telefone_trabalho_responsavel_2 VARCHAR(20),

    endereco TEXT,

    mora_com_quem ENUM('PAIS', 'AVÓS', 'OUTROS'),
    tem_irmaos ENUM('SIM', 'NÃO'),

    problema_saude ENUM('SIM', 'NÃO'),
    problema_saude_qual TEXT,

    medicamento_continuo ENUM('SIM', 'NÃO'),
    medicamento_qual TEXT,

    tem_alergias ENUM('SIM', 'NÃO'),
    alergias_qual TEXT
);

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE,
    password_hash TEXT,
    role ENUM('CUIDADOR', 'RESPONSAVEL'),
    crianca_id INT,
    FOREIGN KEY (crianca_id) REFERENCES crianca(crianca_id)
);

CREATE TABLE registro_diario (
    registro_id INT PRIMARY KEY AUTO_INCREMENT,
    crianca_id INT NOT NULL,
    data DATE NOT NULL,

    cafe_da_manha ENUM('NADA', 'POUCO', 'TUDO'),
    almoco        ENUM('NADA', 'POUCO', 'TUDO'),
    colacao       ENUM('NADA', 'POUCO', 'TUDO'),
    jantar        ENUM('NADA', 'POUCO', 'TUDO'),

    evacuacao_liquida ENUM('1', '2', '3', '4'),
    evacuacao_pastosa ENUM('1', '2', '3', '4'),

    banho ENUM('SIM', 'NÃO'),
    sono ENUM('TRANQUILO', 'AGITADO', 'NÃO DORMIU'),

    observacoes TEXT,
    assinatura VARCHAR(100),

    FOREIGN KEY (crianca_id) REFERENCES crianca(crianca_id)
);