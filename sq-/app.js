const express=require('express');
//引入路由器
const indexRouter=require('./router/index.js');
const productRouter=require('./router/product.js');
const userRouter=require('./router/user.js');

const bodyParser=require('body-parser');
const app=express();
const cors=require('cors');
app.listen(3000);
app.use( express.static('public') );

app.use( bodyParser.urlencoded({
    extended:false
  }) );

app.use(cors({
	origin:['http://127.0.0.1:8080','http://localhost:8080']
}))

app.use('/index',indexRouter);
app.use('/pro',productRouter);
app.use('/user',userRouter);
