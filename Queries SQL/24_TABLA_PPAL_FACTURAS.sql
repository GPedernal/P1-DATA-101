/*RELLENAMOS LA TABLA PRINCIPAL: FACTURAS*/

USE ODS;

INSERT INTO ODS_HC_FACTURAS
SELECT BILL_REF_NO ID_FACTURA
, CUSTOMER_ID ID_CLIENTE
, START_DATE FC_INICIO
, END_DATE FC_FIN
, STATEMENT_DATE FC_ESTADO
, PAYMENT_DATE FC_PAGO
, CICLO.ID_CICLO_FACTURACION
, MTD.ID_METODO_PAGO
, AMOUNT CANTIDAD
, NOW()
, STR_TO_DATE('31/12/9999','%d/%m/%Y')
FROM STAGE.STG_FACTURAS_FCT FACTURAS
INNER JOIN ODS.ODS_DM_CICLOS_FACTURACION CICLO ON CASE WHEN LENGTH(TRIM(FACTURAS.BILL_CYCLE))<>0 THEN UPPER(TRIM(FACTURAS.BILL_CYCLE)) ELSE 'DESCONOCIDO' END=CICLO.DE_CICLO_FACTURACION
INNER JOIN ODS.ODS_DM_METODOS_PAGO MTD ON CASE WHEN LENGTH(TRIM(FACTURAS.BILL_METHOD))<>0 THEN UPPER((TRIM(FACTURAS.BILL_METHOD))) ELSE 'DESCONOCIDO' END=MTD.DE_METODO_PAGO
;

COMMIT;

ANALYZE TABLE ODS_HC_FACTURAS;
