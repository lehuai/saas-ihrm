/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2019/11/13 14:38:35                          */
/*==============================================================*/


drop table if exists COMMON_COLUMN;

drop table if exists company;

drop table if exists department;

drop table if exists permission;

drop table if exists permission_api;

drop table if exists permission_button;

drop table if exists permission_menu;

drop table if exists role;

drop table if exists role_permission;

drop table if exists user;

drop table if exists user_role;

/*==============================================================*/
/* Table: COMMON_COLUMN                                         */
/*==============================================================*/
create table COMMON_COLUMN
(
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��'
);

/*==============================================================*/
/* Table: company                                               */
/*==============================================================*/
create table company
(
   id                   varchar(40) not null comment 'ID',
   name                 varchar(255) comment '��˾����',
   balance              decimal comment '��ǰ���',
   audit_state          varchar(255) comment '���״̬',
   industry             varchar(255) comment '������ҵ',
   company_size         varchar(255) comment '��˾��ģ',
   mailbox              varchar(255) comment '����',
   company_phone        varchar(255) comment '��˾�绰',
   legal_representative varchar(255) comment '���˴���',
   business_license_id  varchar(255) comment 'Ӫҵִ��-ͼƬID',
   company_address      varchar(255) comment '��˾��ַ',
   company_area         varchar(255) comment '��˾����',
   expiration_date      datetime comment '����ʱ��',
   remarks              text comment '��ע',
   renewal_date         datetime comment '����ʱ��',
   version              varchar(255) comment '��ǰ�汾',
   manager_id           varchar(255) comment '��ҵ��¼�˺�ID',
   state                varchar(2) comment '״̬',
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��',
   primary key (id)
);

alter table company comment '��ҵ��Ϣ';

/*==============================================================*/
/* Table: department                                            */
/*==============================================================*/
create table department
(
   id                   varchar(40) not null comment 'ID',
   parent_id            varchar(40) comment '����ID',
   company_id           varchar(40) comment '��ҵID',
   code                 varchar(255) comment '���ű���',
   name                 varchar(255) comment '��������',
   manager_id           varchar(255) comment '������ID',
   manager_name         varchar(255) comment '����������',
   introduce            text comment '����',
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��',
   primary key (id)
);

alter table department comment '����';

/*==============================================================*/
/* Table: permission                                            */
/*==============================================================*/
create table permission
(
   id                   varchar(40) not null comment 'ID',
   company_id           varchar(40) comment '��ҵID',
   name                 varchar(255) comment 'Ȩ������',
   code                 varchar(255) comment 'Ȩ�ޱ�ʶ',
   type                 varchar(2) comment 'Ȩ������: 1Ϊ�˵� 2Ϊ���� 3ΪAPI',
   description          varchar(255) comment 'Ȩ������',
   en_visible           varchar(2) comment '�ɼ�״̬: 0 ���ɼ� 1 �ɼ�',
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��',
   primary key (id)
);

alter table permission comment 'Ȩ��';

/*==============================================================*/
/* Table: permission_api                                        */
/*==============================================================*/
create table permission_api
(
   id                   varchar(40) not null comment 'ID',
   permission_id        varchar(40) comment 'Ȩ��ID',
   api_url              varchar(255) comment '����',
   api_method           varchar(20) comment '��������',
   api_level            varchar(2) comment 'Ȩ�޵ȼ���1Ϊͨ�ýӿ�Ȩ�ޣ�2Ϊ��У��ӿ�Ȩ��',
   primary key (id)
);

alter table permission_api comment 'API�ӿ�Ȩ��';

/*==============================================================*/
/* Table: permission_button                                     */
/*==============================================================*/
create table permission_button
(
   id                   varchar(40) not null comment 'ID',
   permission_id        varchar(40) comment 'Ȩ��ID',
   icon                 varchar(255) comment 'ͼ��',
   primary key (id)
);

alter table permission_button comment '��ťȨ��';

/*==============================================================*/
/* Table: permission_menu                                       */
/*==============================================================*/
create table permission_menu
(
   id                   varchar(40) not null comment 'ID',
   permission_id        varchar(40) comment 'Ȩ��ID',
   icon                 varchar(255) comment 'ͼ��',
   uri                  varchar(255) comment '��ַ',
   order_no             int comment '�����',
   primary key (id)
);

alter table permission_menu comment '�˵�Ȩ��';

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   varchar(40) not null comment 'ID',
   company_id           varchar(40) comment '��ҵid',
   description          varchar(255) comment '˵��',
   name                 varchar(255) comment '��ɫ��',
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��',
   primary key (id)
);

alter table role comment '��ɫ';

/*==============================================================*/
/* Table: role_permission                                       */
/*==============================================================*/
create table role_permission
(
   role_id              varchar(40) not null comment '��ɫID',
   permission_id        varchar(40) not null comment 'Ȩ��ID',
   primary key (permission_id, role_id)
);

alter table role_permission comment '��ɫȨ��';

/*==============================================================*/
/* Table: user                                                  */
/*==============================================================*/
create table user
(
   id                   varchar(40) not null comment 'ID',
   work_number          varchar(255) comment '����',
   company_id           varchar(40) comment '��ҵID',
   department_id        varchar(255) comment '����ID',
   username             varchar(255) comment '�û�����',
   password             varchar(255) comment '����',
   mobile               varchar(255) comment '�ֻ�����',
   time_of_entry        datetime comment '��ְʱ��',
   form_of_employment   varchar(255) comment 'Ƹ����ʽ',
   form_of_management   varchar(255) comment '������ʽ',
   working_city         varchar(255) comment '��������',
   correction_time      datetime comment 'ת��ʱ��',
   in_service_status    varchar(2) comment '��ְ״̬ 1����ְ  2����ְ',
   enable_state         varchar(2) comment '����״̬ 0������  1������',
   create_id            varchar(40) comment '������ID',
   create_name          varchar(40) comment '����������',
   create_time          datetime comment '����ʱ��',
   update_id            varchar(40) comment '������ID',
   update_name          varchar(40) comment '����������',
   update_time          datetime comment '����ʱ��',
   is_deleted           tinyint comment 'ɾ����� 0������ 1��ɾ��',
   primary key (id)
);

alter table user comment '�û�';

/*==============================================================*/
/* Table: user_role                                             */
/*==============================================================*/
create table user_role
(
   user_id              varchar(40) not null comment '�û�ID',
   role_id              varchar(40) not null comment '��ɫID',
   primary key (user_id, role_id)
);

alter table user_role comment '�û���ɫ';

