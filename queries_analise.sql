
-- =========================================
-- Projeto Churn
-- Banco: SQLite
-- =========================================

-- Criação da tabela principal
CREATE TABLE customers (
    RowNumber INTEGER,
    CustomerId INTEGER,
    Surname TEXT,
    CreditScore INTEGER,
    Geography TEXT,
    Gender TEXT,
    Age INTEGER,
    Tenure INTEGER,
    Balance REAL,
    NumOfProducts INTEGER,
    HasCrCard INTEGER,
    IsActiveMember INTEGER,
    EstimatedSalary REAL,
    Exited INTEGER
);

-- Verificação de dados nulos
SELECT *
FROM customers
WHERE Geography IS NULL
   OR Age IS NULL
   OR IsActiveMember IS NULL
   OR NumOfProducts IS NULL
   OR Exited IS NULL;
-- Conclusão: não foi identificado dados nulos na base de dados

-- Análise 1: Taxa de churn por país
SELECT 
    Geography,
    COUNT(*) AS total_clientes,
    SUM(Exited) AS clientes_churn,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY Geography
ORDER BY churn_rate DESC;

-- Análise 2: Churn por faixa etária
SELECT
    CASE
        WHEN Age < 30 THEN 'Até 29'
        WHEN Age BETWEEN 30 AND 45 THEN '30-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS faixa_etaria,
    COUNT(*) AS total_clientes,
    SUM(Exited) AS churn,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY faixa_etaria
ORDER BY churn_rate DESC;

-- Análise 3: Churn por atividade
SELECT
    IsActiveMember,
    COUNT(*) AS total_clientes,
    SUM(Exited) AS churn,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY IsActiveMember;

-- Segmentação 4: Produtos x churn
SELECT
    NumOfProducts,
    COUNT(*) AS total_clientes,
    SUM(Exited) AS churn,
    ROUND(100.0 * SUM(Exited) / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY NumOfProducts
ORDER BY churn_rate DESC;
