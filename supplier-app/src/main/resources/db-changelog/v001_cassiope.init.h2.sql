--liquibase formatted sql

--changeset Art:1586032267021-1
CREATE SEQUENCE IF NOT EXISTS HIBERNATE_SEQUENCE;

--changeset Art:1586032267021-2
CREATE  TABLE IF NOT EXISTS   CAR (ID INT NOT NULL, EPTS_NUMBER VARCHAR(255), FINANCE_DATE date, FULL_REPAYMENT_DATE date, INVOICE_NUM VARCHAR(255), ISSUE_DATE date, STATE VARCHAR(255), SUBMIT_DATE date, VALUE DOUBLE(17) NOT NULL, VALUE_FINANCE DOUBLE(17) NOT NULL, VIN VARCHAR(255), CAR_MODEL_ID INT NOT NULL, DEALER_ID INT, FINANCE_PLAN_ID INT, ARCHIVED_DATE date, CONSTRAINT CONSTRAINT_1 PRIMARY KEY (ID));

--changeset Art:1586032267021-3
CREATE  TABLE IF NOT EXISTS  CAR_MODEL (ID INT NOT NULL, CODE VARCHAR(255) NOT NULL, MAME VARCHAR(255) NOT NULL, CONSTRAINT CONSTRAINT_C PRIMARY KEY (ID));

--changeset Art:1586032267021-4
CREATE  TABLE IF NOT EXISTS  DEALER (ID INT NOT NULL, CODE VARCHAR(255) NOT NULL, NAME VARCHAR(255) NOT NULL, CONSTRAINT CONSTRAINT_7 PRIMARY KEY (ID));

--changeset Art:1586032267021-5
CREATE  TABLE IF NOT EXISTS  DEALER_LIMIT (ID INT NOT NULL, AVAILABLE_AMOUNT DECIMAL(19, 2), AVAILABLE_AMOUNT_DE_CC DECIMAL(19, 2), HARD_LIMIT DECIMAL(19, 2), SOFT_LIMIT DECIMAL(19, 2), SUBLIMIT_DE_CC DECIMAL(19, 2), TOTAL_FINANCED DECIMAL(19, 2), TOTAL_FINANCED_DE_CC DECIMAL(19, 2), DEALER_ID INT NOT NULL, CONSTRAINT CONSTRAINT_CF PRIMARY KEY (ID));

--changeset Art:1586032267021-6
CREATE  TABLE IF NOT EXISTS  FINANCE_PLAN (ID INT NOT NULL, CODE VARCHAR(255) NOT NULL, NAME VARCHAR(255), CONSTRAINT CONSTRAINT_9 PRIMARY KEY (ID));

--changeset Art:1586032267021-7
CREATE  TABLE IF NOT EXISTS  PAYLOAD (ID INT NOT NULL, DATE date, NAME VARCHAR(255), PAYLOAD_TYPE VARCHAR(255), PROCESSED_DATE date, SEQUENCE_NUMBER INT NOT NULL, STATE VARCHAR(255), ROLLBACK_DATE date, CONSTRAINT CONSTRAINT_F PRIMARY KEY (ID));

--changeset Art:1586032267021-8
CREATE  TABLE IF NOT EXISTS  PAYLOAD_ITEM (ID INT NOT NULL, ERROR_DESCR VARCHAR(255), EVENT_CODE VARCHAR(255), SEQUENCE_NUM INT NOT NULL, SOURCE VARCHAR(3000), SOURCE_TYPE VARCHAR(255), CAR_ID INT, LIMIT_ID INT, PAYLOAD_ID INT NOT NULL, CONSTRAINT CONSTRAINT_1D PRIMARY KEY (ID));

--changeset Art:1586032267021-9
CREATE  TABLE IF NOT EXISTS  REPAYMENT_ITEM (ID INT NOT NULL, DATE date, VALUE DOUBLE(17) NOT NULL, CAR_ID INT NOT NULL, CONSTRAINT CONSTRAINT_10 PRIMARY KEY (ID));

