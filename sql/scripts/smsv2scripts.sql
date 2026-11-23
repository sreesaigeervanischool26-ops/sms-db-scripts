-- smsv2scripts.sql
-- Run after smsv1scripts.sql.
-- Adds fee breakdown, transport and Sainik training columns to students.

ALTER TABLE students
  ADD COLUMN transport                 VARCHAR(10) NULL COMMENT 'Yes / No / empty',
  ADD COLUMN academic_fee              DOUBLE      NULL,
  ADD COLUMN additional_fee            DOUBLE      NULL COMMENT 'Paid at start of year; not part of term split',
  ADD COLUMN residential_fee           DOUBLE      NULL,
  ADD COLUMN total_fee_with_additional DOUBLE      NULL COMMENT 'total_fee + additional_fee',
  ADD COLUMN is_sainik_training        BIT(1)      NULL;
