<template>
    <div>
        <div class="banner">
            <img :src="img.img" alt="">
        </div>
        <div class="pronav">
            <div >
                <a href="/index">首页</a>
                >产品搜索
            </div>
        </div>
        <div class="promain">
                <div class="pro">
                        <ul>
                            <li v-for="(pro,k) of products" :key="k" >
                                <router-link :to="`/details/${pro.pid}`">
                                    <img :src="pro.img.split(`|`)[0]" alt="">
                                    <div class="price">{{pro.price}}</div>
                                    <div class="title">{{pro.title}}</div>
                                </router-link>
                            </li> 
                        </ul>
                </div>    
        </div>
        <div class="page">
            <div class="page_box">
                    <ul>
                        <li>
                           <a href="javascript:;" @click="up">上一页</a> 
                        </li>
                        <li v-for="(i,k) of pagecount" :key="k">
                           <a href="javascript:;" v-text="i" @click="changpage(i)"></a> 
                        </li>
                        <li>
                            <a href="javascript:;" @click="down">下一页</a>
                        </li>   
                    </ul>
            </div>
        </div>
    </div>
    
</template>

<script>
export default {
    props:['kw'],
    data(){
        return{
            img:[],
            products:'',
            page:1,
            pagecount:'',
            
        }
    },
    methods:{

        getBannerList(){
            this.axios.get('/pro/banner').then(res=>{
                 this.img = res.data[4];
            //  console.log(res.data)
            })
        },

        //老版
        // getproduct(){
        //     console.log(this.kw)
        //     this.axios.get('/pro/productlist',{params:{ ptype:this.kw,}}).then(res=>{
        //         console.log(res.data.results);
        //         this.products=res.data.results;
        //     })
        // }

        getproduct(){
            this.axios.get('/pro/productlist?kw='+this.kw+'&page='+this.page).then(res=>{
                // console.log(res.data.pagecount);
                console.log(res.data.results);
                this.pagecount=res.data.pagecount;
                this.products=res.data.results;
                
            })
        },
        changpage(i){
            console.log(i);
            this.page=i;
            console.log(this.page);
            this.getproduct()
        },
        up(){
            if(this.page>1){
                this.page--;
                this.getproduct();
            }
        },
        down(){
            if(this.page<this.pagecount){
                this.page++;
                this.getproduct();
            }
        }

        // getimg(){
        //     this.axios.get('/product/banner').then(res=>{
        //         // this.img = res.data[0]
        //         console.log(res.data);
        //     })
        // }
    },
    created(){
        this.kw=this.$route.params.kw;
    },
    mounted(){
        this.getBannerList();
        this.getproduct();
        
    },
    watch:{
        $route(){this.kw=this.$route.params.kw},
        kw(){this.getproduct()},
    }

}
</script>

<style>
.page_box ul>li:last-child{
    border-right: 1px solid #E8E8E8;
}
.page_box ul>li>a{
    display: inline-block;
    border: 1px solid #E8E8E8;
    color: #3c3c3c;
    border-right: none;
    padding-left: 15px;
    padding-right: 15px;
    height: 30px;
    line-height: 30px;
    text-align: center;
    text-decoration: none;
}
.page_box ul>li{
    float: left;
}
.page_box{
    margin: 0 auto;
    display: inline-block;
    margin-top: 20px;
    }
.pro ul::after{content: '';display: block;height: 0 ;clear: both;visibility: hidden; }
.page{
    width: 100%;
    text-align: center;
    margin-top: 20px;
    margin-bottom:40px ;
}
.pro ul>li:hover .title{
    color: #389CFF;
}
.pro ul>li:hover{
    border: 1px solid #389CFF;
    box-shadow: 0 0 1px #389CFF;
    transition: all 0.2s;

}
.pro ul>li>a{
    text-decoration: none;
    outline: none;
}
.pro ul>li{
    width: 280px;
    height: 368px;
    float: left;
    margin: 10px;
    box-sizing: border-box;
    border: 1px solid #dfdfdf;
    overflow: hidden;
}
.pro img{
    width: 100%;
}
.promain{
    margin-top: 20px;
    width: 1200px ;
}
.pronav>div>a{
    float: left;
    text-decoration: none;
    outline: none;
    color: #56534E;
    font-size: 14px;
}
.pronav div{
    text-align: left;
    width: 1190px;
    height: 45px;
    line-height: 45px;
    color: #56534E;
}
.pronav{
    width: 100%;
    height: 45px;
    line-height: 45px;
    background: #f9f9f9;}
*{margin: 0;padding: 0;}
.banner{
    border-top: 2px solid #378ad0;
}

</style>