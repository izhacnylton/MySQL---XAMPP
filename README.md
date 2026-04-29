# 📊 Projeto Banco de Dados - ProtoTech

Sistema de gerenciamento de estoque e vendas.

---

## 🧱 Estrutura

<details>
<summary>Ver banco</summary>

````sql
CREATE DATABASE IF NOT EXISTS ProtoTech_DB;
USE ProtoTech_DB;
</details>
🏗️ Tabelas
<details>
<summary>Ver tabelas</summary>
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
🏗️ Tabelas
<details>
<summary>Ver tabelas</summary>
CREATE TABLE categorias (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome_categoria VARCHAR(50) NOT NULL
);

CREATE TABLE produtos (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome_produto VARCHAR(100),
    preco_unitario DECIMAL(10,2)
);
</details>
⚙️ Procedure
<details>
<summary>Ver procedure</summary>
CREATE PROCEDURE exemplo()
BEGIN
    SELECT * FROM produtos;
END;
</details>
🔍 Consultas
<details>
<summary>Ver SELECT</summary>
SELECT * FROM produtos;
</details>
````
