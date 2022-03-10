USE store;
-- -----------------------------------------------------
-- consulta 1
-- -----------------------------------------------------



-- -----------------------------------------------------
-- consulta 2
-- -----------------------------------------------------
SELECT prov_name FROM Provider
LEFT JOIN Product P on Provider.idProvider = P.Provider_idProvider
WHERE P.name_product = 'Tijeras'
GROUP BY idProvider;

-- -----------------------------------------------------
-- consulta 3
-- -----------------------------------------------------
SELECT S.sale_name_product ,COUNT(P.id_Product) AS quantity FROM Product P , Sale S
WHERE S.id_Sale = P.id_Product
GROUP BY sale_name_product
ORDER BY count(P.id_Product)DESC ;