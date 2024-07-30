# 下面的sql语句用于 插入数据库中的具体信息

use oj_database;

# 设置题目的信息
insert into oj_table (title, level, description, type, answer) VALUES
('两数之和','简单','1+1=?',1,'2'),
('三数之和','简单','1+1+1=?',1,'3'),
('二次函数的图像与性质', '中等', '已知二次函数 f(x) = ax^2 + bx + c (a≠0) 的图像与 x 轴有两个交点，求函数的顶点坐标和对称轴方程。', 1, '顶点坐标为(-b/2a, c - b^2/4a)，对称轴方程为x = -b/2a。'),
('抛物线的标准方程', '中等', '求过点 (3, 2) 且焦点在 x 轴上的抛物线的标准方程。', 1, '抛物线的标准方程为 (x - 3)^2 = 8(y - 2)。'),
('椭圆的标准方程', '中等', '求中心在原点、焦点在 x 轴上的椭圆的标准方程，其长轴长为10，短轴长为8。', 2, '椭圆的标准方程为 x^2/25 + y^2/16 = 1。'),
('复数的模与辐角', '中等', '求复数 z = 3 + 4i 的模和辐角。', 1, '模为5，辐角为 arctan(4/3)。'),
('导数的定义与计算', '中等', '求函数 f(x) = x^3 - 3x^2 + 2 的导数，并求导数为0时的 x 值。', 3, 'f\'(x) = 3x^2 - 6x，导数为0时的x值为0或2。');

# 设置一个管理员账户
#默认密码是 123456，盐值为 abcdefg
insert into user(username,password,isAdmin,salt) VALUES
('admin','87AD2B76937B34C58891913DED4C6DAC',1,'abcdefg');

# 插入一些用户作答记录
INSERT INTO vis (user_id, qno, state) VALUES
(1, 1, 1),
(1, 2, 2),
(1, 3, 3),
(1, 4, 1),
(1, 5, 3);
