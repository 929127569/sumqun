<template>
    <div id="details">
        <div class="banner">
            <img :src="banner.img" alt="">
        </div>
        <div class="pronav">
            <div >
                <a href="/index">首页</a>
                <span>{{goods.fid}}</span>
            </div>
        </div>
        <div id="goods">
            <div >
                <!-- //商品页左 -->
                <div id="left" >
                    <!-- 商品图片 -->
                    <div class="goodsimg">
                        <div class="imgbox">
                            <div class="show">
                                <!-- :src="pro.img.split(`|`)[0]" -->
                                <img :src="bigimg" alt="">
                            </div>
                            <div class="changeimg">
                                <a href="javacsript:;" @click="prov(g)">＜</a>
                                <div class="imglist">
                                    <ul>
                                        <li v-for="(index,g) of img" :key="g" @click="changeimg(index)"><img :src="index"  alt=""></li>
                                    </ul>
                                </div>
                                <a href="javacsript:;" @click="next(g)">＞</a>
                            </div>
                        </div>
                    </div>
                    <!-- 商品信息 -->
                    <div class="goodsdetails">
                        <h1>{{goods.title}}</h1>
                        <div class="pricebox">
                            <dl>
                                <dt>市场价</dt>
                                <dd><s>{{goods.price}}</s></dd>
                            </dl>
                            <dl>
                                <dt>销售价</dt>
                                <dd>{{goods.price}}</dd>
                            </dl>
                        </div>
                        <div class="specbox">
                            <dl>
                                <dt>{{goods.brand}}</dt>
                                <dd>
                                    <ul>
                                        <li v-for="(a,kind) of spec" :key="kind"> <input type="radio"><label>{{goods.spec}}</label> </li> 
                                         <!-- //class="{slecet:slecet}" @click="selecta" -->
                                    </ul>
                                </dd>
                            </dl>
                        </div>
                        <div class="specbox">
                            <dl>
                                <dt>购买数量</dt>
                                <dd>
                                    <div class="counter"> <my-counter></my-counter> </div>
                                    <span class="counter">库存{{goods.stock}}件</span>
                                </dd>
                            </dl>
                        </div>
                        <div class="buybtn">
                            <button class="buy">立即购买</button>
                            <button class="addcar">加入购物车</button>
                        </div>
                    </div>
                    <!-- <div class="line20"></div> -->
                    <!-- 商品详情图片 -->
                    <div class="goodstab" >
                        <div class="tabhead">
                            <span>商品介绍</span>
                        </div>
                        <div class="tabmain">
                            <p v-for="(i,k) of dimg" :key="k"><img :src="i" alt=""></p>
                            <!-- <p><img :src="goods.dimg.split('|')" alt=""></p> -->
                        </div>
                    </div>
                </div>
                <!-- 推荐商品 -->
                <div id="right">
                    <div><h3>推荐商品</h3></div>
                    <div class="anli">
                        <ul>
                            <li v-for="(i,k) of anli" :key="k">
                                <a href="javascript:;">
                                    <div class="anliimg">
                                      <img :src="i.img" alt="">  
                                    </div>
                                    <span>{{i.title}}</span>    
                                 </a>
                            </li>
                        </ul>
                    </div>
                    <div><h3>人气排行</h3></div>
                    <div class="anlilist">
                        <ul>
                            <li v-for="(i,k) of anlilist" :key="k">
                                <span class="text">{{i.day}}</span>
                                <i>{{k+1}}</i>
                                <a href="javascript:;">{{i.title}}</a>
                                
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    props:['pid'],
    data(){
        return{
            banner:[],
            goods:'',
            slecet:false,
            exitselect:true,
            dimg:[],
            spec:[],
            img:[],
            bigimg:'',
            anli:'',
            anlilist:[],
            
            
        }
    },
    methods:{
        getanli(){
            this.axios.get('/pro/anli').then(res=>{
                // console.log(res.data.results);
                this.anli=res.data.results.slice(0,4);
                // console.log(this.anli)
                this.anlilist=res.data.results;
            })
        },
        prov(g){
            console.log(g)
        },
        next(g){
            console.log(g)
        },
        changeimg(index){
            // this.goods.img.split('|')[0]=index;
            // console.log(steaa)
           this.bigimg=index
          
        },
        // selecta(){
        //     this.slecet=true;
        //     // this.exitselect=false;
        // },

        getBannerList(){
            this.axios.get('/pro/banner').then(res=>{
                 this.banner= res.data[4];
            //  console.log(res.data)
            })
        },
        getgoods(){
            this.axios.get('/pro/goods?pid='+this.pid).then(res=>{
                this.goods=res.data.results[0];
                this.dimg=res.data.results[0].dimg.split('|');
                this.img=res.data.results[0].img.split('|');
                this.bigimg=this.img[0]
                this.spec=res.data.results[0].spec.split('|');
                // console.log(this.dimg);
                // console.log(this.goods);
                // console.log(this.img)

            })
        }
    },
    mounted(){
        this.getBannerList();
        this.getgoods();
        // this.sleceta();
        this.getanli();
    },
    
}
</script>


