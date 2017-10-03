--接口处理日志表
create table public.cbp_interface_process_log
(
  id_interface_process_log  varchar(32) default sys_guid() not null,
  business_no               varchar(100),
  sys_id                    varchar(20),
  trx_type                  varchar(50),
  trx_date                  timestamp not null,
  error_code                varchar(60),
  error_msg                 text,
  data_info                 text,
  created_by                varchar(100) default 'system' not null,
  created_date              timestamp default current_timestamp not null,
  updated_by                varchar(100) default 'system' not null,
  updated_date              timestamp default current_timestamp not null
);

--表和字段添加注释 
comment on table public.cbp_interface_process_log is '接口处理日志表';
comment on column public.cbp_interface_process_log.id_interface_process_log is '接口处理日志表主键';
comment on column public.cbp_interface_process_log.business_no is '业务主键';
comment on column public.cbp_interface_process_log.sys_id is '数据来源';
comment on column public.cbp_interface_process_log.trx_type is '接口交易类型';
comment on column public.cbp_interface_process_log.trx_date is '交易时间';
comment on column public.cbp_interface_process_log.error_code is '错误代码';
comment on column public.cbp_interface_process_log.error_msg is '错误信息';
comment on column public.cbp_interface_process_log.data_info is '数据信息';
comment on column public.cbp_interface_process_log.created_by is '创建人';
comment on column public.cbp_interface_process_log.created_date is '创建时间';
comment on column public.cbp_interface_process_log.updated_by is '修改人';
comment on column public.cbp_interface_process_log.updated_date is '修改时间';

--索引
create unique index idx_cbp_interface_process_log_id on cbp_interface_process_log(id_interface_process_log);
alter table public.cbp_interface_process_log add constraint PK_CBP_INTERFACE_PROCESS_LOG primary key(id_interface_process_log);

--授权
GRANT ALL ON TABLE cbp_interface_process_log TO yxdcbpdata;
grant select on cbp_interface_process_log to r_yxdcbpdata_qry;
grant select,insert,update,delete on cbp_interface_process_log to r_yxdcbpdata_dml;
--grant select on cbp_interface_process_log to r_yxdcbpdata_dev_qry;
 