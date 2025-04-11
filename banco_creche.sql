--DROP TABLE public.registro_diario;
--DROP TABLE public.usuarios;
--DROP TABLE public.responsavel;
--DROP TABLE public.crianca;
--DROP TABLE public.cuidador;


CREATE TABLE public.crianca (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_de_nascimento DATE NOT NULL,

    endereco TEXT,

    mora_com_quem VARCHAR(10) CHECK (mora_com_quem IN ('PAIS', 'AVÓS', 'OUTROS')),
    tem_irmaos VARCHAR(3) CHECK (tem_irmaos IN ('SIM', 'NÃO')),

    problema_saude VARCHAR(3) CHECK (problema_saude IN ('SIM', 'NÃO')),
    problema_saude_qual TEXT,

    medicamento_continuo VARCHAR(3) CHECK (medicamento_continuo IN ('SIM', 'NÃO')),
    medicamento_qual TEXT,

    tem_alergias VARCHAR(3) CHECK (tem_alergias IN ('SIM', 'NÃO')),
    alergias_qual TEXT
);


CREATE TABLE public.responsavel (
	id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    profissao VARCHAR(100),
    local_trabalho VARCHAR(100),
    telefone_trabalho VARCHAR(20),
	crianca_id INTEGER,
    FOREIGN KEY (crianca_id) REFERENCES crianca(id)
);

CREATE TABLE public.cuidador (
	id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    profissao VARCHAR(100)
);


CREATE TABLE public.usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password_hash TEXT,
    role VARCHAR(15) CHECK (role IN ('CUIDADOR', 'RESPONSAVEL')),
    cuidador_id INTEGER,
    responsavel_id INTEGER,
    FOREIGN KEY (cuidador_id) REFERENCES cuidador(id),
    FOREIGN KEY (responsavel_id) REFERENCES responsavel(id)
);

CREATE TABLE public.registro_diario (
    id SERIAL PRIMARY KEY,
    crianca_id INTEGER NOT NULL,
    cuidador_id INTEGER NOT NULL,
    data DATE NOT NULL,

    cafe_da_manha VARCHAR(6) CHECK (cafe_da_manha IN ('NADA', 'POUCO', 'TUDO')),
    almoco        VARCHAR(6) CHECK (almoco IN ('NADA', 'POUCO', 'TUDO')),
    colacao       VARCHAR(6) CHECK (colacao IN ('NADA', 'POUCO', 'TUDO')),
    jantar        VARCHAR(6) CHECK (jantar IN ('NADA', 'POUCO', 'TUDO')),

    evacuacao_liquida VARCHAR(1) CHECK (evacuacao_liquida IN ('1', '2', '3', '4')),
    evacuacao_pastosa VARCHAR(1) CHECK (evacuacao_pastosa IN ('1', '2', '3', '4')),

    banho VARCHAR(3) CHECK (banho IN ('SIM', 'NÃO')),
    sono VARCHAR(12) CHECK (sono IN ('TRANQUILO', 'AGITADO', 'NÃO DORMIU')),

    observacoes TEXT,
    assinatura VARCHAR(100),

    FOREIGN KEY (crianca_id) REFERENCES crianca(id),
    FOREIGN KEY (cuidador_id) REFERENCES cuidador(id)
);
