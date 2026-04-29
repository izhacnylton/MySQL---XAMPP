## Ola imundo


## 4. Inserção de Dados (INSERT)

Dados utilizados para simular o funcionamento do sistema.
Total aproximado: **200 registros**

- **4.1 Categorias**

```sql
INSERT INTO categorias (nome_categoria) VALUES 
('Microcontroladores'),
('Sensores de Presença'),
('Resistores'),
('Capacitores'),
('Diodos'),
('Transistores'),
('Circuitos Integrados'),
('Displays LCD'),
'Módulos Bluetooth'),
('Módulos Wi-Fi'),
('Relés'),
('Protoboards'),
('Jumpers'),
('Fontes de Alimentação'),
('Motores DC'),
('Servomotores'),
('Sensores de Umidade'),
('Teclados Matriciais'),
('Buzzer'),
('LEDs RGB'),
('Potenciômetros'),
('Interruptores'),
('Fusíveis'),
('Transformadores'),
('Conectores');

```

- **4.2 Fornecedores**

```sql
INSERT INTO fornecedores (nome_fornecedor, cnpj) VALUES 
('Eletrônica Central', '12.345.678/0001-01'),
('Tech Componentes', '23.456.789/0001-02'),
('Global Chips', '34.567.890/0001-03'),
('Importadora Rápida', '45.678.901/0001-04'),
('Micro Tech', '56.789.012/0001-05'),
('Brasil Semicondutores', '67.890.123/0001-06'),
('Mega Resistor', '78.901.234/0001-07'),
('Ponto do Soldador', '89.012.345/0001-08'),
('Circuito Express', '90.123.456/0001-09'),
('Logística Peças', '01.234.567/0001-10'),
('Eletronorte', '11.222.333/0001-11'),
('Sul Componentes', '22.333.444/0001-22'),
('Leste Hardware', '33.444.555/0001-33'),
('Oeste Digital', '44.555.666/0001-44'),
('Inova Peças', '55.666.777/0001-55'),
('Alpha Distribuidora', '66.777.888/0001-66'),
('Beta Suprimentos', '77.888.999/0001-77'),
('Gama Eletro', '88.999.000/0001-88'),
('Delta Tech', '99.000.111/0001-99'),
('Omega Vendas', '10.111.222/0001-00'),
('Zeta Maker', '21.314.151/0001-21'),
('Sigma IOT', '32.425.262/0001-32'),
('Theta Robótica', '43.536.373/0001-43'),
('Kappa Placas', '54.647.484/0001-54'),
('Iota Fios', '65.758.595/0001-65');


```
  
- **4.3 Localizações**

```sql
INSERT INTO localizacoes (setor, posicao) VALUES 
('Setor A', 'Gaveta 01'),
('Setor A', 'Gaveta 02'),
('Setor A', 'Gaveta 03'),
('Setor B', 'Gaveta 01'),
('Setor B', 'Gaveta 02'),
('Setor B', 'Gaveta 03'),
('Setor C', 'Gaveta 01'),
'Setor C', 'Gaveta 02'),
('Setor D', 'Gaveta 01'),
('Setor E', 'Gaveta 05'),
('Setor F', 'Prateleira 1'),
('Setor F', 'Prateleira 2'),
('Setor G', 'Gaveta 10'),
('Setor H', 'Gaveta 11'),
('Setor I', 'Caixa 01'),
('Setor I', 'Caixa 02'),
('Setor J', 'Rack A'),
('Setor J', 'Rack B'),
('Setor K', 'Gaveta 20'),
('Setor L', 'Bancada 1'),
('Setor M', 'Armário 1'),
('Setor N', 'Gaveta 50'),
('Setor O', 'Gaveta 51'),
('Setor P', 'Gaveta 99'),
('Setor Q', 'Stand By');

```
  
- **4.4 Clientes**

```sql
INSERT INTO clientes (nome_cliente, email) VALUES 
('João Silva', 'joao@email.com'),
('Maria Oliveira', 'maria@email.com'),
('Carlos Santos', 'carlos@email.com'),
('Ana Costa', 'ana@email.com'),
('Bruno Souza', 'bruno@email.com'),
('Fernanda Lima', 'fernanda@email.com'),
('Ricardo Pereira', 'ricardo@email.com'),
('Julia Ramos', 'julia@email.com'),
('Gabriel Alves', 'gabriel@email.com'),
('Amanda Rocha', 'amanda@email.com'),
('Lucas Mendes', 'lucas@email.com'),
('Beatriz Nunes', 'beatriz@email.com'),
('Tiago Silva', 'tiago@email.com'),
('Vanessa Dias', 'vanessa@email.com'),
('Hugo Martins', 'hugo@email.com'),
('Igor Gomes', 'igor@email.com'),
('Larissa Ferreira', 'larissa@email.com'),
('Marcelo Vieira', 'marcelo@email.com'),
('Natália Cruz', 'natalia@email.com'),
('Otávio Borges', 'otavio@email.com'),
('Patrícia Lopes', 'patricia@email.com'),
('Renato Machado', 'renato@email.com'),
('Sonia Carvalho', 'sonia@email.com'),
('Tatiane Barros', 'tatiane@email.com'),
('Vitor Soares', 'vitor@email.com');
```

