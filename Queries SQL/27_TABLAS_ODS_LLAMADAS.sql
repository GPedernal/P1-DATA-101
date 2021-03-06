/*CREO TABLAS DE LLAMADAS EN ODS*/

USE ODS;

DROP TABLE IF EXISTS ODS_HC_LLAMADAS;
CREATE TABLE IF NOT EXISTS ODS_HC_LLAMADAS
(ID_LLAMADA INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, ID_IVR INT
, TELEFONO_LLAMADA BIGINT
, ID_CLIENTE INT
, FC_INICIO_LLAMADA DATETIME
, FC_FIN_LLAMADA DATETIME
, ID_DEPARTAMENTO_CC INT
, FLG_TRANSFERIDO TINYINT 
, ID_AGENTE_CC INT 
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);
ANALYZE TABLE ODS_HC_LLAMADAS;

DROP TABLE IF EXISTS ODS_DM_DEPARTAMENTOS_CC;
CREATE TABLE IF NOT EXISTS ODS_DM_DEPARTAMENTOS_CC
(ID_DEPARTAMENTO_CC INT NOT NULL PRIMARY KEY
, DE_DEPARTAMENTO_CC VARCHAR(512)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);
ANALYZE TABLE ODS_DM_DEPARTAMENTOS_CC;

DROP TABLE IF EXISTS ODS_DM_AGENTES_CC;
CREATE TABLE IF NOT EXISTS ODS_DM_AGENTES_CC
(ID_AGENTE_CC INT NOT NULL AUTO_INCREMENT PRIMARY KEY
, DE_AGENTE_CC VARCHAR(512)
, FC_INSERT DATETIME
, FC_MODIFICACION DATETIME);
ANALYZE TABLE ODS_DM_AGENTES_CC;
