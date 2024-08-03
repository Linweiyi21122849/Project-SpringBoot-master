create database if not exists oj_database;

use oj_database;

drop table if exists oj_table;
create table oj_table(
     id int primary key auto_increment comment '题目的id，自增主键',
     title varchar(50) not null comment '题目的标题',
     level varchar(20) comment  '题目的难度',
     description varchar(4096) comment '题目描述',
     template varchar(20) comment '初始模板',
     testCode varchar(20) comment '测试用例',
     type varchar(20) comment '题目的类型,填空题，选择题，或简答题',
     answer varchar(4096) comment '编程题目的参考答案',
     itemA varchar(50) comment '当type==选择题,选项A的描述',
     itemB varchar(50) comment '当type==选择题,选项B的描述',
     itemC varchar(50) comment '当type==选择题,选项C的描述',
     itemD varchar(50) comment '当type==选择题,选项D的描述'
);

#重新设计用户表
drop table if exists user;
create table user(
     id int primary key auto_increment comment '用户id',
     username varchar(20) not null unique comment '用户名',
     password  varchar(4096) comment '用户密码',
     isAdmin int default 0 comment '是否是管理员用户',
     salt varchar(1024) comment '盐值',
     email varchar(50) unique comment '邮箱用于找回个人密码'
);

#重新设计用户作答表
drop table if exists vis;
create table vis (
     user_id int comment '用户id，引用自用户表',
     qno int comment '题目序号，引用自题目表',
     state varchar(50) comment '作答状态，1表示正确作答完成，2表示尝试过但做错，3表示尚未作答',
     primary key (user_id, qno),
     foreign key (user_id) references user(id),
     foreign key (qno) references oj_table(id)
);
