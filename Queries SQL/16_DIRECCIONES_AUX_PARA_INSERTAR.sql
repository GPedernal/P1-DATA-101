USE ODS;
DROP TABLE IF EXISTS TMP_DIRECCIONES_SERVICIOS5;
CREATE TABLE TMP_DIRECCIONES_SERVICIOS5 AS
SELECT DISTINCT PRO.ID_SERVICIO ID_SERVICIO
, DIR.ID_DIRECCION ID_DIRECCION
FROM ODS.TMP_DIRECCIONES_SERVICIOS2 PRO
INNER JOIN ODS.ODS_HC_DIRECCIONES DIR ON PRO.DE_DIRECCION = DIR.DE_DIRECCION AND PRO.DE_CP = DIR.DE_CP;
