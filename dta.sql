--------------------------------------------------------
-- Archivo creado  - viernes-octubre-02-2015   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table GENERAL_DATA
--------------------------------------------------------

  CREATE TABLE "ESBCOL"."GENERAL_DATA" 
   (	"NUMBER_ID" NUMBER(19,0), 
	"PERFORMANCE_ID" NUMBER(19,0), 
	"ACTUAL_CHARGE" VARCHAR2(255 CHAR), 
	"BOSS" VARCHAR2(255 CHAR), 
	"BOSS_CHARGE" VARCHAR2(255 CHAR), 
	"DATE_" TIMESTAMP (6), 
	"EVALUATION_TYPE" VARCHAR2(255 CHAR), 
	"NAMES" VARCHAR2(255 CHAR), 
	"PERIOD" VARCHAR2(255 CHAR), 
	"DOCUMENT_NUMBER" VARCHAR2(20 BYTE), 
	"AREA" VARCHAR2(55 BYTE), 
	"YEAR" VARCHAR2(5 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ESBCOL.GENERAL_DATA
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007089
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESBCOL"."SYS_C007089" ON "ESBCOL"."GENERAL_DATA" ("NUMBER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007090
--------------------------------------------------------

  CREATE UNIQUE INDEX "ESBCOL"."SYS_C007090" ON "ESBCOL"."GENERAL_DATA" ("PERFORMANCE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table GENERAL_DATA
--------------------------------------------------------

  ALTER TABLE "ESBCOL"."GENERAL_DATA" ADD UNIQUE ("PERFORMANCE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ESBCOL"."GENERAL_DATA" ADD PRIMARY KEY ("NUMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ESBCOL"."GENERAL_DATA" MODIFY ("NUMBER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table GENERAL_DATA
--------------------------------------------------------

  ALTER TABLE "ESBCOL"."GENERAL_DATA" ADD CONSTRAINT "FKE45BC8C146E680D3" FOREIGN KEY ("PERFORMANCE_ID")
	  REFERENCES "ESBCOL"."PERFORMANCE" ("PERFORMANCE_ID") ENABLE;
--------------------------------------------------------
--  DDL for Trigger GENERAL_DATA_TRG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "ESBCOL"."GENERAL_DATA_TRG" 
BEFORE INSERT ON GENERAL_DATA 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.NUMBER_ID IS NULL THEN
      SELECT GENERAL_DATA_SEQ.NEXTVAL INTO :NEW.NUMBER_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER "ESBCOL"."GENERAL_DATA_TRG" ENABLE;
