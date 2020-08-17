SET NAMES UTF8;
DROP DATABASE IF EXISTS sq;
CREATE DATABASE sq CHARSET=UTF8;
USE sq;  

/**用户信息**/
CREATE TABLE sq_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32) NOT NULL,
    upwd VARCHAR(32),
    email VARCHAR(64),
    phone VARCHAR(16),
    avatar VARCHAR(128),/**头像**/
    user_name VARCHAR(32),
    gender TINYINT /**0-女 1-男**/
);

INSERT INTO sq_user VALUES
(NULL,'963852741','9ae2be73b58b565bce3e47493a56e26a','dang@qq.com','13556451436','img/avatar/','dangdang',1),
(NULL,'123456789','25f9e794323b453885f5181f1b624d0b','dang@qq.com','13556451436','img/avatar/','dangdang',1);


/**商品分类表**/
CREATE TABLE sq_product_family(
    fid INT UNIQUE,
    fname VARCHAR(32),         /**类别名称**/
    fimg VARCHAR(256),
    addr VARCHAR(32)
);

INSERT INTO sq_product_family VALUES
(10,'路亚竿',"http://localhost:3000/img/smimg/liebei1.png",'/product/路亚竿'),
(20,'筏竿',"http://localhost:3000/img/smimg/liebei2.png",'/product/筏竿'),
(30,'台钓竿',"http://localhost:3000/img/smimg/liebei3.png",'/product/台钓竿');


/**轮播图**/
CREATE TABLE sq_banner(
 bid INT PRIMARY KEY AUTO_INCREMENT,
 img VARCHAR(256)
);

INSERT INTO sq_banner VALUES(NULL,"http://localhost:3000/img/banner1.png"),
(NULL,"http://localhost:3000/img/banner2.png"),
(NULL,"http://localhost:3000/img/banner3.png"),
(NULL,"http://localhost:3000/img/banner4.png"),
(null,"http://localhost:3000/img/banner5.png");





/**商品**/
CREATE TABLE sq_product(
    pid INT,
    fid INT, #所属分类
    brand CHAR(16),		#品牌
    title VARCHAR(128), #商品主标题
    price VARCHAR(12),  #价格
    spec VARCHAR(64),     #规格 
    stock INT, 		#库存
    isindex BOOLEAN,	#是否首页
    img VARCHAR(255),
    dimg text(255)   #详细图片
);

