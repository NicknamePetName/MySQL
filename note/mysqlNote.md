1. 英文小写字母来约定表名   
2. pay_record 用下划线分隔字符  
3. 表名，字段名都小写，数据库操纵语句大写  

4. 主键：PRIMARY KEY  ('id')  作用:标识数据    
· 主键是一个特殊字段  
· 表格可以没有主键，但是最多只能拥有一个主键  
· 主键的值不能为 `NULL`,必须有对应的值  
· 主键的值必须是 `绝对唯一` 的  
· 一般使用主键和其他表进行关联   

5. SQL常用数据类型  
· VARCHAR    : 可变的长字符串，可以类比于Java中的String类型  
· INT        : 整型，和Java中的int类型一致  最大值2147483647 长度为10位    
· DOUBLE     : 浮点型,和Java中的double类型一致，一般不加长度限制  
· DATETIME   : 时间类型，长度为0，格式为YYYY-MM-DD HH:MM:SS,值为2023-5-13 18:17:05  
· BIGINT     : 长整型，和Java中的long类型一致  

6. 数据 CRUD(增查删改)  
· CREATE     : 创建         HTTP : POST   
· INSERT     : 插入         HTTP : POST   
· READ       : 读取         HTTP : GET   
· SELECT     : 查询         HTTP : GET   
· UPDATE     : 更新         HTTP : POST    
· DELETE     : 删除         HTTP : DELETE   

7. 格式：字段名 + 数据类型 + 长度 + 是否为NULL  
8. `id` INT UNSIGNED AUTO_INCREMENT  //INT类型的主键，id会从1开始自增。第二个为2……    UNSIGNED 是指无符号的，排除了负数，但数据库默认是从1开始累计，所以可省略    
9. 设置数据库引擎和编码方式: ENGINE=InnoDB DEFAULT CHARSET=utf8   

