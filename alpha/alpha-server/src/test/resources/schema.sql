CREATE TABLE IF NOT EXISTS TxEvent (
  surrogateId bigint GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY,
  serviceName varchar(36) NOT NULL,
  instanceId varchar(36) NOT NULL,
  creationTime TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  globalTxId varchar(36) NOT NULL,
  localTxId varchar(36) NOT NULL,
  parentTxId varchar(36) DEFAULT NULL,
  type varchar(50) NOT NULL,
  compensationMethod varchar(256) NOT NULL,
  payloads varbinary(10240),
--  version bigint NOT NULL
);

CREATE TABLE IF NOT EXISTS Command (
  surrogateId bigint GENERATED BY DEFAULT AS IDENTITY(START WITH 1, INCREMENT BY 1) PRIMARY KEY,
  eventId bigint NOT NULL UNIQUE,
  serviceName varchar(36) NOT NULL,
  instanceId varchar(36) NOT NULL,
  globalTxId varchar(36) NOT NULL,
  localTxId varchar(36) NOT NULL,
  parentTxId varchar(36) DEFAULT NULL,
  compensationMethod varchar(256) NOT NULL,
  payloads varbinary(10240),
  status varchar(12),
  lastModified TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  version bigint NOT NULL
);
