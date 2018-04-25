--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."CUSTOMERS" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."ORDERS" 
   (	"ID" NUMBER, 
	"AMOUNT" NUMBER, 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER, 
	"SALESMAN_ID" NUMBER
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "EJERCICIOS"."SALESMAN" 
   (	"ID" NUMBER, 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER
   )
--------------------------------------------------------
--  DDL for View VIEW1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW1" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMERS_ID", "CUSTOMERS_NAME") AS 
  SELECT SALE.ID as salesman_id,SALE.NAME as salesman_name,CUSTO.ID as customers_id,CUSTO.NAME as customers_name
   FROM CUSTOMERS CUSTO inner join SALESMAN SALE on
   SALE.ID = CUSTO.SALESMAN_ID
--------------------------------------------------------
--  DDL for View VIEW2
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW2" ("ORDER_ID", "ORDER_DATE", "ORDER_AMOUNT", "CUSTOMER_ID", "CUSTOMER_NAME", "SALESMAN_ID", "SALESMAN_NAME", "SALESMAN_COMMISSION") AS 
  SELECT ORD.ID as order_id,ORD.ORDER_DATE as order_date,ORD.AMOUNT as order_amount,CUSTO.ID as customer_id,
   CUSTO.NAME as customer_name,SALE.ID as salesman_id,SALE.NAME as salesman_name,SALE.COMMISSION as salesman_commission
   FROM CUSTOMERS CUSTO inner join SALESMAN SALE on
   SALE.ID = CUSTO.SALESMAN_ID inner join ORDERS ORD on
   ORD.SALESMAN_ID = SALE.ID
  where CUSTO.SALESMAN_ID is not null
--------------------------------------------------------
--  DDL for View VIEW3
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW3" ("CUSTOMERS_ID", "CUSTOMERS_NAME", "SALESMAN_ID", "SALESMAN_NAME") AS 
  SELECT CUSTO.ID as customers_id ,CUSTO.NAME as customers_name,SALE.ID salesman_id ,SALE.NAME as salesman_name
   FROM CUSTOMERS CUSTO right join SALESMAN SALE on
   SALE.ID = CUSTO.SALESMAN_ID
   where CUSTO.GRADE<300 
   ORDER BY CUSTO.ID asc
--------------------------------------------------------
--  DDL for View VIEW4
--------------------------------------------------------

  CREATE OR REPLACE VIEW "EJERCICIOS"."VIEW4" ("SALESMAN_ID", "SALESMAN_NAME", "CUSTOMERS_ID", "CUSTOMERS_NAME") AS 
  SELECT SALE.ID as salesman_id,SALE.NAME as salesman_name,CUSTO.ID as customers_id,CUSTO.NAME as customers_name
   FROM CUSTOMERS CUSTO full outer join SALESMAN SALE on
   SALE.ID = CUSTO.SALESMAN_ID
   ORDER BY SALE.ID asc
--------------------------------------------------------
--  DDL for Index CUSTOMERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."CUSTOMERS_PK" ON "EJERCICIOS"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index ORDERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."ORDERS_PK" ON "EJERCICIOS"."ORDERS" ("ID")
--------------------------------------------------------
--  DDL for Index SALESMAN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "EJERCICIOS"."SALESMAN_PK" ON "EJERCICIOS"."SALESMAN" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("SALESMAN_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("GRADE" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "ORDERS_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("SALESMAN_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("CUSTOMER_ID" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("ORDER_DATE" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("AMOUNT" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."ORDERS" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."SALESMAN" ADD CONSTRAINT "SALESMAN_PK" PRIMARY KEY ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("COMMISSION" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("COUNTRY" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("NAME" NOT NULL ENABLE)
  ALTER TABLE "EJERCICIOS"."SALESMAN" MODIFY ("ID" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "EJERCICIOS"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "EJERCICIOS"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "EJERCICIOS"."SALESMAN" ("ID") ENABLE
