· `创建数据库`:    -- Active: 1683973826757@@127.0.0.1@3306@nickname  
```
    -- CREATE DATABASE youkedadb;
```
· `创建表格`:       
```
    -- CREATE TABLE  `user`()
    CREATE TABLE `user`(
    `id` INT(10)NOT NULL,
    `mobile` VARCHAR(11) NOT NULL,
    `nickname` VARCHAR(40) NOT NULL,
    `gmt_created` datetime ,
    `gmt_modified` datetime NOT NULL,
    PRIMARY KEY ( `id` )
    )ENGINE=InnoDB DEFAULT CHARSET=utf8;
```
· `创建字段`:      
```
    `id` INT(10)NOT NULL,
    `mobile` VARCHAR(11) NOT NULL,
    `nickname` VARCHAR(40) NOT NULL,
    `gmt_created` datetime ,
    `gmt_modified` datetime NOT NULL,
```  
· `删除表格`:       
```
    drop table table_name; //删除表格不可逆，务必慎重

    DROP TABLE IF EXISTS table_name;  //IF EXISTS 意思是如果存在
```  
· `插入语句(INSERT)语法`:      
```
    INSERT INTO table_name(field1,field2,...fieldN)
    VALUES
    (value1,value2,...valueN);

    INSERT INTO
      `user` (`id`, `mobile`, `nickname`, `gmt_created`)
    VALUES
      (1, '13426069530', '叶冰', now());

//插入语句简化：主键设置为自增，则可以不插入主键和对应的数据；如果插入的是所有字段，可以省略字段名，直接插入值，但是类型必须全部一致。  这两种境况不能同时简化      
    INSERT INTO table_name
    VALUES
    (value1,value2,...valueN);

//批量插入：插入一条数据对应表格中的一行，应当规定NOT NULL的字段没有给到值时，插入语句会报错  
    INSERT INTO table_name
    VALUES
    (value1,value2,...valueN),
    (value1,value2,...valueN);
```

· `查询（SELECT）语法`:    
```
    SELECT field1,field2,.... FROM table_name;//从指定表中查询指定列的信息

    SELECT id,hero_name 
    FROM  timi_adc;
```
· `WHERE子句语法`:    
```
    SELECT * FROM table_name WHERE condition;

    SELECT *
    FROM   timi_adc
    where  win_rate > 0.5;
```

· `Limit子句语法`:一般配合分页使用      
```
    SELECT * FROM table_name LIMIT parameter参数;  //parameter是Limit语句的
//查询第x-y行
    SELECT  *
    FROM  timi_adc
    LIMIT 5, 6;             //查询第（6，7，8，9，10，11）行；第一个参数表示从第6行开始查，第二个参数表示一共查询6条记录
//查询第0-x行：
    ELECT  *
    FROM  timi_adc
    LIMIT 5;                //查询第（0，1，2，3，4，）行
    等价于  SELECT * FROM timi_adc LIMIT 0,5;
//查询第x行
    ELECT  *
    FROM  timi_adc
    LIMIT 4,1;              //查询第（5）行
//和WHERE子句联合使用
    ELECT  *
    FROM  timi_adc
    WHERE win_rate >= 0.5
    LIMIT 5;                //查询timi_adc表中胜率大于50%的前五条数据
```

· `排序（ORDER BY子句）语法:默认正排序，关键词ASC(一般不行)    
```
    SELECT * FROM table_name ORDER BY field_name;

    SELECT  *
    FROM  timi_adc
    ORDER BY  win_rate;     //查询所有射手胜率（低——>高）
//DESC关键词使排序变为逆排序
    SELECT  *
    FROM  timi_adc
    ORDER BY  win_rate  DESC;//查询所有射手胜率逆排序（高——>低）
//和其他子句连用
    SELECT  *
    FROM  timi_adc
    ORDER BY  win_rate  DESC
    LIMIT 3;                //查询胜率最高的三个射手，一般先排序，再加LIMIT
```

· `更新(UPDATE)/删除(DELETE)语法`:     
```
//UPDATE语句:必须加入WHERE限定条件，否则UPDATE语句会对整列起作用
    UPDATE 表名称 SET 列名称 = 新值 WHERE 列名称 = 某值
    
    UPDATE   timi_adc
    SET   ban_rate = 0.01
    WHERE   hero_name = '艾琳';//把艾琳英雄的ban胜率改为1%