<style scoped>

#right .anli ul li a{
    color: #888;
    font-size: 13px;
    cursor: pointer;
    text-decoration: none;
    outline: none;
}
#right .anli ul li{
    float: left;
    margin: 0 0 15px 15px;
}
#right .anli ul {
    margin: 0 0 0 -15px;
}
#right h3{
    display: block;
    margin-bottom: 10px;
    padding-bottom: 10px;
    line-height: 1em;
    color: #888;
    font-size: 18px;
    font-weight: 300;
    border-bottom: 1px solid #f0f0f0;
    margin-top: 30px;
}
 #right .anli ul li span{
    display: block;
    line-height: 30px;
    width: 98px;
    text-align: center;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
}
.anliimg img{
    min-width: 100%;
    min-height: 100%;
    width: 100%;
}
.anliimg{
    position: relative;
    display: block;
    margin: 0;
    padding: 1px;
    width: 94px;
    height: 94px;
    border: 1px solid #e8e8e8;
    overflow: hidden;
}
.anlilist ul li a{
    display: block;
    padding: 0;
    color: #888;
    font-size: 13px;
    text-overflow: ellipsis;
    white-space: nowrap;
    overflow: hidden;
    cursor: pointer;
    text-decoration: none;
    line-height: 20px;
    /* color: #000; */
    /* outline: none; */
}
.anlilist ul li:first-child i{
    top: 12px;
    background: #d60007 !important;
}
.anlilist ul li i{
    position: absolute;
    left: 0px;
    top: 12px;
    display: inline-block;
    vertical-align: -3px;
    width: 16px;
    height: 16px;
    margin-right: 10px;
    background: #1389d7;
    font-style: normal;
    color: #fff;
    font-size: 10px;
    /* font-family: Verdana, Geneva, sans-serif; */
    text-align: center;
    overflow: hidden;
    font-weight: 400;
    outline: none;
}
.anlilist ul li span{
    float: right;
    margin-left: 5px;
    color: #999;
    /* line-height: 0px; */
}
.anlilist ul li{
    position: relative;
    /* display: block; */
    padding: 10px 0 0 25px;
    height: 25px;
    vertical-align: top;
    list-style:none ;
    font-size: 14px;
}

.tabmain img{
    width: 100%;
}
.tabhead span{
    display: block;
    padding: 0 10px;
    width: 100px;
    height: 40px;
    line-height: 40px;
    color: #fff;
    font-size: 14px;
    background: #0089cd;
}
.tabhead{
    display: block;
    width: 939px;
    height: 40px;
    border: 1px solid #e8e8e8;
    background: #f7f7f7;
    overflow: hidden;
    /* float: left; */
}

