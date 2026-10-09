-- ============================================================
-- PROJETO: Exercícios de SQL Intermediário
-- AUTOR: Vinicius Marques Souza
-- CONCEITOS: INNER JOIN, LEFT JOIN, GROUP BY, HAVING, IS NULL
-- ============================================================

-- ------------------------------------------------------------
-- 1. Faturamento por Desenvolvedora de Jogos
-- Conceitos: INNER JOIN, SUM, GROUP BY
-- ------------------------------------------------------------
SELECT 
    desenvolvedoras.nome, 
    SUM(jogos.vendas_milhoes) AS total_vendas
FROM desenvolvedoras
INNER JOIN jogos ON desenvolvedoras.id = jogos.desenvolvedora_id
GROUP BY desenvolvedoras.nome;


-- ------------------------------------------------------------
-- 2. Faturamento Total por Restaurante
-- Conceitos: INNER JOIN, SUM, GROUP BY
-- ------------------------------------------------------------
SELECT 
    restaurantes.nome, 
    SUM(pedidos.valor_pedido) AS valor_total
FROM restaurantes
INNER JOIN pedidos ON restaurantes.id = pedidos.restaurante_id
GROUP BY restaurantes.nome;


-- ------------------------------------------------------------
-- 3. Artistas com Mais de 6.000 Reproduções Acumuladas
-- Conceitos: INNER JOIN, SUM, GROUP BY, HAVING
-- ------------------------------------------------------------
SELECT 
    artistas.nome, 
    SUM(reproducoes.quantidade_plays) AS total_plays
FROM artistas
INNER JOIN reproducoes ON artistas.id = reproducoes.artista_id
GROUP BY artistas.nome
HAVING SUM(reproducoes.quantidade_plays) > 6000;


-- ------------------------------------------------------------
-- 4. Alunos com Mais de 100 Minutos Acumulados em Aulas
-- Conceitos: INNER JOIN, SUM, GROUP BY, HAVING
-- ------------------------------------------------------------
SELECT 
    alunos.nome, 
    SUM(aulas.duracao_minutos) AS minutos_total
FROM alunos
INNER JOIN aulas ON alunos.id = aulas.aluno_id
GROUP BY alunos.nome
HAVING SUM(aulas.duracao_minutos) > 100;


-- ------------------------------------------------------------
-- 5. Identificação de Clientes sem Pedidos
-- Conceitos: LEFT JOIN, WHERE ... IS NULL
-- ------------------------------------------------------------
SELECT 
    clientes.nome, 
    pedidos.valor
FROM clientes
LEFT JOIN pedidos ON clientes.id = pedidos.cliente_id
WHERE pedidos.id IS NULL;
