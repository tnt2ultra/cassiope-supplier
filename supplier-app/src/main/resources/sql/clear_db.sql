-- clear_db script
-- 2019-12-04
-- ver. 1.0

update  DEALER_LIMIT set AVAILABLE_AMOUNT = 0, AVAILABLE_AMOUNT_DE_CC = 0, HARD_LIMIT  = 0, SOFT_LIMIT  = 0, SUBLIMIT_DE_CC  = 0, TOTAL_FINANCED  = 0, TOTAL_FINANCED_DE_CC = 0 ;
SELECT * FROM DEALER_LIMIT ;
delete FROM PAYLOAD_ITEM ;
delete FROM PAYLOAD ;
SELECT * FROM PAYLOAD_ITEM  ;
SELECT * FROM PAYLOAD ;
delete FROM REPAYMENT_ITEM ;
SELECT * FROM REPAYMENT_ITEM ;
delete FROM CAR  ;
SELECT * FROM CAR  ;
SELECT count(*) FROM CAR_MODEL ;
SELECT count(*) FROM DEALER  ;
SELECT count(*) FROM FINANCE_PLAN  ;
commit;