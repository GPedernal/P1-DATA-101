/*CORRECCION DE ERRATAS - PRIMARY KEYS*/

USE CRM;

ALTER TABLE CRM.CLIENTES
CHANGE COLUMN CUSTOMER_ID CUSTOMER_ID VARCHAR(512) NOT NULL ,
ADD PRIMARY KEY (CUSTOMER_ID);

ALTER TABLE CRM.PRODUCTOS
CHANGE COLUMN PRODUCT_ID PRODUCT_ID VARCHAR(512) NOT NULL ,
ADD PRIMARY KEY (PRODUCT_ID);

ALTER TABLE CRM.ORDERS
CHANGE COLUMN ID ID VARCHAR(512) NOT NULL;

USE FACTURADOR;

ALTER TABLE FACTURADOR.FACTURAS
CHANGE COLUMN BILL_REF_NO BILL_REF_NO VARCHAR(512) NOT NULL ,
ADD PRIMARY KEY (BILL_REF_NO);

USE IVR;

ALTER TABLE IVR.CONTACTOS
CHANGE COLUMN ID ID VARCHAR(512) NOT NULL;





















