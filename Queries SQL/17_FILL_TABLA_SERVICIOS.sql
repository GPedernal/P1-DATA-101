/*RELLENAMOS LA TABLA PRINCIPAL: SERVICIOS*/

USE ODS;

INSERT INTO ODS_HC_SERVICIOS
SELECT PRODUCT_ID ID_SERVICIO
, CUSTOMER_ID ID_CLIENTE
, PRO.ID_PRODUCTO ID_PRODUCTO
, CASE WHEN LENGTH(TRIM(ACCESS_POINT))<>0 THEN TRIM(ACCESS_POINT) ELSE 'DESCONOCIDO' END PUNTO_ACCESO
, CAN.ID_CANAL ID_CANAL
, CASE WHEN LENGTH(TRIM(AGENT_CODE))<>0 THEN TRIM(AGENT_CODE) ELSE 9998 END ID_AGENTE
, DIR.ID_DIRECCION ID_DIRECCION
, CASE WHEN LENGTH(TRIM(START_DATE))<>0 THEN STR_TO_DATE(START_DATE,'%d/%m/%Y') ELSE STR_TO_DATE('31/12/9999','%d/%m/%Y') END FC_INICIO
, CASE WHEN LENGTH(TRIM(INSTALL_DATE))<>0 THEN REPLACE(INSTALL_DATE,'UTC','') ELSE STR_TO_DATE('9999-12-31 23:59:59','%Y-%m-%d %H:%i:%s') END FC_INSTALACION
, CASE WHEN LENGTH(TRIM(END_DATE))<>0 THEN REPLACE(END_DATE,'UTC','') ELSE STR_TO_DATE('9999-12-31 23:59:59','%Y-%m-%d %H:%i:%s') END FC_FIN
, NOW()
, STR_TO_DATE('31/12/9999','%d/%m/%Y')
FROM STAGE.STG_PRODUCTOS_CRM PRODUCTOS
INNER JOIN ODS.ODS_DM_PRODUCTOS PRO ON CASE WHEN LENGTH(TRIM(PRODUCTOS.PRODUCT_NAME))<>0 THEN UPPER(TRIM(PRODUCTOS.PRODUCT_NAME)) ELSE 'DESCONOCIDO' END=PRO.DE_PRODUCTO
INNER JOIN ODS.ODS_DM_CANALES CAN ON CASE WHEN LENGTH(TRIM(PRODUCTOS.CHANNEL))<>0 THEN (TRIM(PRODUCTOS.CHANNEL)) ELSE 'DESCONOCIDO' END=CAN.DE_CANAL
LEFT OUTER JOIN ODS.TMP_DIRECCIONES_SERVICIOS5 DIR ON DIR.ID_SERVICIO=PRODUCTOS.PRODUCT_ID
;

COMMIT;

ANALYZE TABLE ODS_HC_SERVICIOS;


