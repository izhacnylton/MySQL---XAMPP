# ProtoTech_DB — Sistema de Controle de Estoque e Vendas

Banco de dados desenvolvido para gerenciar **produtos**, **vendas**, **estoque** e **fornecedores** de uma loja de componentes eletrônicos.

## 1. Criação do Banco de Dados

```sql
CREATE DATABASE IF NOT EXISTS ProtoTech_DB;
USE ProtoTech_DB;
```


## 2. Estrutura de Tabelas

- **2.1 Tabelas Independentes (sem `FOREIGN KEY`)**

    Essas tabelas são criadas primeiro porque não dependem de nenhuma outra.

```sql
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE fornecedores (
    id_fornecedor INT PRIMARY KEY AUTO_INCREMENT,
    nome_fornecedor VARCHAR(100) NOT NULL,
    cnpj VARCHAR(20) UNIQUE
);

CREATE TABLE localizacoes (
    id_local INT PRIMARY KEY AUTO_INCREMENT,
    setor VARCHAR(20) NOT NULL,
    posicao VARCHAR(20) NOT NULL
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome_cliente VARCHAR(100) NOT NULL,
    email VARCHAR(100)
);
```

**Função das tabelas:**

- `categorias` → classifica produtos  
- `fornecedores` → origem dos produtos  
- `localizacoes` → organização física  
- `clientes` → registro de compradores

&nbsp;
			       
- **2.2 Tabelas Dependentes (com `FOREIGN KEY`)**

    Essas tabelas dependem das anteriores, pois possuem relacionamentos com chaves estrangeiras.

```sql
CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100) NOT NULL,
    preco_unitario DECIMAL(10, 2) NOT NULL,
    estoque_atual INT DEFAULT 0,
    estoque_min INT DEFAULT 5,
    id_categoria INT,
    id_local INT,
    CONSTRAINT fk_cat FOREIGN KEY (id_categoria) REFERENCES categorias(id_categoria),
    CONSTRAINT fk_pro FOREIGN KEY (id_local) REFERENCES localizacoes(id_local)
);

CREATE TABLE vendas (
    id_venda INT PRIMARY KEY AUTO_INCREMENT,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    valor_total DECIMAL(10, 2) DEFAULT 0.00,
    id_cliente INT,
    CONSTRAINT fk_cli FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE itens_venda (
    id_item_venda INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT NOT NULL,
    preco_venda_momento DECIMAL(10, 2),
    id_venda INT,
    id_produto INT,
    CONSTRAINT fk_ven FOREIGN KEY (id_venda) REFERENCES vendas(id_venda),
    CONSTRAINT fk_item_pro FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE compras_estoque (
    id_compra INT PRIMARY KEY AUTO_INCREMENT,
    quantidade_entrada INT NOT NULL,
    data_entrada TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	id_fornecedor INT,
    id_produto INT,
    CONSTRAINT fk_for FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    CONSTRAINT fk_pro_compra FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
```

**Relações entre tabelas:**

- `produtos` → depende de **categorias** e **localizações**
- `vendas` → depende de **clientes**
- `itens_venda` → depende de **vendas** e **produtos**
- `compras_estoque` → depende de **fornecedores** e **produtos**


## 3. Lógica do Banco de Dados
- **3.1 `TRIGGER` — Controle de Estoque**

```sql
DELIMITER //
CREATE TRIGGER trg_alerta_estoque
AFTER UPDATE ON produtos
FOR EACH ROW
BEGIN
    IF NEW.estoque_atual <= NEW.estoque_min THEN
        -- Em um sistema real, aqui poderia disparar um log ou notificação
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ALERTA: Item atingiu estoque crítico!';
    END IF;
END //
DELIMITER
```
**Função:** Dispara um **alerta** quando o estoque do produto atinge o **mínimo**.

- **3.2 `PROCEDURE` — Finalização de Venda**

```sql
DELIMITER //
CREATE PROCEDURE sp_finalizar_venda(IN p_id_venda INT, IN p_id_produto INT, IN p_qtd INT)
BEGIN
    -- 1. Insere o item na venda
    INSERT INTO itens_venda (id_venda, id_produto, quantidade, preco_venda_momento)
    SELECT p_id_venda, p_id_produto, p_qtd, preco_unit FROM produtos WHERE id_produto = p_id_produto;

    -- 2. Atualiza o saldo físico do estoque
    UPDATE produtos 
    SET estoque_atual = estoque_atual - p_qtd 
    WHERE id_produto = p_id_produto;
END //
DELIMITER ;

```

**Função:**
- Registra o item na venda.
- Atualiza automaticamente o estoque.

## 4. Inserção de Dados (INSERT)

Dados utilizados para simular o funcionamento do sistema.
Total aproximado: **110 registros**

- **4.1 Categorias**

```sql
INSERT INTO categorias (nome_categoria) VALUES 
('Microcontroladores'),
('Sensores de Presença'),
('Sensores de Ambiente'),
('Displays e Visores'),
('Atuadores/Motores'),
('Comunicação Wireless'), 
('Protoboards e Jumpers'),
('Fontes e Energia'),
('Módulos de Relevo'),
('Ferramentas');
```

- **4.2 Fornecedores**

```sql
INSERT INTO fornecedores (nome_fornecedor, cnpj) VALUES 
('Global Tech', '10.001.001/0001-01'),
('Ponte Norte', '20.002.002/0002-02'),
('Silicon Import', '30.003.003/0003-03'),
('Brasil Maker', '40.004.004/0004-04'),
('Eletrônica Amazonas', '50.005.005/0005-05'),
('Importadora Tech', '60.006.006/0006-06'),
('Eletro Suprimentos', '70.007.007/0007-07'),
('Conexão Digital', '80.008.008/0008-08'),
('Mundo dos Chips', '90.009.009/0009-09'),
('Logística Pro', '11.111.111/0001-11');
```
  
