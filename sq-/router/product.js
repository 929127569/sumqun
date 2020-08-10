const express=require('express');
const pool=require('../pool.js');
//console.log(pool);
//创建路由器对象
const router=express.Router();

router.get('/banner',(req,res)=>{
    pool.query('select img from sq_banner',(err,result)=>{
        if(err) throw err;
		// console.log(result);
        res.send(result);
    })
})

//  router.get('/productlist',(req,res)=>{
//     // console.log(req);
//     let kw=req.query.ptype;
//     console.log(kw);
//     pool.query("select * from sq_product where title like '%"+kw+"%'",[kw],(err,results)=>{
// 		if(err) throw err;
//         // console.log(results);
//         console.log(results)
// 		res.send({message:'商品查询成功',code:1,results:results})
// 	})
// })
 

router.get('/productlist',(req,res)=>{
	let kw=req.query.kw;
	let page=req.query.page;
	let offset=(page-1)*4;
	let sql="select COUNT(pid) AS count FROM sq_product WHERE title like '%"+kw+"%'";
	pool.query(sql,[kw],(err,results)=>{
		if(err) throw err;
		console.log(results[0].count);
		let rowCount=results[0].count;
		//声明变量存储每页显示的记录数
		let pagesize=4;
		//声明变量存储计算出来的总页数
		let pagecount=Math.ceil(rowCount/pagesize);
		// sql='select id,subject,description,image from xzqa_article  where category_id=?  LIMIT '+offset+','+pagesize;
		let sql=`select * from sq_product where title like '%${kw}%' or fid like '%${kw}%' LIMIT ${offset},${pagesize}`;
		pool.query(sql,[kw],(err,results)=>{
		if(err) throw err;
        // console.log(results);
        console.log(results)
		res.send({message:'商品查询成功',code:1,results:results,pagecount:pagecount})
	});
	})
})

router.get('/goods',(req,res)=>{
	let pid=req.query.pid;
	let sql='select * from sq_product where pid=?';
	pool.query(sql,[pid],(err,results)=>{
		if(err)throw err;
		res.send({message:'商品查询成功',code:1,results:results})
	})
})

router.get('/anli',(req,res)=>{
	// console.log('anli')
	pool.query('select img,title,day from sq_product_anli',(err,results)=>{
		if(err)throw err;
		console.log('安利');
		res.send({message:'商品查询成功',code:1,results:results})
	})
})

module.exports=router;