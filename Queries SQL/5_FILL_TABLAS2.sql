/* RELLENO LAS TABLAS AUXILIARES PARTE 2*/

USE ODS;

INSERT INTO ODS_DM_PAISES (DE_PAIS, FC_INSERT, FC_MODIFICACION)
SELECT DISTINCT UPPER(TRIM(COUNTRY)) PAIS, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM
WHERE LENGTH(TRIM(COUNTRY))<>0;

INSERT INTO ODS_DM_PAISES VALUES (99, 'DESCONOCIDO', NOW(), NOW());
INSERT INTO ODS_DM_PAISES VALUES (98, 'NO APLICA', NOW(), NOW());

COMMIT;

INSERT INTO ODS_DM_CIUDADES_ESTADOS (DE_CIUDAD, DE_ESTADO, ID_PAIS, FC_INSERT, FC_MODIFICACION)
SELECT DISTINCT CASE WHEN UPPER(TRIM(CITY))<>'' THEN UPPER(TRIM(CITY)) ELSE 'DESCONOCIDO' END CIUDAD
, CASE WHEN UPPER(TRIM(STATE))<>'' THEN UPPER(TRIM(STATE)) ELSE 'DESCONOCIDO' END ESTADO, PAI.ID_PAIS, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM CLI
INNER JOIN ODS.ODS_DM_PAISES PAI ON CASE WHEN LENGTH(TRIM(CLI.COUNTRY))<>0 THEN UPPER(TRIM(CLI.COUNTRY)) ELSE 'DESCONOCIDO' END=PAI.DE_PAIS
WHERE TRIM(CITY)<>'' OR TRIM(STATE)<>'';

INSERT INTO ODS_DM_CIUDADES_ESTADOS VALUES (999, 'DESCONOCIDO', 'DESCONOCIDO', 99, NOW(), NOW());
INSERT INTO ODS_DM_CIUDADES_ESTADOS VALUES (998, 'NO APLICA', 'NO APLICA', 98, NOW(), NOW());

INSERT INTO ODS_HC_DIRECCIONES (DE_DIRECCION, DE_CP, ID_CIUDAD_ESTADO, FC_INSERT, FC_MODIFICACION)
SELECT DISTINCT UPPER(TRIM(ADDRESS)) DIRECCION
, CASE WHEN LENGTH(TRIM(CLI.POSTAL_CODE))<>0 THEN TRIM(CLI.POSTAL_CODE) ELSE 99999 END CP
, CIU.ID_CIUDAD_ESTADO, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM CLI
INNER JOIN ODS.ODS_DM_PAISES PAI ON CASE WHEN LENGTH(TRIM(CLI.COUNTRY))<>0 THEN UPPER(TRIM(CLI.COUNTRY)) ELSE 'DESCONOCIDO' END=PAI.DE_PAIS
INNER JOIN ODS.ODS_DM_CIUDADES_ESTADOS CIU ON CASE WHEN LENGTH(TRIM(CLI.CITY))<>0 THEN UPPER(TRIM(CLI.CITY)) ELSE 'DESCONOCIDO' END=CIU.DE_CIUDAD
AND CASE WHEN LENGTH(TRIM(CLI.STATE))<>0 THEN UPPER(TRIM(CLI.STATE)) ELSE 'DESCONOCIDO' END=CIU.DE_ESTADO
WHERE LENGTH(TRIM(ADDRESS))<>0;

INSERT INTO ODS_HC_DIRECCIONES VALUES (999999, 'DESCONOCIDO', 99999, 999, NOW(), NOW());
INSERT INTO ODS_HC_DIRECCIONES VALUES (999998, 'NO APLICA', 99998, 998, NOW(), NOW());
                                           
COMMIT;                                           















