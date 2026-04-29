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
    SELECT p_id_venda, p_id_produto, p_qtd, preco_unitario FROM produtos WHERE id_produto = p_id_produto;

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

- **5.2 Relatórios Estratégicos**

## Técnicas Utilizadas
- **CREATE DATABASE / CREATE TABLE** → criação da estrutura do banco de dados
- **PRIMARY KEY** → identifica cada registro de forma única
- **AUTO_INCREMENT** → gera IDs automaticamente
- **FOREIGN KEY** → garante o relacionamento entre tabelas (integridade referencial)
- **INSERT INTO** → inserção de dados no banco
- **SELECT** → consulta de dados
- **JOIN (INNER JOIN)** → combina dados de várias tabelas nos relatórios
- **GROUP BY** → agrupa dados para análise (ex: faturamento por categoria)
- **ORDER BY** → organiza os resultados das consultas
- **FUNÇÕES DE AGREGAÇÃO (SUM, COUNT)** → cálculos de totais e quantidades
- **EXPRESSÕES MATEMÁTICAS** → cálculo de valor em estoque (`estoque * preço`)
- **TRIGGER** → executa ações automáticas ao atualizar o estoque
- **PROCEDURE (Stored Procedure)** → automatiza o processo de registro de vendas
- **DELIMITER** → permite criação de blocos de código para trigger e procedure

