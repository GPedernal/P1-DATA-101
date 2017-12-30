/*RELLENO LAS TABLAS AUXILIARES*/

USE ODS;

INSERT INTO ODS_DM_SEXOS VALUES (1, 'MALE', NOW(), NOW());
INSERT INTO ODS_DM_SEXOS VALUES (2, 'FEMALE', NOW(), NOW());
INSERT INTO ODS_DM_SEXOS VALUES (99, 'DESCONOCIDO', NOW(), NOW());
INSERT INTO ODS_DM_SEXOS VALUES (98, 'NO APLICA', NOW(), NOW());

COMMIT;

INSERT INTO ODS_DM_PROFESIONES (DE_PROFESION, FC_INSERT, FC_MODIFICACION)
SELECT DISTINCT UPPER(TRIM(PROFESION)) PROFESION, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM
WHERE LENGTH(TRIM(PROFESION))<>0;

COMMIT;

INSERT INTO ODS_DM_PROFESIONES VALUES (999, 'DESCONOCIDO', NOW(), NOW());
INSERT INTO ODS_DM_PROFESIONES VALUES (998, 'NO APLICA', NOW(), NOW());

COMMIT;

INSERT INTO ODS_DM_COMPANYAS (DE_COMPANYA, FC_INSERT, FC_MODIFICACION)
SELECT DISTINCT UPPER(TRIM(COMPANY)) DE_COMPANYA, NOW(), NOW()
FROM STAGE.STG_CLIENTES_CRM
WHERE LENGTH(TRIM(COMPANY))<>0;

COMMIT;

INSERT INTO ODS_DM_COMPANYAS VALUES (999, 'DESCONOCIDO', NOW(), NOW());
INSERT INTO ODS_DM_COMPANYAS VALUES (998, 'NO APLICA', NOW(), NOW());

COMMIT;
















