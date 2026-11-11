-- Questão 01
SELECT COUNT(*)
FROM fato_vendas
WHERE id_cliente IS NULL;
-- resultado: 906

-- Questão 02
SELECT COUNT(DISTINCT id_cliente)
FROM fato_vendas;
-- resultado: 746

-- Questão 03
SELECT SUM(valor_total)
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31';
-- resultado: 388250.31

-- Questão 04
SELECT DISTINCT marca
FROM dim_produto
WHERE categoria = 'Higiene'
ORDER BY marca;
-- resultado:
-- Colgate
-- Dove
-- Elseve
-- Huggies
-- Lux
-- Mili
-- Neve
-- Nivea
-- Oral-B
-- Pampers
-- Pantene
-- Personal
-- Protex
-- Rexona
-- Seda
-- Sorriso

-- Questão 05
SELECT AVG(valor_total)
FROM fato_vendas
WHERE canal = 'Aplicativo';
-- resultado: 52.2665833630846126

-- Questão 06
SELECT COUNT(*)
FROM dim_produto
WHERE categoria = 'Bebidas'
  AND preco_tabela > 10;
-- resultado: 20

-- Questão 07
SELECT nome_produto, marca, preco_tabela
FROM dim_produto
ORDER BY preco_tabela DESC, nome_produto ASC
LIMIT 1;
-- resultado: Ração para Cães 10kg | Premier | 140.29

-- Questão 08
SELECT categoria, COUNT(*) AS qtd_produtos
FROM dim_produto
GROUP BY categoria
ORDER BY qtd_produtos DESC, categoria ASC;
-- resultado:
-- Mercearia | 49
-- Bebidas | 39
-- Higiene | 34
-- Laticínios | 32
-- Limpeza | 27
-- Congelados | 20
-- Carnes | 13
-- Padaria | 10
-- Hortifruti | 8
-- Pet | 8

-- Questão 09
SELECT categoria, AVG(preco_tabela) AS preco_medio
FROM dim_produto
GROUP BY categoria
ORDER BY preco_medio DESC;
-- resultado:
-- Pet | 76.1500000000000000
-- Carnes | 37.8230769230769231
-- Congelados | 33.1800000000000000
-- Higiene | 25.8452941176470588
-- Bebidas | 19.2646153846153846
-- Limpeza | 17.5674074074074074
-- Laticínios | 14.5062500000000000
-- Mercearia | 14.4977551020408163
-- Padaria | 8.2220000000000000
-- Hortifruti | 6.2400000000000000

-- Questão 10
SELECT cidade, COUNT(*) AS qtd_clientes
FROM dim_cliente
GROUP BY cidade
HAVING COUNT(*) >= 60
ORDER BY qtd_clientes DESC, cidade ASC;
-- resultado:
-- Brasília | 245
-- Taguatinga | 92
-- Ceilândia | 81
-- Goiânia | 68
-- Águas Claras | 64
-- Samambaia | 63

-- Questão 11
SELECT COUNT(*)
FROM dim_cliente
WHERE email IS NULL;
-- resultado: 75

-- Questão 12
SELECT COUNT(*)
FROM dim_cliente
WHERE sexo = 'F'
  AND data_nascimento BETWEEN '1990-01-01' AND '1999-12-31';
-- resultado: 74

-- Questão 13
SELECT COUNT(*)
FROM dim_cliente
WHERE nome LIKE 'Ana %';
-- resultado: 11

-- Questão 14
SELECT uf, COUNT(*) AS qtd_lojas
FROM dim_loja
GROUP BY uf
HAVING COUNT(*) > 3
ORDER BY qtd_lojas DESC;
-- resultado:
-- DF | 56
-- GO | 41
-- MG | 4

-- Questão 15
SELECT nome_loja, cidade, data_inauguracao
FROM dim_loja
WHERE data_inauguracao < '2007-01-01'
ORDER BY data_inauguracao ASC;
-- resultado:
-- Bom Dia Cruzeiro | Brasília | 2005-01-20
-- Bom Dia Jardim Tiradentes | Aparecida de Goiânia | 2005-03-14
-- Bom Dia Sobradinho I | Sobradinho | 2005-04-15
-- Bom Dia Aparecida Centro | Aparecida de Goiânia | 2005-06-04
-- Bom Dia Colônia Agrícola Samambaia | Vicente Pires | 2005-08-07
-- Bom Dia Octogonal | Brasília | 2005-08-21
-- Bom Dia Sobradinho II | Sobradinho | 2005-10-15
-- Bom Dia Samambaia Norte | Samambaia | 2006-04-07
-- Bom Dia Centro Uberlândia | Uberlândia | 2006-04-12
-- Bom Dia Pistão Sul | Taguatinga | 2006-08-12
-- Bom Dia Jardim Goiás | Goiânia | 2006-12-06
-- Bom Dia Luziânia Centro | Luziânia | 2006-12-07
-- Bom Dia Taguatinga Centro | Taguatinga | 2006-12-16
-- Bom Dia P Norte | Ceilândia | 2006-12-20