//DELETE语句:删除语句是不可恢复的，务必要怎加WHERE语句，否则删除整张表格的数据
//DELETE语句只删除表中的数据;删除表格则：DROP TABLE + 表明的语句
    DELETE FROM table_name [WHERE Clause]

    delete from timi_adc where id=4;//删除timi_adc表中id为4的行
    delete from `timi_adc` where id<20;/删除timi_adc表中所有id小于20的数据
    delete from timi_adc;     //删除timi_adc表中的所有数据
```

· `LIKE查询 语法`:      
```
    SELECT * FROM table_name WHERE condition LIKE condition;
```
1. `%` 百分号符号        
```
    //% 在SQL LIKE子句中，用%字符表示任意字符，如果没有使用任何%，LIKE相当与"="
    //搜索timi_adc表中名字带孙的射手
        SELECT  *
        FROM    timi_adc
        WHERE   hero_name LIKE '%孙%';
    //'%孙%'==>字符串含孙;'孙%'==>字符串首字符为孙;'%孙'==>字符串以孙结尾
```
2. `_` 下划线符号       
```
    SELECT  *
    FROM  timi_adc
    WHERE  hero_name LIKE '_尚香';
// _尚香和%尚香区别:假如有一个人叫  公孙尚香 ，前者查询不到，后者可以
```

· `AND&OR 语法`: AND求交，OR求并            
```
    SELECT * FROM table_name WHERE conditionA AND/OR condtionB;
//查询timi_adc表中胜率为 50%~51% 或者胜率低于 47% 的英雄
    SELECT  *
    FROM   timi_adc
    WHERE  
        win_rate > 0.5
        AND win_rate < 0.51
        OR win_rate < 0.47;
//有时候需要加上 () 括号来分割条件，如下可以查询到5条数据
    SELECT  *
    FROM  timi_adc
    WHERE  
     (
        win_rate > 0.5
        OR win_rate < 0.47
      )
      AND win_rate < 0.51;
//如下这样写，可以查到9条数据
    SELECT  *
    FROM  timi_adc
    WHERE
      win_rate > 0.5
      OR (
        win_rate < 0.47
        AND win_rate < 0.51
      );
```

· `IN/NOT IN/NOT LIKE 语法`:         
```
    SELECT * FROM table_name WHERE column IN (condtionA,condtionB);
//查询timi_adc表中热度为T0和T3的英雄
    SELECT  *
    FROM  timi_adc
    WHERE  fever IN ('T0', 'T3');
//等价于
    SELECT  *
    FROM  timi_adc
    WHERE
      fever = 'T0'
      OR fever = 'T3';

//NOT IN/NOT LIKE （NOT相当于否定条件）
//查询timi_adc表中热度T0以外的英雄
    SELECT  *
    FROM  timi_adc
    WHERE  fever NOT IN ('T0');
//查询所有名字里不带孙的英雄
    SELECT  *
    FROM  timi_adc
    WHERE  hero_name NOT LIKE '%孙%';
```
· `NULL值的处理`:空置不占用存储空间  NULL占用存储空间           
1. IS NULL:当列的值是NULL时，这个运算符返回true     
2. IS NOT NULL:当列的值是NULL时，这个运算符返回false        
3. <=>:比较操作符，当比较的两个值都为NULL时或者相等时，返回true     
· `NULL语法`:       
![student表](https://github.com/NicknamePetName/Photo/blob/main/MySQL/studentTable.png?raw=true) 
```
//不可以使用=NULL  !=NULL来查找NULL值， NULL = NULL 会返回 NULL

    SELECT field_name1,field_name2
    FROM table_name
    WHERE field_name2 IS NOT NULL/IS NULL;
//查询student表id,mobile,其中mobile不为NULL的数据
    SELECT  id,mobile
    FROM  student
    WHERE  mobile IS NOT NULL;//查询到id为2,4,6,7,9符合mobile不为NULL
//查询student表id,name,grade,并且grade为NULL的数据
    SELECT  id,name,grade
    FROM  student
    WHERE  grade IS NULL;//查询得到id为5，6，9符合
```