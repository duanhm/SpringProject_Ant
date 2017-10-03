-- Create table
create table CBP_QUARTZ_LOCK
(
  ID_CBP_QUARTZ_LOCK	    	varchar(32) default SYS_GUID() not null,
  TARGET_TYPE        		    varchar(50) not null,
  TARGET_ID		        	    varchar(50) not null,
  LOCK_BY					    varchar(32),
  LOCK_DATE					    timestamp default current_timestamp not null,
  EXPIRE_DATE				    timestamp default current_timestamp not null,
  IS_VALID		                varchar(1) default 'Y' not null,
  CREATED_BY              	    varchar(100) default 'system' not null,
  CREATED_DATE            	    timestamp default current_timestamp not null,
  UPDATED_BY              	    varchar(100) default 'system' not null,
  UPDATED_DATE            	    timestamp default current_timestamp not null
);
-- Add comments to the table 
comment on table CBP_QUARTZ_LOCK
  is '信用盒子JOB加锁配置表';
-- Add comments to the columns 
comment on column CBP_QUARTZ_LOCK.ID_CBP_QUARTZ_LOCK
  is '主键';
comment on column CBP_QUARTZ_LOCK.TARGET_TYPE
  is '锁类型';
comment on column CBP_QUARTZ_LOCK.TARGET_ID
  is '锁标识';
comment on column CBP_QUARTZ_LOCK.LOCK_BY
  is '上锁人';
comment on column CBP_QUARTZ_LOCK.LOCK_DATE
  is '上锁时间戳';
comment on column CBP_QUARTZ_LOCK.EXPIRE_DATE
  is '锁释放时间';
comment on column CBP_QUARTZ_LOCK.IS_VALID
  is '是否有效（N：无效，Y：有效，默认为Y）';
comment on column CBP_QUARTZ_LOCK.CREATED_BY
  is '创建人';
comment on column CBP_QUARTZ_LOCK.CREATED_DATE
  is '创建时间';
comment on column CBP_QUARTZ_LOCK.UPDATED_BY
  is '修改人';
comment on column CBP_QUARTZ_LOCK.UPDATED_DATE
  is '修改时间';
-- Create/Recreate primary, unique and foreign key constraints 
create unique index IDX_CBP_QUARTZ_LOCK on public.CBP_QUARTZ_LOCK(ID_CBP_QUARTZ_LOCK);
alter table CBP_QUARTZ_LOCK add constraint PK_CBP_QUARTZ_LOCK_KEY primary key (ID_CBP_QUARTZ_LOCK);

-- Grant/Revoke object privileges 
GRANT ALL ON TABLE CBP_QUARTZ_LOCK TO yxdcbpdata;
grant select, insert, update, delete on CBP_QUARTZ_LOCK to yxdcbpopr;
grant select on CBP_QUARTZ_LOCK to r_yxdcbpdata_qry;
grant select,insert,update,delete on CBP_QUARTZ_LOCK to r_yxdcbpdata_dml;
--grant select on CCBP_QUARTZ_LOCK to r_yxdcbpdata_dev_qry;