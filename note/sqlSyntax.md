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

    
