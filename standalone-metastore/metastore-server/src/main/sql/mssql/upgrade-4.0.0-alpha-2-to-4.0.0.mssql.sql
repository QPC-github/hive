SELECT 'Upgrading MetaStore schema from  4.0.0-alpha-2 to 4.0.0' AS MESSAGE;

-- HIVE-26221
ALTER TABLE TAB_COL_STATS ADD HISTOGRAM varbinary(max);
ALTER TABLE PART_COL_STATS ADD HISTOGRAM varbinary(max);

-- HIVE-26719
ALTER TABLE COMPACTION_QUEUE ADD CQ_NUMBER_OF_BUCKETS INTEGER NULL;
ALTER TABLE COMPLETED_COMPACTIONS ADD CC_NUMBER_OF_BUCKETS INTEGER NULL;

-- HIVE-26735
ALTER TABLE COMPACTION_QUEUE ADD CQ_ORDER_BY VARCHAR(4000);
ALTER TABLE COMPLETED_COMPACTIONS ADD CC_ORDER_BY VARCHAR(4000);

-- HIVE-26704
CREATE TABLE MIN_HISTORY_WRITE_ID (
  MH_TXNID bigint NOT NULL,
  MH_DATABASE nvarchar(128) NOT NULL,
  MH_TABLE nvarchar(256) NOT NULL,
  MH_WRITEID bigint NOT NULL
);

-- These lines need to be last.  Insert any changes above.
UPDATE VERSION SET SCHEMA_VERSION='4.0.0', VERSION_COMMENT='Hive release version 4.0.0' where VER_ID=1;
SELECT 'Finished upgrading MetaStore schema from 4.0.0-alpha-2 to 4.0.0' AS MESSAGE;
