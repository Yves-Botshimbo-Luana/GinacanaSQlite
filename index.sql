-- Criação de uma tabela de clientes
CREATE TABLE clientes (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    email TEXT NOT NULL,
    telefone TEXT
);

-- Criação de uma tabela de produtos
CREATE TABLE produtos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco REAL NOT NULL
);

-- Criação de uma tabela de pedidos
CREATE TABLE pedidos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cliente_id INTEGER,
    data_pedido TEXT,
    total REAL,
    FOREIGN KEY (cliente_id) REFERENCES clientes (id)
);

-- Criação de uma tabela de itens de pedidos
CREATE TABLE itens_pedido (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pedido_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER,
    preco_unitario REAL,
    FOREIGN KEY (pedido_id) REFERENCES pedidos (id),
    FOREIGN KEY (produto_id) REFERENCES produtos (id)
);
-- Inserir clientes
INSERT INTO clientes (nome, email, telefone) VALUES 
('yves botshimbo', 'ybingos@yahoo.fr', '1234-5678'),
('yves luana', 'ybidotsh@gmail.com', '8765-4321');

-- Inserir produtos
INSERT INTO produtos (nome, preco) VALUES
('Produto A', 10.99),
('Produto B', 25.50);

-- Inserir um pedido
INSERT INTO pedidos (cliente_id, data_pedido, total) VALUES (1, '2024-08-01', 36.49);

-- Inserir itens do pedido
INSERT INTO itens_pedido (pedido_id, produto_id, quantidade, preco_unitario) VALUES
(1, 1, 1, 10.99),
(1, 2, 1, 25.50);
-- Ver todos os clientes
SELECT * FROM clientes;

-- Ver todos os pedidos de um cliente
SELECT * FROM pedidos WHERE cliente_id = 1;

-- Ver todos os itens de um pedido
SELECT * FROM itens_pedido WHERE pedido_id = 1;

-- Obter o nome do cliente e os produtos comprados
SELECT c.nome, p.nome, ip.quantidade
FROM pedidos pe
JOIN clientes c ON pe.cliente_id = c.id
JOIN itens_pedido ip ON pe.id = ip.pedido_id
JOIN produtos p ON ip.produto_id = p.id;