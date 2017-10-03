--接口处理日志表
create table cbp_interface_process_log
(
  id_interface_process_log  varchar2(32) default sys_guid() not null,
  business_no               varchar2(100),
  sys_id                    varchar2(20),
  trx_type                  varchar2(50),
  trx_date                  date not null,
  error_code                varchar2(60),
  error_msg                 clob,
  data_info                 clob,
  created_by                varchar2(100) default 'system' not null,
  created_date              date default sysdate not null,
  updated_by                varchar2(100) default 'system' not null,
  updated_date              date default sysdate not null
);

--表和字段添加注释 
comment on table cbp_interface_process_log is '接口处理日志表';
comment on column cbp_interface_process_log.id_interface_process_log is '接口处理日志表主键';
comment on column cbp_interface_process_log.business_no is '业务主键';
comment on column cbp_interface_process_log.sys_id is '数据来源';
comment on column cbp_interface_process_log.trx_type is '接口交易类型';
comment on column cbp_interface_process_log.trx_date is '交易时间';
comment on column cbp_interface_process_log.error_code is '错误代码';
comment on column cbp_interface_process_log.error_msg is '错误信息';
comment on column cbp_interface_process_log.data_info is '数据信息';
comment on column cbp_interface_process_log.created_by is '创建人';
comment on column cbp_interface_process_log.created_date is '创建时间';
comment on column cbp_interface_process_log.updated_by is '修改人';
comment on column cbp_interface_process_log.updated_date is '修改时间';

--索引
create unique index idx_interface_process_log_id on cbp_interface_process_log(id_interface_process_log);
alter table cbp_interface_process_log add constraint PK_CBP_INTERFACE_PROCESS_LOG primary key(id_interface_process_log);
