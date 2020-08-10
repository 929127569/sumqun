const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();

router.get('/banner',(req,res)=>{
    pool.query('select img from sq_banner',(err,result)=>{
        if(err) throw err;
		// console.log(result)
            res.send(result);
        
    })
})

router.get('/title',(req,res)=>{
	pool.query('select fname,fimg,addr from sq_product_family',(err,result)=>{
		if(err) throw err;
		// console.log(result);
		res.send(result);
	})
})

router.get('/indexproduct',(req,res)=>{
	pool.query('select pid,fid,title,price,isindex,img from sq_product',(err,results)=>{
		if(err) throw err;
		// console.log(results);
		res.send({message:'商品查询成功',code:1,results:results})
	})
})


module.exports=router;