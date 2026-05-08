# Bank Customer Churn — Análise e Modelagem Preditiva

Projeto desenvolvido como parte do programa **Elas+ Tech** (Trilha de Dados) da Ada Tech.

---

## Objetivo

Identificar os principais fatores que levam clientes a cancelar seus serviços bancários e construir um modelo preditivo capaz de antecipar o risco de churn — permitindo que a área de retenção atue de forma proativa e orientada por dados.

---

## Estrutura do Repositório

```
Ada-Churn-Project/
│
├── data/
│   └── notebooks/
│       └── Churn_Banco.ipynb         # Notebook de EDA (Análise Exploratória)
│
├── docs/
│   ├── insights.docx                 # Documento com insights consolidados
│   └── resultados_queries_analise_sql.html  # Resultados das queries SQL
│
├── src/
│   ├── Churn_Modelling.csv           # Dataset original
│   └── queries_analise.sql           # Queries SQL de análise
│
└── README.md
```

---

## Ferramentas Utilizadas

- **SQL** — análise exploratória inicial dos dados
- **Python 3** — análise exploratória e modelagem preditiva
- **Pandas / NumPy** — manipulação e transformação de dados
- **Matplotlib / Seaborn** — visualizações
- **Scikit-learn** — pré-processamento, modelagem e avaliação

---

## Etapas do Projeto

### 1. Análise SQL
Queries exploratórias para entender o comportamento de churn por:
- País (Geography)
- Faixa etária
- Status de atividade do cliente
- Número de produtos contratados

### 2. Análise Exploratória de Dados (EDA)
Investigação aprofundada em Python, cobrindo:
- Distribuição e balanceamento da variável target (`Exited`)
- Correlação entre variáveis numéricas
- Churn por gênero, faixa etária, score de crédito e produtos
- Impacto do saldo zero no churn
- Criação de score de risco composto (`RiskScore`)

### 3. Modelagem Preditiva
- Pré-processamento: encoding, train/test split (80/20), normalização com `StandardScaler`
- Modelos treinados: **Regressão Logística** e **Random Forest**
- Avaliação com métricas: Acurácia, Precision, Recall, F1-Score e ROC-AUC
- Validação cruzada (5-fold)
- Análise de importância das features

---

## Resultados do Modelo

| Métrica    | Regressão Logística | Random Forest |
|------------|:-------------------:|:-------------:|
| Acurácia   | 80,8%               | **86,4%**     |
| Precision  | 58,9%               | **78,2%**     |
| Recall     | 18,7%               | **46,0%**     |
| F1-Score   | 28,4%               | **57,9%**     |
| ROC-AUC    | 0,77                | **0,85**      |

> O **Random Forest** foi o modelo com melhor desempenho em todas as métricas, especialmente no Recall — a métrica mais relevante para o problema de churn, pois o custo de não identificar um cliente que vai sair é maior do que o custo de uma ação de retenção desnecessária.

---

## Principais Insights

- **Alemanha** apresenta a maior taxa de churn (32,4%), quase o dobro de França e Espanha (~16%)
- Clientes entre **46 e 60 anos** têm churn de ~37% — a faixa mais crítica
- **Membros inativos** têm quase o **dobro de churn** em relação a membros ativos (26,9% vs 14,3%)
- Clientes com **3 ou 4 produtos** têm churn altíssimo (82–100%) — o ponto ótimo de retenção é 2 produtos
- **Score de crédito** apresenta baixa correlação com churn — não é um preditor forte isolado
- A **feature mais importante** no modelo foi `Age`, confirmando os achados da EDA

---

## Recomendações para a Área de Retenção

- Criar programa de fidelidade direcionado a clientes **acima de 45 anos**
- Implementar fluxo de **reengajamento automático** para clientes inativos (alertas a partir de 30 dias sem uso)
- Priorizar clientes com perfil de **alto risco combinado**: idade > 45 + inativo + saldo positivo
- Monitorar clientes com **3+ produtos** como sinal de insatisfação, não de engajamento



---

## 👩‍💻 Autoras

Desenvolvido por Grupo 14 [Beatriz Feitosa, Evelyn Feitosa, Raquel Ramalho, Palloma Oliveira] — Programa Elas+ Tech | Ada Tech | Trilha de Dados
