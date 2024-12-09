-- Informações (Cliente)
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(100),
    data_nascimento DATE,
    telefone VARCHAR(15),
    email VARCHAR(100)
);

INSERT INTO clientes (id_cliente, nome, data_nascimento, telefone, email)
VALUES
(1, 'João Silva', '1985-06-15', '11987654321', 'joao.silva@email.com'),
(2, 'Maria Oliveira', '1992-03-22', '11987654322', 'maria.oliveira@email.com'),
(3, 'Pedro Santos', '1988-11-10', '11987654323', 'pedro.santos@email.com'),
(4, 'Ana Souza', '1990-01-05', '11987654324', 'ana.souza@email.com'),
(5, 'Lucas Lima', '1995-07-30', '11987654325', 'lucas.lima@email.com'),
(11, 'Eduardo Silva', '1990-10-25', '11987654331', 'eduardo.silva@email.com'),
(12, 'Sofia Carvalho', '1987-12-12', '11987654332', 'sofia.carvalho@email.com'),
(13, 'Gabriel Almeida', '1994-03-08', '11987654333', 'gabriel.almeida@email.com'),
(14, 'Bianca Santos', '1996-09-30', '11987654334', 'bianca.santos@email.com'),
(15, 'Vinícius Costa', '1992-05-20', '11987654335', 'vinicius.costa@email.com');

-- Informações Produtos.
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY,
    nome_produto VARCHAR(100),
    preco DECIMAL(10, 2),
    quantidade_estoque INT
);

INSERT INTO produtos (id_produto, nome_produto, preco, quantidade_estoque)
VALUES
(1, 'Camisa Polo', 59.90, 50),
(2, 'Calça Jeans', 129.90, 30),
(3, 'Jaqueta de Couro', 199.90, 15),
(4, 'Tênis Esportivo', 249.90, 20),
(5, 'Relógio Digital', 349.90, 10),
(11, 'Casaco de Lã', 149.90, 20),
(12, 'Tênis de Corrida', 299.90, 25),
(13, 'Boné de Algodão', 39.90, 50),
(14, 'Meias Esportivas', 19.90, 100),
(15, 'Bolsa de Praia', 99.90, 30);

-- Informações Funcionários.
CREATE TABLE funcionarios (
    id_funcionario INT PRIMARY KEY,
    nome_funcionario VARCHAR(100),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2)
);

INSERT INTO funcionarios (id_funcionario, nome_funcionario, cargo, salario)
VALUES
(1, 'Carla Pereira', 'Gerente', 5000.00),
(2, 'Rafael Souza', 'Vendedor', 2500.00),
(3, 'Fernanda Lima', 'Atendente', 2000.00),
(4, 'Paulo Silva', 'Supervisor', 3500.00),
(5, 'Mariana Ribeiro', 'Caixa', 1800.00),
(6, 'Gustavo Andrade', 'Estoquista', 2200.00),
(7, 'Renata Martins', 'Designer', 3500.00),
(8, 'Lucas Tavares', 'Marketing', 4000.00);

-- Informações Vendas
CREATE TABLE vendas (
    id_venda INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    quantidade INT,
    data_venda DATE,
    id_funcionario INT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto),
    FOREIGN KEY (id_funcionario) REFERENCES funcionarios(id_funcionario)
);

INSERT INTO vendas (id_venda, id_cliente, id_produto, quantidade, data_venda, id_funcionario)
VALUES
(1, 1, 1, 2, '2024-12-01', 1),
(2, 2, 2, 1, '2024-12-02', 2),
(3, 3, 3, 1, '2024-12-03', 3),
(4, 4, 4, 3, '2024-12-04', 4),
(5, 5, 5, 2, '2024-12-05', 1),
(20, 11, 11, 2, '2024-12-14', 2),
(21, 12, 12, 1, '2024-12-15', 5),
(22, 13, 13, 3, '2024-12-16', 6),
(23, 14, 14, 4, '2024-12-17', 7),
(24, 15, 15, 2, '2024-12-18', 8);

-- Informações Pedidos.
CREATE TABLE pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE,
    status_pedido VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

INSERT INTO pedidos (id_pedido, id_cliente, data_pedido, status_pedido)
VALUES
(1, 1, '2024-12-01', 'Concluído'),
(2, 2, '2024-12-02', 'Cancelado'),
(3, 3, '2024-12-03', 'Em andamento'),
(4, 4, '2024-12-04', 'Concluído'),
(5, 5, '2024-12-05', 'Concluído'),
(14, 11, '2024-12-14', 'Concluído'),
(15, 12, '2024-12-15', 'Em andamento'),
(16, 13, '2024-12-16', 'Concluído'),
(17, 14, '2024-12-17', 'Cancelado'),
(18, 15, '2024-12-18', 'Concluído');

-- Informações Eventos.
CREATE TABLE eventos (
    id_evento INT PRIMARY KEY,
    descricao_evento VARCHAR(200),
    data_evento DATE,
    local_evento VARCHAR(100)
);