- **4.3 Localizações**

```sql
INSERT INTO localizacoes (setor, posicao) VALUES 
('A', 'Gaveta 01'),
('A', 'Gaveta 02'),
('B', 'Prateleira 10'),
('B', 'Prateleira 11'),
('C', 'Armário 01'),
('C', 'Armário 02'),
('D', 'Bancada Sul'),
('D', 'Bancada Norte'),
('E', 'Estoque Frio'),
('F', 'Geral');
```
  
- **4.4 Clientes**

```sql
INSERT INTO clientes (nome_cliente, email) VALUES 
('Victor Silva', 'victor@email.com'),
('Ana Souza', 'ana@email.com'), 
('Carlos Lima', 'carlos@email.com'),
('Mariana Dias', 'mari@email.com'),
('Roberto Jr', 'roberto@email.com'),
('Fernanda Poe', 'fernanda@email.com'),
('Laboratório X', 'labx@edu.com'),
('Robótica Manaus', 'contato@robotica.com'),
('Escola Tech', 'direcao@tech.com'),
('João Pedro', 'jp@email.com'),
('Beatriz Ramos', 'bea@email.com'),
('Marcos Vaz', 'vaz@email.com'),
('Studio Maker', 'studio@maker.com'),
('Engenharia S/A', 'eng@empresa.com'),
('Alice Mendes', 'alice@email.com');
```

- **4.5 Produtos**

```sql
INSERT INTO produtos (nome_produto, preco_unitario, estoque_atual, estoque_min, id_categoria, id_local) VALUES 
('Arduino Uno', 85.00, 20, 5, 1, 1),
('Arduino Nano', 45.00, 30, 5, 1, 1),
('ESP32 Wroom', 60.00, 15, 5, 1, 2),
('NodeMCU ESP8266', 42.00, 10, 5, 1, 2),
('Sensor HC-SR04', 15.00, 50, 10, 2, 3),
('Sensor LDR', 2.50, 100, 20, 2, 3),
('DHT11 Temp', 18.00, 40, 10, 3, 4),
('BMP280 Pressao', 25.00, 15, 5, 3, 4),
('LCD 16x2 I2C', 35.00, 12, 5, 4, 5),
('OLED 0.96', 29.00, 20, 5, 4, 5),
('Servo SG90', 19.00, 60, 15, 5, 6),
('Motor DC 3-6V', 8.00, 80, 20, 5, 6),
('Módulo Lora', 120.00, 5, 2, 6, 7),
('HC-05 Bluetooth', 38.00, 10, 5, 6, 7),
('Protoboard 830', 25.00, 25, 5, 7, 8),
('Jumpers M-M', 12.00, 50, 10, 7, 8),
('Fonte 9V 1A', 22.00, 15, 5, 8, 9),
('Bateria 9V', 14.00, 30, 10, 8, 9),
('Módulo Relé 1ch', 12.00, 40, 10, 9, 10),
('Módulo Relé 4ch', 35.00, 10, 5, 9, 10),
('Multímetro Dig', 150.00, 4, 2, 10, 1),
('Ferro de Solda', 45.00, 8, 3, 10, 2),
('Estanho 0.8mm', 22.00, 20, 5, 10, 3),
('Alicate Corte', 32.00, 10, 5, 10, 4),
('Raspberry Pi 4', 650.00, 3, 1, 1, 5);
```

- **4.6 Vendas**

```sql
INSERT INTO vendas (id_cliente, valor_total) VALUES 
(1, 100.00),
(2, 45.00),
(3, 250.00),
(4, 12.00),
(5, 85.00),
(6, 300.00),
(7, 1200.00),
(8, 450.00),
(9, 32.00),
(10, 150.00),
(11, 28.00),
(12, 90.00),
(13, 22.00),
(14, 500.00),
(15, 15.00);
```

- **4.7 Itens de Venda**

```sql
INSERT INTO itens_venda (quantidade, preco_venda_momento, id_venda, id_produto) VALUES 
(1, 85.00, 1, 1),
(1, 45.00, 2, 2),
(2, 120.00, 3, 13),
(1, 12.00, 4, 16),
(1, 85.00, 5, 1),
(5, 60.00, 6, 3),
(2, 600.00, 7, 25),
(3, 150.00, 8, 21),
(1, 32.00, 9, 24),
(1, 150.00, 10, 21),
(2, 14.00, 11, 18),
(3, 30.00, 12, 9),
(1, 22.00, 13, 17),
(5, 100.00, 14, 1),
(1, 15.00, 15, 5);
```

- **4.8 Compras de Estoque**
```sql
INSERT INTO compras_estoque (quantidade_entrada, id_fornecedor, id_produto) VALUES 
(50, 1, 1),
(100, 2, 5),
(30, 3, 3),
(200, 4, 6),
(50, 5, 11),
(20, 6, 13),
(40, 7, 9),
(10, 8, 25),
(100, 9, 19),
(20, 10, 21);
```


## 5. Consultas SQL e Relatórios

- **5.1 Consultas Básicas (Visualização)**

```sql
select*from categorias;
select*from clientes;
select*from fornecedores;
select*from compras_estoque;
select*from itens_venda;
select*from localizacoes;
select*from produtos;
select*from vendas;
```

- **5.2 Relatórios Estratégicos**
