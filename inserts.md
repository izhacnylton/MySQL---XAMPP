## Ola imundo


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