--changeset Art:1586032267021-10
CREATE INDEX IF NOT EXISTS FK1QTH0V8QRQ01CC9LK55XMHD7_INDEX_2 ON CAR(DEALER_ID);

--changeset Art:1586032267021-11
CREATE INDEX IF NOT EXISTS FK2H7PKIIE688AME0NEOIYFUYLA_INDEX_2 ON CAR(FINANCE_PLAN_ID);

--changeset Art:1586032267021-12
CREATE INDEX IF NOT EXISTS FK2RUG3CSJNXBUAAQ08DIDSSVSW_INDEX_1 ON REPAYMENT_ITEM(CAR_ID);

--changeset Art:1586032267021-13
CREATE INDEX IF NOT EXISTS FK302HBGVY6WDP58OYD01KD3IU3_INDEX_1 ON PAYLOAD_ITEM(CAR_ID);

--changeset Art:1586032267021-14
CREATE INDEX IF NOT EXISTS FKCUEUR6LB7LF5UAD6YHIBCQAMC_INDEX_1 ON PAYLOAD_ITEM(PAYLOAD_ID);

--changeset Art:1586032267021-15
CREATE INDEX IF NOT EXISTS FKD30V5YMSPG670YJ1TFM77WJDM_INDEX_1 ON PAYLOAD_ITEM(LIMIT_ID);

--changeset Art:1586032267021-16
CREATE INDEX IF NOT EXISTS FKESRSWV1UU1LXU9G1VH18Q1OIB_INDEX_C ON DEALER_LIMIT(DEALER_ID);

--changeset Art:1586032267021-17
CREATE INDEX IF NOT EXISTS FKGFHT1L5LCN8GBUGHA10MNT4BG_INDEX_2 ON CAR(CAR_MODEL_ID);

--changeset Art:1586032267021-18
ALTER  TABLE   CAR ADD CONSTRAINT IF NOT EXISTS FK1QTH0V8QRQ01CC9LK55XMHD7 FOREIGN KEY (DEALER_ID) REFERENCES DEALER (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-19
ALTER  TABLE  CAR ADD CONSTRAINT IF NOT EXISTS FK2H7PKIIE688AME0NEOIYFUYLA FOREIGN KEY (FINANCE_PLAN_ID) REFERENCES FINANCE_PLAN (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-20
ALTER  TABLE   REPAYMENT_ITEM ADD CONSTRAINT IF NOT EXISTS FK2RUG3CSJNXBUAAQ08DIDSSVSW FOREIGN KEY (CAR_ID) REFERENCES CAR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-21
ALTER  TABLE   PAYLOAD_ITEM ADD CONSTRAINT IF NOT EXISTS FK302HBGVY6WDP58OYD01KD3IU3 FOREIGN KEY (CAR_ID) REFERENCES CAR (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-22
ALTER  TABLE PAYLOAD_ITEM ADD CONSTRAINT IF NOT EXISTS FKCUEUR6LB7LF5UAD6YHIBCQAMC FOREIGN KEY (PAYLOAD_ID) REFERENCES PAYLOAD (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-23
ALTER  TABLE  PAYLOAD_ITEM ADD CONSTRAINT IF NOT EXISTS FKD30V5YMSPG670YJ1TFM77WJDM FOREIGN KEY (LIMIT_ID) REFERENCES DEALER_LIMIT (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-24
ALTER  TABLE  DEALER_LIMIT ADD CONSTRAINT IF NOT EXISTS FKESRSWV1UU1LXU9G1VH18Q1OIB FOREIGN KEY (DEALER_ID) REFERENCES DEALER (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;

--changeset Art:1586032267021-25
ALTER  TABLE  CAR ADD CONSTRAINT IF NOT EXISTS FKGFHT1L5LCN8GBUGHA10MNT4BG FOREIGN KEY (CAR_MODEL_ID) REFERENCES CAR_MODEL (ID) ON UPDATE RESTRICT ON DELETE RESTRICT;
