CREATE TABLE IF NOT EXISTS d_vendedor (
    id_vendedor SERIAL PRIMARY KEY,  -- Autoincremental.
    nome_vendedor VARCHAR(100) NOT NULL,
    cpf_vendedor VARCHAR(11) NOT NULL UNIQUE,
    contato_vendedor VARCHAR(20),
    email_vendedor VARCHAR(100),
    data_nascimento DATE,
    data_contratacao DATE NOT NULL,
    data_entrada_carteira DATE,     -- data define a entrada que aquele entrou na carteira de x supervisor.
    data_saida_carteira DATE,       -- data define a saida que aquele entrou na carteira de x supervisor.
    departamento VARCHAR(50),
    salario NUMERIC(10,2),
    id_supervisor INTEGER,          -- forekey
    CONSTRAINT cpf_format CHECK (cpf_vendedor ~ '^\d{11}$')  --A CONSTRAINT aplica uma regra Verificando se o formato do CPF tem 11 dígitos e se estão entre (0a9)
);

CREATE INDEX idx_nome_vendedor ON d_vendedor (nome_vendedor); -- a criação dos indexs serve para indentificar as colunas que serão mais buscadas.
CREATE INDEX idx_contato_vendedor ON d_vendedor (contato_vendedor);
CREATE INDEX idx_email_vendedor ON d_vendedor (email_vendedor);
CREATE INDEX idx_data_contratacao ON d_vendedor (data_contratacao);
CREATE INDEX idx_id_supervisor ON d_vendedor (id_supervisor);