-- Questão 16
SELECT canal, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2025-01-01' AND '2025-12-31'
GROUP BY canal
ORDER BY faturamento DESC;
-- resultado:
-- Loja física | 276534.24
-- Aplicativo | 76340.05
-- Site | 35376.02

-- Questão 17
SELECT forma_pagamento, COUNT(*) AS qtd_linhas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE canal = 'Loja física'
GROUP BY forma_pagamento
ORDER BY faturamento DESC;
-- resultado:
-- Cartão de crédito | 3237 | 166687.46
-- Cartão de débito | 3222 | 163300.11
-- Pix | 2684 | 141486.51
-- Dinheiro | 1627 | 80073.40

-- Questão 18
SELECT id_produto, SUM(quantidade) AS unidades_vendidas
FROM fato_vendas
GROUP BY id_produto
ORDER BY unidades_vendidas DESC, id_produto ASC
LIMIT 10;
-- resultado:
-- 28 | 1333
-- 89 | 827
-- 224 | 804
-- 136 | 587
-- 163 | 555
-- 113 | 532
-- 132 | 504
-- 223 | 470
-- 6 | 436
-- 127 | 374

-- Questão 19
SELECT id_loja, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda BETWEEN '2024-01-01' AND '2024-12-31'
GROUP BY id_loja
ORDER BY faturamento DESC
LIMIT 5;
-- resultado:
-- 3 | 23884.53
-- 17 | 13507.46
-- 6 | 12672.20
-- 56 | 11476.51
-- 4 | 10963.94

-- Questão 20
SELECT id_loja, COUNT(*) AS qtd_linhas
FROM fato_vendas
GROUP BY id_loja
HAVING COUNT(*) > 300
ORDER BY qtd_linhas DESC;
-- resultado:
-- 3 | 886
-- 49 | 476
-- 11 | 459
-- 6 | 444
-- 9 | 440
-- 4 | 434
-- 56 | 429
-- 2 | 420
-- 17 | 410
-- 23 | 316

-- Questão 21
SELECT id_cliente, COUNT(*) AS qtd_linhas
FROM fato_vendas
WHERE id_cliente IS NOT NULL
GROUP BY id_cliente
HAVING COUNT(*) >= 70
ORDER BY qtd_linhas DESC, id_cliente ASC;
-- resultado:
-- 416 | 169
-- 684 | 135
-- 9 | 126
-- 186 | 122
-- 563 | 113
-- 323 | 97
-- 395 | 95
-- 290 | 81
-- 501 | 78
-- 90 | 75
-- 129 | 75
-- 198 | 71
-- 242 | 70

-- Questão 22
SELECT COUNT(*) AS qtd_com_desconto, ROUND(AVG(desconto), 2) AS desconto_medio
FROM fato_vendas
WHERE desconto > 0;
-- resultado: 2653 | 5.25

-- Questão 23
SELECT MIN(valor_total) AS menor_valor, MAX(valor_total) AS maior_valor
FROM fato_vendas
WHERE data_venda BETWEEN '2025-12-01' AND '2025-12-31';
-- resultado: 2.67 | 654.20

-- Questão 24
SELECT COUNT(*) AS qtd_linhas, SUM(valor_total) AS faturamento
FROM fato_vendas
WHERE data_venda = '2025-12-24';
-- resultado: 24 | 1281.83

-- Questão 25
SELECT id_venda,
       quantidade * preco_unitario AS valor_bruto,
       desconto,
       valor_total,
       ROUND(desconto / (quantidade * preco_unitario) * 100, 2) AS percentual_desconto
FROM fato_vendas
WHERE canal = 'Site'
  AND data_venda BETWEEN '2025-01-01' AND '2025-12-31'
  AND desconto > 0
ORDER BY percentual_desconto DESC, id_venda ASC
LIMIT 10;
-- resultado:
-- 8328 | 3.45 | 0.52 | 2.93 | 15.07
-- 8282 | 6.71 | 1.01 | 5.70 | 15.05
-- 13421 | 7.32 | 1.10 | 6.22 | 15.03
-- 8261 | 18.04 | 2.71 | 15.33 | 15.02
-- 9109 | 25.97 | 3.90 | 22.07 | 15.02
-- 13288 | 19.84 | 2.98 | 16.86 | 15.02
-- 8422 | 58.58 | 8.79 | 49.79 | 15.01
-- 10473 | 35.72 | 5.36 | 30.36 | 15.01
-- 10654 | 11.06 | 1.66 | 9.40 | 15.01
-- 10706 | 23.39 | 3.51 | 19.88 | 15.01