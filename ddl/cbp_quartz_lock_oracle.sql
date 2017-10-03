-- Create table
create table CBP_QUARTZ_LOCK
(
  ID_CBP_QUARTZ_LOCK	    	varchar2(32) default SYS_GUID() not null,
  TARGET_TYPE        		    varchar2(50) not null,
  TARGET_ID		        	    varchar2(50) not null,
  LOCK_BY					    varchar2(32),
  LOCK_DATE					    date default sysdate not null,
  EXPIRE_DATE				    date default sysdate not null,
  IS_VALID		                varchar2(1) default 'Y' not null,
  CREATED_BY              	    varchar2(100) default 'system' not null,
  CREATED_DATE            	    date default sysdate not null,
  UPDATED_BY              	    varchar2(100) default 'system' not null,
  UPDATED_DATE            	    date default sysdate not null
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
create unique index IDX_CBP_QUARTZ_LOCK on CBP_QUARTZ_LOCK(ID_CBP_QUARTZ_LOCK);
alter table CBP_QUARTZ_LOCK add constraint PK_CBP_QUARTZ_LOCK_KEY primary key (ID_CBP_QUARTZ_LOCK);