- **4.5 Produtos**

```sql
INSERT INTO produtos (nome_produto, preco_unitario, estoque_atual, estoque_min, id_categoria, id_local) VALUES 
('Arduino Uno R3', 85.50, 50, 10, 1, 1),
('Sensor Ultrassônico', 15.90, 100, 15, 2, 2),
('Resistor 1k 1/4W', 0.10, 500, 50, 3, 3),
('Capacitor 100uF', 0.50, 200, 20, 4, 4),
('Diodo 1N4007', 0.25, 300, 30, 5, 5),
('Transistor BC547', 0.45, 150, 25, 6, 6),
('ESP32 DevKit', 45.00, 40, 8, 10, 7),
('Display LCD 16x2', 28.00, 30, 5, 8, 8),
('Módulo HC-05', 35.00, 25, 5, 9, 9),
('Rele 5V 1 Canal', 12.00, 60, 10, 11, 10),
('Protoboard 830 Pts', 22.00, 45, 5, 12, 11),
('Jumper Macho-Macho', 10.00, 100, 10, 13, 12),
('Fonte 9V 1A', 25.00, 20, 5, 14, 13),
('Motor DC 3-6V', 8.00, 80, 10, 15, 14),
('Servo SG90', 18.00, 55, 10, 16, 15),
('DHT11 Umidade', 14.00, 70, 10, 17, 16),
('Teclado 4x4', 12.50, 20, 5, 18, 17),
('Buzzer Ativo 5V', 3.00, 120, 20, 19, 18),
('LED RGB 4 Term', 1.50, 200, 30, 20, 19),
('Potenciômetro 10k', 2.50, 90, 15, 21, 20),
('Chave Gangorra', 1.20, 110, 20, 22, 21),
('Fusível 1A', 0.80, 150, 30, 23, 22),
('Transformador 12V', 45.00, 15, 3, 24, 23),
('Conector BNC', 4.50, 65, 10, 25, 24),
('CI 555 Timer', 1.80, 85, 15, 7, 25);
```

- **4.6 Vendas**

```sql
6. Vendas 
INSERT INTO vendas (valor_total, id_cliente) VALUES 
(101.40, 1),
(15.90, 2),
(0.50, 3),
(85.50, 4),
(35.00, 5),
(24.00, 6),
(90.00, 7),
(28.00, 8),
(45.00, 9),
(12.00, 10),
(110.00, 11),
(20.00, 12),
(50.00, 13),
(16.00, 14),
(36.00, 15),
(14.00, 16),
(25.00, 17),
(6.00, 18),
(3.00, 19),
(5.00, 20),
(1.20, 21),
(1.60, 22),
(90.00, 23),
(9.00, 24),
(3.60, 25);

```

- **4.7 Itens de Venda**

```sql
INSERT INTO itens_venda (quantidade, preco_venda_momento, id_venda, id_produto) VALUES 
(1, 85.50, 1, 1),
(1, 15.90, 1, 2),
(1, 15.90, 2, 2),
(1, 0.50, 3, 4),
(1, 85.50, 4, 1),
(1, 35.00, 5, 9),
(2, 12.00, 6, 10),
(2, 45.00, 7, 7),
(1, 28.00, 8, 8),
(1, 45.00, 9, 7),
(1, 12.00, 10, 10),
(5, 22.00, 11, 11),
(2, 10.00, 12, 12),
(2, 25.00, 13, 13),
(2, 8.00, 14, 14),
(2, 18.00, 15, 15),
(1, 14.00, 16, 16),
(2, 12.50, 17, 17),
(2, 3.00, 18, 18),
(2, 1.50, 19, 19),
(2, 2.50, 20, 20),
(1, 1.20, 21, 21),
(2, 0.80, 22, 22),
(2, 45.00, 23, 23),
(2, 4.50, 24, 24),
(2, 1.80, 25, 25);

```

- **4.8 Compras de Estoque**
```sql
INSERT INTO compras_estoque (quantidade_entrada, id_fornecedor, id_produto) VALUES 
(10, 1, 1),
(20, 2, 2),
(100, 3, 3),
(50, 4, 4),
(100, 5, 5),
(50, 6, 6),
(20, 7, 7),
(10, 8, 8),
(10, 9, 9),
(30, 10, 10),
(15, 11, 11),
(40, 12, 12),
(10, 13, 13),
(30, 14, 14),
(25, 15, 15),
(20, 16, 16),
(10, 17, 17),
(50, 18, 18),
(100, 19, 19),
(40, 20, 20),
(50, 21, 21),
(100, 22, 22),
(5, 23, 23),
(20, 24, 24),
(30, 25, 25);

```


