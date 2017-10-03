--工作执行队列参数表
create table public.cbp_work_executor_define (
    id_work_executor_define   varchar(32) default sys_guid() not null,
    work_executor_name        varchar(32),
    nthreads                  int,
    core_pool_size            int,
    maximum_pool_size         int,
    maximum_work_queue_size   int,
    system_name               varchar(20),
    created_by                varchar(100) default 'system' not null,
    created_date              timestamp default current_timestamp not null,
    updated_by                varchar(100) default 'system' not null,
    updated_date              timestamp default current_timestamp not null
);

--表和字段添加注释
comment on table public.cbp_work_executor_define is '工作执行队列参数表';
comment on column public.cbp_work_executor_define.id_work_executor_define is '执行队列名';
comment on column public.cbp_work_executor_define.work_executor_name is '执行队列名';
comment on column public.cbp_work_executor_define.nthreads is '固定线程数（最小和最大线程数相同）';
comment on column public.cbp_work_executor_define.core_pool_size is '最小线程数';
comment on column public.cbp_work_executor_define.maximum_pool_size is '最大线程数';
comment on column public.cbp_work_executor_define.maximum_work_queue_size is '最大队列长度（-1为无界队列，0为无队列，正数为有界队列）';
comment on column public.cbp_work_executor_define.system_name is '系统名';
comment on column public.cbp_work_executor_define.created_by is '创建人';
comment on column public.cbp_work_executor_define.created_date is '创建时间';
comment on column public.cbp_work_executor_define.updated_by is '修改人';
comment on column public.cbp_work_executor_define.updated_date is '修改时间';

--索引
create unique index idx_work_executor_define_id on cbp_work_executor_define(id_work_executor_define);
alter table public.cbp_work_executor_define add constraint PK_CBP_WORK_EXECUTOR_DEFINE primary key(id_work_executor_define);

--授权
GRANT ALL ON TABLE cbp_work_executor_define TO yxdcbpdata;
grant select on cbp_work_executor_define to r_yxdcbpdata_qry;
grant select,insert,update,delete on cbp_work_executor_define to r_yxdcbpdata_dml;
--grant select on cbp_work_executor_define to r_yxdcbpdata_dev_qry; 