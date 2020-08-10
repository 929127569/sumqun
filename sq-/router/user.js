const express=require('express');
//引入连接池模块
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();


router.post('/registercheck',(req,res)=>{
    let username=req.body.username;
    
    pool.query('SELECT COUNT(uid) AS count FROM sq_user WHERE uname=?',[username],(err,results)=>{
        if(err)throw err;
        if(results[0].count){
            res.send({message:'账户已存在',code:0});
        }else{
            res.send({message:'成功',code:1})
        }
    })//select uname from sq_user where uname=?

})

router.post('/userregister',(req,res)=>{
    let uname=req.body.username;
    let upwd=req.body.password;
    let phone=req.body.phone;
    let email=req.body.email;
    pool.query('SELECT COUNT(uid) AS count FROM sq_user WHERE uname=?',[uname],(err,results)=>{
        if(err)throw err;
        if(results[0].count){
            res.send({message:'账户已存在',code:0});
        }else{
            pool.query('INSERT sq_user(uname,upwd,email,phone) values(?,MD5(?),?,?)',[uname,upwd,phone,email],(err,results)=>{
                if (err) throw err;
                res.send({message:'成功',code:1,results:results});
            })
        }
    })
})

router.post('/login',(req,res)=>{
    let uname=req.body.uname;
    let upwd=req.body.upwd;
    let sql='select uid,uname,upwd from sq_user where uname=? and upwd=MD5(?)';
    pool.query(sql,[uname,upwd],(err,results)=>{
        if(err)throw err;
        if(results.length==1){
			res.send({message:'成功',code:1,})
		}else{
			res.send({message:'失败',code:0})
		}
    })
})


module.exports=router;