---CREATE DATABASE FINANCEIRO
---USE FINANCEIRO

SELECT *
FROM PROJETO_NIKE

---modificando alguns tipos de dados
ALTER TABLE PROJETO_NIKE
ALTER COLUMN listing_price DECIMAL (18,2) NULL

ALTER TABLE PROJETO_NIKE
ALTER COLUMN rating DECIMAL (4,2) NULL 

---apagando o a coluna description 
ALTER TABLE PROJETO_NIKE
DROP COLUMN description 

---consertando os valores 
UPDATE PROJETO_NIKE
SET rating = rating / 10.0
WHERE rating > 5 


UPDATE PROJETO_NIKE
SET sale_price = sale_price / 100.0

UPDATE PROJETO_NIKE
SET listing_price = listing_price / 100.0

--- criando uma tabela com listing_price corrigido
ALTER TABLE PROJETO_NIKE
ADD listing_price_corrigido DECIMAL (10,2) NULL ;

UPDATE PROJETO_NIKE
SET listing_price_corrigido =
	CASE 
		WHEN listing_price = 0 THEN sale_price
		ELSE listing_price
END 
---- substituindo images null
SELECT  TOP 42 product_name, images, reviews, rating
FROM PROJETO_NIKE
WHERE images is null
ORDER BY reviews DESC


UPDATE P
SET P.images = C.images
FROM PROJETO_NIKE P
JOIN images_corrigidas C
  ON P.product_name = C.product_name
WHERE P.images IS NULL ;

---criando dim dos produtos 
SELECT DISTINCT (product_name)
INTO dim_nomes_produto
FROM PROJETO_NIKE


---- criando uma COLUNA categoria por produto 
ALTER TABLE PROJETO_NIKE
ADD categoria_tenis VARCHAR(50) NULL 

UPDATE PROJETO_NIKE
SET categoria_tenis =
	CASE 
		WHEN product_name LIKE '%Air Force%' THEN 'Air Force'
		WHEN product_name LIKE '%Air Max%' THEN 'Air Max'
		WHEN product_name LIKE '%Metcon%' THEN 'Metcon'
		WHEN product_name LIKE '%Jordan%' THEN 'Jordan'
		WHEN product_name LIKE '%Mercurial%' THEN 'Mercurial'
		WHEN product_name LIKE '%SB%' THEN 'Nike SB'
		ELSE 'Outros'
END;

---criando dimensao para categoria
 SELECT DISTINCT (categoria_tenis)
 INTO dim_categorias
 FROM PROJETO_NIKE


 ---criando uma coluna de avaliaçao 
 ALTER TABLE PROJETO_NIKE
 ADD avaliacao varchar (50) NULL;

 UPDATE PROJETO_NIKE
 SET avaliacao =
		CASE
			WHEN rating >= 4.00 THEN 'OTIMO'
			WHEN rating >= 3.00 THEN 'REGULAR'
			WHEN rating >= 1.00 THEN 'PRECISA ANALISAR'
			ELSE 'NAO AVALIADO'
END
	
---criando a dimensao para avaliacao	
SELECT DISTINCT (avaliacao)
INTO dim_avaliacao
FROM PROJETO_NIKE

---multiplicado os valores para sairem de dolar para reais
UPDATE PROJETO_NIKE
SET sale_price = sale_price * 5.55,
	listing_price_corrigido = listing_price_corrigido * 5.55

---- recalculando valores de desconto 
ALTER TABLE PROJETO_NIKE
ADD desconto_recalculado DECIMAL(10,2);

UPDATE PROJETO_NIKE
SET desconto_recalculado = 
    CASE 
        WHEN listing_price_corrigido > sale_price AND sale_price > 0 THEN listing_price_corrigido - sale_price
        ELSE NULL
    END;

 ALTER TABLE PROJETO_NIKE
ADD desconto_percentual AS
    CASE 
        WHEN listing_price_corrigido > sale_price AND sale_price > 0 THEN 
            ((listing_price_corrigido - sale_price) * 100.0) / listing_price_corrigido
        ELSE NULL
    END;


	SELECT product_name, desconto_recalculado, desconto_percentual,listing_price_corrigido,sale_price, avaliacao
	FROM PROJETO_NIKE
	WHERE desconto_recalculado > 0
	ORDER BY desconto_recalculado DESC

	--- corrigindo um erro no percentual

	29.99414044893175  ALTER TABLE PROJETO_NIKE
	                   DROP COLUMN desconto_percentual 

	ALTER TABLE PROJETO_NIKE
ADD desconto_percentual AS
    CASE 
        WHEN listing_price_corrigido > sale_price AND sale_price > 0 THEN 
            ROUND((listing_price_corrigido - sale_price) / listing_price_corrigido, 4)
        ELSE NULL
    END;

	