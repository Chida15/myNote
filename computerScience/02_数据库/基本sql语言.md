## 基本sql语言

### 查询

#### 概述

| SELECT [All\|DISTINCT] <目标列表达式> [,<目标列表达式>]... |
| ---------------------------------------- |
| FROM <表名或视图名> [,<表名或视图名>...]\|(<SELECT 语句)[AS] <列名> |
| [WHERE <条件表达式>]                          |
| [GROUP BY <列名1> [HAVING <条件表达式>]]        |
| [ORDER BY <列名2> [ASC \| DESC]];          |

#### 1. 单表查询

##### 1.1 选择列的方式

| 查询部分列                          | 查询全部列                  | 查询经过计算的值                             |
| ------------------------------ | ---------------------- | ------------------------------------ |
| SELECT Sno,Sname FROM Student; | SELECT * FROM Student; | SELECT Sname,2014-Sage FROM Student; |

##### 1.2 重复元祖

SELECT DISTINCT Sno FROM SC;    //去除重复元祖，不加默认显示

##### 1.3 满足条件的查询

| 查询条件 | 谓词                                | 实例                               |
| ---- | --------------------------------- | -------------------------------- |
| 比较   | =，>，<，>=，<=，!=，<>，!>，!<，NOT+前面运算符 | 略                                |
| 范围   | BETWEEN AND，NOT BETWEEN AND       | WHERE Sage BETWEEN 20 AND 23;    |
| 集合   | IN，NOT IN                         | WHERE Sdept IN ('CS','MA','IS'); |
| 字符匹配 | LIKE，NOT LIKE                     | WHERE Sname LIKE '刘%';           |
| 空值   | IS NULL，IS NOT NULL               | 略                                |
| 多重条件 | AND，OR，NOT                        | WHERE Sdept='CS' AND Sage<20;    |

##### 1.4 排序

ORHER BY Grade ASC(默认) | DESC(降序)

##### 1.5 聚集函数

| 类别                            | 说明        | 例子                                       |
| ----------------------------- | --------- | ---------------------------------------- |
| COUNT(*)                      | 统计元祖个数    | SELECT COUNT(*) FROM Student;            |
| COUNT([DISTINCT \| ALL] <列名>) | 统计一列中值的个数 | SELECT COUNT(DISTINCT Sno) FROM SC;      |
| SUM([DISTINCT \| ALL] <列名>)   | 计算一列值的和   | 略                                        |
| AVG([DISTINCT \| ALL] <列名>)   | 计算一列值的平均数 | SELECT AVG(Grade) FROM SC WHERE Cno='1'; |
| MAX([DISTINCT \| ALL] <列名>)   | 计算...最大值  | 略                                        |
| MIN([DISTINCT \| ALL] <列名>)   | ......最小值 | 略                                        |

##### 1.6 分组

| 按照某一属性分组结果                               | 按照属性分组后使用聚集函数                            |
| ---------------------------------------- | ---------------------------------------- |
| SELECT Cno,COUNT(Sno) FROM SC GROUP BY Cno; | SELECT Sno FROM SC GROUP BY Sno HAVING  COUNT(*) >3; |

#### 2. 多表查询

##### 2.1 不同表查询

例子：

SELECT Student.\*,SC.* FROM Student,SC WHERE Student.Sno=SC.Sno;

##### 2.2 同表查询

例子：

SELECT FIRST.Cno,SECOND.Cpno

FROM Course FIRST,Course SECOND

WHERE FIRST.Cpno= SECOND.Cno;

**利用别名规避重名**

#### 3. 嵌套查询

##### 3.1 IN(不相关子查询)

SELECT Sno,Sname,Sdept

FROM Student

WHERE Sdept IN (SELECT Sdept FROM Student WHERE Sname='刘晨');

**查询和刘晨同一系的学生信息**

##### 3.2 比较子查询(返回单个值)

SELECT Sno,Cno

FROM SC x

WHERE Grade>=(SELECT AVG(Grade) FROM SC y WHERE y.Sno=x.Sno);

**找出每个同学超过自己平均成绩的科目**

##### 3.3 比较子查询(多值比较)

符号：>ANY或>ALL同字面意思

SELECT Sname,Sage

FROM Student

WHERE Sage<ALL(SELECT Sage FROM Student WHERE Sdept='CS') AND Sdept<>'CS';

**查询非计算机系中比计算机系所有学生年龄小的学生**

##### 3.4 EXISTS谓词

SELECT Sname

FROM Student

WHERE EXISTS (SELECT * FROM SC WHERE Sno=Student.Sno AND Cno='1');

**查询选修了1号课程的学生姓名**

#### 4. 集合查询

| 操作类型         | 例子                                       | 说明             |
| ------------ | ---------------------------------------- | -------------- |
| 并操作UNION     | SELECT Sno FROM SC WHERE Cno='1' UNION SELECT Sno FROM SC WHERE Cno='2'; | 选修1或2号课程的学生    |
| 交操作INTERSECT | SELECT * FROM Student WHERE Sdept='CS' INTERSECT SELECT * FROM Student WHERE Sage<=19; | 计算机系年龄不大于19的学生 |
| 差操作EXCEPT    | SELECT * FROM Student WHERE Sdept='CS' EXCEPT SELECT * FROM Student WHERE Sage<=19; | 计算机系年龄大于19的学生  |

##### 5. 派生表

SELECT Sno,Cno

FROM SC,(SELECT Sno,AVG(Grade) FROM SC GROUP BY Sno) AS AVG_sc (avg_sno,avg_grade)

WHERE SC.Sno=AVG_sc.avg_sno AND SC.Grade>=AVG_sc.avg_grade;

**选出大于平均成绩的课程号**

### 数据更新

#### 1. 插入

##### 1.1 插入元祖

INSERT INTO 表名[(属性列1,....)] VALUES (<对应数据>,.....);

| 例子                                       | 说明           |
| ---------------------------------------- | ------------ |
| INSERT INTO Student(Sno,Sname,Ssex,Sdept,Sage) VALUES('201215126','张为民','男','CS',18); | 属性一一对应       |
| INSERT INTO Student VALUES('201215126','张为民','男',18,'CS'); | 必须和表定义属性一一对应 |

##### 1.2 插入子查询结果

INSERT INTO 表名[(属性列1,....)] 子查询;

例子：

INSERT INTO Dept_age(Sdept,Avg_age)

SELECT Sdept,AVG(Sage)

FROM Student

GROUP BY Sdept;

#### 2. 修改和删除

| 基本格式                                | 例子1                         | 例子2              |
| ----------------------------------- | --------------------------- | ---------------- |
| UPDATE <表名> SET 列名=表达式... WHERE 条件; | UPDATE Student SET Sage=22; | SET Sage=Sage+1; |
| DELETE FROM <表名> WHERE 条件;          | DELETE FROM SC;             | ......           |

### 视图

#### 1. 建立

| 基本格式                                     | 例子                                       | 说明                                       |
| ---------------------------------------- | ---------------------------------------- | ---------------------------------------- |
| CREATE VIEW <视图名> [(<列名>[,<列名>]...)] AS <子查询> [WITH CHECK OPTION] | CREATE VIEW IS_Student AS SELECT Sno,Sname,Sage FROM Student WHERE Sdept='IS'; | 之后插入、修改和删除操作时，系统会根据最后一句，决定加不加上Sdept='IS' |

#### 2. 删除

DROP VIEW <视图名> [CASCADE];