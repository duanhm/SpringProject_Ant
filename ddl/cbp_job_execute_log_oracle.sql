-- Create table
create table CBP_JOB_EXECUTE_LOG
(
  ID_CBP_JOB_EXECUTE_LOG		varchar2(32) default SYS_GUID() not null,
  JOB_NAME			    		varchar2(50),
  INSTANCE_NAME        		    varchar2(32),
  STATE		        	    	varchar2(1) default '0',
  STATE_DESC		        	varchar2(50),
  ERROR_MSG					    clob,
  EXECUTE_TIME	        		varchar2(10),
  CREATED_BY              	    varchar2(100) default 'system' not null,
  CREATED_DATE            	    date default sysdate not null,
  UPDATED_BY              	    varchar2(100) default 'system' not null,
  UPDATED_DATE            	    date default sysdate not null
);
-- Add comments to the table 
comment on table CBP_JOB_EXECUTE_LOG
  is 'JOB运行轨迹表';
-- Add comments to the columns 
comment on column CBP_JOB_EXECUTE_LOG.ID_CBP_JOB_EXECUTE_LOG
  is '主键';
comment on column CBP_JOB_EXECUTE_LOG.JOB_NAME
  is 'JOB名称';
comment on column CBP_JOB_EXECUTE_LOG.INSTANCE_NAME
  is '机器名';
comment on column CBP_JOB_EXECUTE_LOG.STATE
  is 'JOB执行状态（0：开始执行，1：正常结束，2：异常结束，默认0）';
comment on column CBP_JOB_EXECUTE_LOG.STATE_DESC
  is '状态描述';
comment on column CBP_JOB_EXECUTE_LOG.ERROR_MSG
  is '异常信息';
comment on column CBP_JOB_EXECUTE_LOG.EXECUTE_TIME
  is 'JOB执行时长';
comment on column CBP_JOB_EXECUTE_LOG.CREATED_BY
  is '创建人';
comment on column CBP_JOB_EXECUTE_LOG.CREATED_DATE
  is '创建时间';
comment on column CBP_JOB_EXECUTE_LOG.UPDATED_BY
  is '修改人';
comment on column CBP_JOB_EXECUTE_LOG.UPDATED_DATE
  is '修改时间';
  
-- Create/Recreate primary, unique and foreign key constraints 
create unique index IDX_CBP_JOB_EXECUTE_LOG on CBP_JOB_EXECUTE_LOG(ID_CBP_JOB_EXECUTE_LOG);
alter table CBP_JOB_EXECUTE_LOG add constraint PK_CBP_JOB_EXECUTE_LOG_KEY primary key (ID_CBP_JOB_EXECUTE_LOG);
