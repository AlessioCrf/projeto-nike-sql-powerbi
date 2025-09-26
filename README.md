# 🏆 Projeto Nike – SQL + Power BI

📊 Este projeto utiliza dados do **Kaggle** sobre tênis da Nike (preços, descontos e avaliações) para praticar **tratamento em SQL Server** e criação de um **dashboard interativo no Power BI**.  

## 🛠️ Tecnologias Utilizadas
- **SQL Server** → tratamento, limpeza e modelagem de dados.  
- **Power Query** → transformações adicionais para integração no Power BI.  
- **Power BI** → criação de relatórios e storytelling visual.  
- **Figma** → design da capa e telas de fundo do dashboard.  
- *(Excel apenas como apoio inicial para recebimento da base do Kaggle).*


 ## 📑 Dados Brutos 
- Contém preços originais (em dólar), descontos e ratings dos produtos.  
- Dados obtidos no **Kaggle**.  
- Nenhum tratamento aplicado nesta etapa.


## 🔧 Tratamento em SQL
📂 Arquivo: `projeto_nike.sql`  

Principais etapas realizadas:
1. Criação do **schema** e tabelas dimensionais.  
2. Conversão de preços para reais.  
3. Tratamento de **valores nulos** e inconsistentes.  
4. Padronização de nomes de produtos e categorias.  
5. Identificação e tratamento de **duplicidades**.  
6. Criação de métricas:  
   - Preço mínimo, máximo e médio por produto.  
   - Percentual de desconto aplicado.  
   - Relação entre preço e rating.
  



## 📈 Power BI

- KPIs: Preço médio, desconto médio, rating médio.

- Cartões dinâmicos para "Tênis mais caro", "Tênis mais barato".

- Página financeira (média total, proporção com desconto).

- Página detalhada de produtos.


### Demonstração
Um vídeo mostrando a dashboard em funcionamento está disponível no meu [LinkedIn](https://www.linkedin.com/in/alessio-ricardo/).

  
  
 
## 💡 Insights Obtidos
- Produtos **mais caros não são necessariamente os melhores avaliados**.  
- Alguns modelos **sem desconto recebem notas maiores** do que modelos em promoção.  
- O preço médio por categoria pode guiar **estratégias de precificação e marketing**.  


## 🔍 Transparência
Os dados são **fictícios** e utilizados apenas para fins de estudo, mas todo o fluxo de **ETL → SQL → Power BI** reflete práticas aplicáveis em cenários reais.  






✍️ Desenvolvido por [Alessio Ricardo]  
🔗 (https://www.linkedin.com/in/alessio-ricardo/) | (https://github.com/AlessioCrf)