INSERT INTO eventos (id_evento, descricao_evento, data_evento, local_evento)
VALUES
(1, 'Promoção de Fim de Ano', '2024-12-01', 'Loja Centro'),
(2, 'Aniversário da Loja', '2024-12-10', 'Loja Sul'),
(10, 'Inauguração de Loja', '2025-02-01', 'Shopping Central'),
(11, 'Semana de Tecnologia', '2025-03-10', 'Auditório Principal'),
(12, 'Feira de Sustentabilidade', '2025-04-15', 'Centro de Convenções'),
(13, 'Palestra Motivacional', '2025-05-20', 'Loja Central'),
(14, 'Desfile de Moda', '2025-06-25', 'Shopping X');

-- Informações Avaliações.
CREATE TABLE avaliacoes (
    id_avaliacao INT PRIMARY KEY,
    id_cliente INT,
    id_produto INT,
    nota INT,
    comentario TEXT,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

INSERT INTO avaliacoes (id_avaliacao, id_cliente, id_produto, nota, comentario)
VALUES
(1, 1, 1, 5, 'Produto excelente, recomendo!'),
(2, 2, 2, 4, 'Boa qualidade, mas entrega demorou.'),
(3, 3, 3, 3, 'Satisfeito, mas poderia ser mais barato.'),
(4, 4, 4, 5, 'Muito confortável, ótima compra.'),
(11, 11, 11, 4, 'Casaco confortável e estiloso.'),
(12, 12, 12, 5, 'Tênis excelente para corridas longas.'),
(13, 13, 13, 3, 'Boné prático, mas poderia ter mais opções de cores.'),
(14, 14, 14, 5, 'Meias de ótima qualidade, super recomendo.'),
(15, 15, 15, 4, 'Bolsa prática para usar na praia.');

-- Alteraração de tabelas.
ALTER TABLE produtos ADD descricao VARCHAR(255) NULL;
ALTER TABLE funcionarios ADD departamento VARCHAR(100);

-- Atualização de registros. 
UPDATE funcionarios
SET departamento = CASE
    WHEN id_funcionario IN (1, 4) THEN 'Gerência'
    WHEN id_funcionario IN (2, 3, 5) THEN 'Vendas'
    WHEN id_funcionario IN (6) THEN 'Estoque'
    WHEN id_funcionario IN (7, 8) THEN 'Marketing'
    ELSE 'Outros'
END;

-- Seleção de tabelas.
SELECT * FROM avaliacoes;
SELECT * FROM clientes;
SELECT * FROM eventos;
SELECT * FROM funcionarios;
SELECT * FROM pedidos;
SELECT * FROM produtos;
SELECT * FROM vendas;

-- Consultas. 
/*
Selecione os primeiros 5 registros da tabela clientes, ordenando-os pelo nome em ordem crescente.
*/
SELECT * FROM clientes ORDER BY nome ASC LIMIT 5;

/*
Encontre todos os produtos na tabela produtos que não têm uma descrição associada 
(suponha que a coluna de descrição possa ser nula).
*/
SELECT * FROM produtos WHERE descricao IS NULL;

/*
Liste os funcionários cujo nome começa com 'C' e termina com 'a' na tabela funcionarios.
*/
SELECT * FROM funcionarios WHERE nome_funcionario LIKE 'C%' AND nome_funcionario LIKE '%a';

/*
Exiba o departamento e a média salarial dos funcionários em cada departamento na tabela funcionarios, agrupando por departamento, 
apenas para os departamentos cuja média salarial é superior a $2500.
*/
SELECT departamento, AVG(salario) AS media_salarial
FROM funcionarios
GROUP BY departamento
HAVING AVG(salario) > 2500;

/*
Selecione todos os clientes da tabela clientes e concatene o nome e o telefone, 
além de calcular o comprimento total do nome.
*/
SELECT 
    CONCAT(nome, ' - ', telefone) AS nome_com_telefone,
    LENGTH(nome) AS comprimento_nome
FROM 
    clientes;
/*
Para cada venda na tabela vendas, exiba o ID da venda, 
a data da venda e a diferença em dias entre a data da venda e a data atual.
*/
SELECT id_venda, data_venda, julianday('now') - julianday(data_venda) AS diferenca_dias
FROM vendas;

/*
Selecione todos os itens da tabela pedidos e arredonde o preço para o número inteiro mais próximo.
*/
SELECT id_produto, nome_produto, ROUND(preco) AS preco_arredondado
FROM produtos;

/*
Converta a coluna data_evento da tabela eventos, que está em formato de texto (YYYY-MM-DD), 
para o tipo de data.
*/
SELECT id_evento, descricao_evento, data_evento, CAST(data_evento AS DATE) AS data_convertida
FROM eventos;

/*
Na tabela avaliacoes, classifique cada avaliação como 'Boa', 'Média', ou 'Ruim' com base 
na pontuação: 1-3 para 'Ruim', 4-7 para 'Média', e 8-10 para 'Boa'.
*/
SELECT id_avaliacao, id_produto,
  CASE 
    WHEN nota BETWEEN 1 AND 3 THEN 'Ruim'
    WHEN nota BETWEEN 4 AND 7 THEN 'Média'
    WHEN nota BETWEEN 8 AND 10 THEN 'Boa'
  END AS classificacao
FROM avaliacoes;

/*
Altere o nome da coluna data_nascimento para data_nasc na tabela clientes e 
selecione todos os cliente que nasceram após '1990-01-01'.
*/
-- Renomeando a coluna
ALTER TABLE clientes RENAME COLUMN data_nascimento TO data_nasc;

-- Selecionando clientes
SELECT * FROM clientes WHERE data_nasc > '1990-01-01';











