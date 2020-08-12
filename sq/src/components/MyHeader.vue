<template>
    <div id="header">
        <div id="top">
            <div id="logo">
                <router-link to="/">
                    <img src="/logo .png" alt="">
                </router-link>
            </div>
            <div id="serach" class="serach">
               <input  class="keywords" placeholder="输入回车搜索" v-model="kw"  @keyup.13="search">
               <button class="btn" @click="search">搜索</button> 
               <!-- <input type="submit"> -->
               <!-- <span>111</span> -->
            </div>
            <div id="status" class="status" v-if="!this.$store.state.isLogin">
                <router-link to="/login">
                    <img src="/hy.png" alt=""><br>
                    <span>登录</span>
                </router-link>
            </div>
            <div class="status" v-else>
                <router-link to="javascript:;">
                    <img src="/hy.png" alt=""><br>
                    <span>会员中心</span>
                </router-link>
            </div>
            <div id="cart">
                <router-link to="/shopcar">
                    <img src="/gwc.png" alt=""><br>
                    <span>购物车</span>
                </router-link>
                
            </div>
        </div>
        <div id="nav">
            <a href="/index">商城首页</a>
            <router-link :to="i.addr" v-for="(i,k) in Title" :key="k">{{i.fname}}</router-link>
            <a href="javascript:;">联系我们</a>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            // n:'',
            Title:[],
            keywords:'',
            timer:null,
            kw:'',

        }
    },
    methods:{
        getTitle(){
            this.axios.get('/index/title').then(res=>{
                // console.log("title请求成功");
                this.Title=res.data
            })
        },
        search(){
            clearTimeout(this.timer);
            this.timer=setTimeout(()=>{
                if(this.kw.trim()!==""){
                    // console.log(`查询${this.keywords}相关的东西`);
                    this.$router.push("/product/"+this.kw);
                }
            },1000)
            
            // if(this.cansend==true){
            //     if(this.keywords.trim()!==""){
            //         console.log(`查询${this.keywords}相关的东西`);
            //         setTimeout(()=>{
            //             console.log('查询完成')
            //             this.cansend=false;
            //         },1000);
            //     }
            // }
        }
    },
    created(){
        // this.kw=this.$route.params.kw;
    },
    mounted(){
        this.getTitle()
    },
    watch:{
        $route(){
            this.kw=this.$route.params.kw
        }
    }
}
</script>

<style>
div{
    display:block;
    margin: 0 auto;
}
#top>div{
    float: left;
}
#top{
    /* margin: 0 auto; */
    width: 1200px;
    padding-top: 20px;
    
}
#serach{
    width: 480px;
    height: 37px;
    background: url(/ss.jpg) center no-repeat ;
    margin-top: 23px;
    margin-left: 100px;
    margin-right: 30px;
}
.status{
    width: 50px;
    margin: 15px 20px;
}
#cart{
    widows: 50px;
    margin: 15px 10px;
}

.status a,#cart a{
    color: #1296D8;
    font-size: 12px;
    width: 50px;
    text-align: center;
    display:inline-block;
    font-weight: 600;
    outline: none;
    text-decoration: none;

}
.keywords{
    border: none;
    background: none;
    outline: none;
    color: #378AD0;
    line-height: 33px;
    height: 37px;
    width: 170px;
    padding: 0 !important;
    font-size: 14px;
    float: left;
    margin-left: 14px;
    margin-right: 6px;
    letter-spacing: 1px;
    width: 345px;
}
.btn{
    width: 99px;
    height: 37px;
    float: right;
    text-indent: -9999px;
    cursor: pointer;
    border: none;
    background: none;
    outline: none;
}
#nav{
    width: 1200px;
    height: 50px;
    margin-top: 15px;
    overflow: hidden;
    padding-bottom: 0;
}
#nav>a{
    
    color: #1e94cb;
    display: inline-block;
    margin:0 45px;
    font-size: 22px;
    text-align: center;
    line-height: 52px;
    font-weight: 500;
    text-decoration: none;

}
</style>