.addcar{
    display: inline-block;
    padding: 0 30px;
    color: #fff;
    font-size: 16px;
    line-height: 38px;
    background: #f40;
    border: 1px solid #f40;
    border-radius: 2px;
    cursor: pointer;
    /* float: left; */
}
.buy{
    display: inline-block;
    margin-right: 10px;
    padding: 0 30px;
    color: #e5511d;
    font-size: 16px;
    line-height: 38px;
    background: #ffe4d0;
    border: 1px solid #f0cab6;
    border-radius: 2px;
    cursor: pointer;
    margin-left: -250px;
    /* float: left; */
}
.buybtn{
    position: relative;
    margin-top:15px;
}
.slecet{
    color: red;
    border: 1px solid red;
}
.exitselect{
    color: #666;
    border: 1px solid #eee;
}
.counter{
    display: block;
    float: left;
    margin-right:10px ;
    width: 120px;
}
.specbox dl dd li a{
    display: block;
    /* padding: 1px; */
    color: #666;
    min-width: 10px;
    width: auto !important;
    text-align: center;
    text-decoration: none;
    border: 1px solid #eee;
    cursor: pointer;
    white-space: nowrap;
    text-overflow: ellipsis;
    padding: 5px 9px;
    /* vertical-align: middle; */
}
.specbox dl dd li{
    position: relative;
    float: left;
    margin: 0 5px 8px 0;
    padding: 1px;
    line-height: 20px;
    vertical-align: middle;
}
.specbox dl dd{
    position: relative;
    padding: 5px;
    line-height: 26px;
    min-height: 26px;
    color: #6c6c6c;
}
.specbox dl dt{
    float: left;
    width: 80px;
    line-height: 38px;
    min-height: 38px;
    color: #999;
}
.specbox dl{
    clear: both;
    display: block;
}
.specbox{
    padding-top:10px ;
    border-top: 1px solid #efefef;
}
.pricebox dl dd{
    position: relative;
    padding: 5px 0;
    line-height: 26px;
    min-height: 26px;
    color: #6c6c6c;
    text-align: left;
}
.pricebox dl dt{
    float: left;
    width: 80px;
    line-height: 38px;
    min-height: 38px;
    color: #999;
}
.pricebox dl{
    clear: both;
    display: block;
}
.pricebox,.specbox{
    position: relative;
    margin-top: 10px;
}
.goodsdetails h1{
    display: block;
    color: #555;
    font-size: 18px;
    font-weight: 700;
    line-height: 2.4rem;
    text-align: left;
}
.imglist ul>li img{
    padding: 2px;
    border: 1px solid #e8e8e8;
    width: 56px;
    height: 56px;
}
.imglist ul>li{
    float: left;
    margin: 0;
    padding: 0;
    width: 67px;
    text-align: center;
}
.imglist ul{
    position: absolute;
    margin: 0;
    padding: 0;
    /* width: 999999px; */
    height: 100%;
}
.imglist{
    position: relative;
    float: left;
    width: 335px;
    height: 62px;
    overflow: hidden;
}
.changeimg a{
    float: left;
    display: block;
    /* font-family: "宋体"; */
    text-align: center;
    width: 10px;
    height: 60px;
    line-height: 60px;
    border: 1px solid #e8e8e8;
    background: #f7f7f7;
    cursor: pointer;
    text-decoration: none;
    font-weight: 400;
}
.changeimg{
    margin-top: 10px;
    width: 370px;
}
.show img{
    width: 368px;
    height: 368px;
}
.show{
    position: relative;
    width: 368px;
    height: 368px;
    border: 1px solid #e8e8e8;
}
.imgbox{
    float: left;
}
.line20{
    clear: both;
    height: 20px;
    overflow: hidden;
}
.goodsdetails{
    position: relative;
    margin: 30px 0 0 400px;
    overflow: hidden;
    /* height: 300px; */
}

.goodsimg{
    position: relative;
    float: left;
    margin-top: 30px;
    width: 370px;
    /* height: 20px; */
    }
div{display: block;}
*{margin: o;padding: 0;}
#goods{
    margin: 0 auto;
    width: 1200px;
    /* background: rgba(233, 236, 44, 0.3); */
    /* height: 300px; */
}
#left{
    width: 941px;
    float: left;
    /* background: rgba(48, 149, 216, 0.3); */
    /* height: 200px; */
}
#right{
    float: left;
    width: 211px;
    margin-left: 28px;
    text-align: left;
    /* background: rgba(233,0,233, 0.3); */
    /* height: 200px; */
}
</style>