INSERT INTO sq_product VALUES
(1001,10,'七彩鸿','希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','¥800.00','C662ML|S662ML',100,1,'http://localhost:3000/img/product/1001.png|http://localhost:3000/img/product/10012.png|http://localhost:3000/img/product/10013.png|http://localhost:3000/img/product/10014.png|http://localhost:3000/img/product/1001.png','http://localhost:3000/img/pro/10011.png|http://localhost:3000/img/pro/10012.png|http://localhost:3000/img/pro/10013.png|http://localhost:3000/img/pro/10014.png|http://localhost:3000/img/pro/10015.png|http://localhost:3000/img/pro/10016.png|http://localhost:3000/img/pro/10017.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
-- (1001,10,'七彩鸿','希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','¥800.00','S662ML',100,0,'http://localhost:3000/img/product/1001.png|http://localhost:3000/img/product/10012.png',''),
-- (1001,10,'七彩鸿','希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','¥850.00','C702M',100,0,'http://localhost:3000/img/product/1001.png|http://localhost:3000/img/product/10012.png',''),
-- (1001,10,'七彩鸿','希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','¥850.00','S702M',100,0,'http://localhost:3000/img/product/1001.png|http://localhost:3000/img/product/10012.png',''),
-- (1001,10,'七彩鸿','希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','¥900.00','C752MH',100,0,'http://localhost:3000/img/product/1001.png|http://localhost:3000/img/product/10012.png',''),
(1002,10,'鸬鹚','希克斯 路亚竿 鸬鹚 FUJI配置 黄金樟木手柄','¥995.00','S602UL|C602UL',100,1,'http://localhost:3000/img/product/1002.png|http://localhost:3000/img/product/10022.png|http://localhost:3000/img/product/10023.png|http://localhost:3000/img/product/10024.png|http://localhost:3000/img/product/10025.png','http://localhost:3000/img/pro/10021.png|http://localhost:3000/img/pro/10022.png|http://localhost:3000/img/pro/10023.png|http://localhost:3000/img/pro/10024.png|http://localhost:3000/img/pro/10025.png|http://localhost:3000/img/pro/10026.png|http://localhost:3000/img/pro/10027.png|http://localhost:3000/img/pro/10028.png|http://localhost:3000/img/pro/10029.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
-- (1002,10,'鸬鹚','希克斯 路亚竿 鸬鹚 FUJI配置 黄金樟木手柄','¥995.00','C602UL',100,0,'http://localhost:3000/img/product/1002.png|http://localhost:3000/img/product/10022.png',''),
-- (1002,10,'鸬鹚','希克斯 路亚竿 鸬鹚 FUJI配置 黄金樟木手柄','¥970.00','S562UL',100,0,'http://localhost:3000/img/product/1002.png|http://localhost:3000/img/product/10022.png',''),
-- (1002,10,'鸬鹚','希克斯 路亚竿 鸬鹚 FUJI配置 黄金樟木手柄','¥970.00','C562UL',100,0,'http://localhost:3000/img/product/1002.png|http://localhost:3000/img/product/10022.png',''),
-- (1002,10,'鸬鹚','希克斯 路亚竿 鸬鹚 FUJI配置 黄金樟木手柄','¥970.00','S473UL',100,0,'http://localhost:3000/img/product/1002.png|http://localhost:3000/img/product/10022.png',''),
(1003,10,'鱼虎','希克斯 路亚竿 鱼虎 UL超软微物竿','¥475.00','S562UL 1.68',100,1,'http://localhost:3000/img/product/1003.png|http://localhost:3000/img/product/10032.png|http://localhost:3000/img/product/10033.png|http://localhost:3000/img/product/10034.png|http://localhost:3000/img/product/10035.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(1004,10,'雷强一本半','希克斯 路亚竿 雷强一本半 FUJI配置 2.19米','¥850.00','73MH FUJI',100,1,'http://localhost:3000/img/product/1004.png|http://localhost:3000/img/product/10042.png|http://localhost:3000/img/product/10043.png|http://localhost:3000/img/product/10044.png|http://localhost:3000/img/product/10045.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(1005,10,'EXP','希克斯 路亚竿 EXP 富士配件 1.98米 2.13米','¥700.00','S702M',100,1,'http://localhost:3000/img/product/1005.png|http://localhost:3000/img/product/10052.png|http://localhost:3000/img/product/10053.png|http://localhost:3000/img/product/10054.png|http://localhost:3000/img/product/10055.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(1006,10,'金戟','希克斯 路亚竿 金戟 1.8米 1.95米 2.10米 2.40米','¥250.00','240MHS',100,1,'http://localhost:3000/img/product/1006.png|http://localhost:3000/img/product/10062.png|http://localhost:3000/img/product/10063.png|http://localhost:3000/img/product/10064.png|http://localhost:3000/img/product/10065.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(1007,10,'鱼虎','希克斯 路亚竿 溪隼 马口竿','¥375.00','S562UL FUJI',100,1,'http://localhost:3000/img/product/1007.png|http://localhost:3000/img/product/10072.png|http://localhost:3000/img/product/10073.png|http://localhost:3000/img/product/10074.png|http://localhost:3000/img/product/10075.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),

(2001,20,'戟筏','希克斯 筏竿 戟 双稍软尾筏竿 1.2米','¥300.00','120',100,1,'http://localhost:3000/img/product/2001.png|http://localhost:3000/img/product/20012.png|http://localhost:3000/img/product/20013.png|http://localhost:3000/img/product/20014.png|http://localhost:3000/img/product/20015.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2002,20,'攻击','希克斯 筏竿 攻击 远投软尾 超高感度','¥475.00','180',120,1,'http://localhost:3000/img/product/2002.png|http://localhost:3000/img/product/20022.png|http://localhost:3000/img/product/20023.png|http://localhost:3000/img/product/20024.png|http://localhost:3000/img/product/20025.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2003,20,'P10','希克斯 筏竿 P10 FUJI导环 灵敏双稍 轻硬挺直','¥545.00','120CM',120,1,'http://localhost:3000/img/product/2003.png|http://localhost:3000/img/product/20032.png|http://localhost:3000/img/product/20033.png|http://localhost:3000/img/product/20034.png|http://localhost:3000/img/product/20035.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2004,20,'传奇','希克斯 传奇 1.35米 双稍软尾筏竿','¥320.00','135',120,1,'http://localhost:3000/img/product/2004.png|http://localhost:3000/img/product/20042.png|http://localhost:3000/img/product/20043.png|http://localhost:3000/img/product/20044.png|http://localhost:3000/img/product/20045.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2005,20,'007二代','双全希克斯 007二代 90cm 100cm 双稍软尾筏竿 富士配件','¥680.00','100',3199,1,'http://localhost:3000/img/product/2005.png|http://localhost:3000/img/product/20052.png|http://localhost:3000/img/product/20053.png|http://localhost:3000/img/product/20054.png|http://localhost:3000/img/product/20055.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2006,20,'刀锋','希克斯 筏竿 刀锋 双稍软尾 富士配件 1.2米','¥700.00','120CM',120,1,'http://localhost:3000/img/product/2006.png|http://localhost:3000/img/product/20062.png|http://localhost:3000/img/product/20063.png|http://localhost:3000/img/product/20064.png|http://localhost:3000/img/product/20065.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2007,20,'青之空','希克斯 筏竿 青之空 双稍软尾筏竿 1.1米 1.2米','¥325.00','120CM',120,1,'http://localhost:3000/img/product/2007.png|http://localhost:3000/img/product/20072.png|http://localhost:3000/img/product/20073.png|http://localhost:3000/img/product/20074.png|http://localhost:3000/img/product/20075.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(2008,20,'X6','希克斯 筏竿 X6 双稍软尾筏竿 1.5米','¥800.00','150',120,1,'http://localhost:3000/img/product/2008.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
-- (2002,20,'攻击','希克斯 筏竿 攻击 远投软尾 超高感度','¥450.00','150',120,0,'http://localhost:3000/img/product/2002.png|http://localhost:3000/img/product/20022.png',''),
(3001,30,'X6','青云峰28调台钓竿','¥410.00','150',1287,1,'http://localhost:3000/img/product/3001.png|http://localhost:3000/img/product/30012.png|http://localhost:3000/img/product/30013.png|http://localhost:3000/img/product/30014.png','http://localhost:3000/img/pro/30011.png|http://localhost:3000/img/pro/30012.png|http://localhost:3000/img/pro/30013.png|http://localhost:3000/img/pro/30014.png|http://localhost:3000/img/pro/30015.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3002,30,'p9','水之鲫台钓竿','¥462.00','100',752,1,'http://localhost:3000/img/product/3002.png|http://localhost:3000/img/product/30022.png|http://localhost:3000/img/product/30023.png|http://localhost:3000/img/product/30024.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3003,30,'LPS','双峰极40T高碳台钓竿','¥1260.00','75',1422,1,'http://localhost:3000/img/product/3003.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3004,30,'EXP','善若水高档台钓竿','¥1034.00','720MS',120,1,'http://localhost:3000/img/product/3004.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3005,30,'X6','神雕鲤竞技台钓竿','¥1162.00','JKL',120,1,'http://localhost:3000/img/product/3005.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3006,30,'LPS','善战超硬战斗竿台钓竿','¥638.00','552',120,1,'http://localhost:3000/img/product/3006.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3007,30,'P9','悍马超轻超硬台钓竿','¥870.00','1022',120,1,'http://localhost:3000/img/product/3007.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png'),
(3008,30,'刀伐','卧虎藏龙溪流竿','¥108','199',1282,1,'http://localhost:3000/img/product/3008.png|http://localhost:3000/img/product/20082.png|http://localhost:3000/img/product/20083.png|http://localhost:3000/img/product/20084.png|http://localhost:3000/img/product/20085.png','http://localhost:3000/img/pro/10031.png|http://localhost:3000/img/pro/10032.png|http://localhost:3000/img/pro/10033.png|http://localhost:3000/img/pro/10034.png|http://localhost:3000/img/pro/10035.png|http://localhost:3000/img/pro/10036.png|http://localhost:3000/img/pro/10037.png|http://localhost:3000/img/pro/1.png|http://localhost:3000/img/pro/2.png');



/**推荐商品**/
CREATE TABLE sq_product_anli(
     pid INT PRIMARY KEY AUTO_INCREMENT,
     title VARCHAR(128), 
     img VARCHAR(255),
     day VARCHAR(64)
);

INSERT INTO sq_product_anli VALUES(NULL,'希克斯 筏竿 戟 双稍软尾筏竿 1.2米','http://localhost:3000/img/product/2001.png','08-09'),
(NULL,'希克斯 筏竿 攻击 远投软尾 超高感度','http://localhost:3000/img/product/2002.png','08-09'),
(NULL,'双全希克斯 007二代 90cm 100cm 双稍软尾筏竿 富士配件','http://localhost:3000/img/product/2005.png','07-15'),
(NULL,'希克斯 路亚竿 鸿 全富士配置 SIC导环 七彩电镀涂装 1.98米/2.13米/2.28米','http://localhost:3000/img/product/1001.png','05-24'),
(NULL,'希克斯 路亚竿 鱼虎 UL超软微物竿','http://localhost:3000/img/product/1001.png','10-07'),
(NULL,'希克斯 路亚竿 溪隼 马口竿','http://localhost:3000/img/product/1001.png','04-11'),
(NULL,'希克斯 路亚竿 金戟 1.8米 1.95米 2.10米 2.40米','http://localhost:3000/img/product/1001.png','06-12'),
(NULL,'希克斯 路亚竿 双飞 高碳远投 1.89米 1.98米','http://localhost:3000/img/product/1001.png','11-15'),
(NULL,'希克斯 锚竿 Surf 4204/4504 锚鱼利器 4节便携竿','http://localhost:3000/img/product/1001.png','12-28'),
(NULL,'青云峰28调台钓竿','http://localhost:3000/img/product/1001.png','03-22');





#select sq_product_family.fid,sq_product.spec from sq_product  join sq_product_family  on  sq_product_family.fid = sq_product.fid;


/**商品图片**/



/**收货地址**/
CREATE TABLE sq_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机
  fixedphone VARCHAR(16),     #固定电话
  postcode CHAR(6),           #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN          #是否为当前用户的默认收货地址
)
