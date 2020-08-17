<template>
    <div id="index">
        <div class="carouse">
    <!--vue-awesome-swiper 文档copy-->
            <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
                <swiper-slide v-for="(i,k) in imgList.slice(0,4)" :key="k">
                <img :src="i.img" alt="">
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
            </swiper>
        </div>
        <!-- 首页商品 -->
        <!-- <div id="F1" class="floor">
            <div id="F1_T" class="floortitle">
                 <div v-if="title.length > 0"><img :src="title[0].fimg" alt="">{{title[0].fname}}</div>
                 
                 <div class="floortitle_0"><span>专区</span></div>
                 <div><a href="javascript:;">更多></a></div>
                
            </div>
            <div id="F1_main">

            </div>
        </div> -->
        <div id="main">
            <div class="floor">
                    <div class="floortitle" v-if="title.length>0">
                        <div><img :src="title[0].fimg" alt="">{{title[0].fname}}</div>
                        <div class="floortitle_0"><span>专区</span></div>
                        <div class="floor_a"> <router-link :to="`/product/路亚竿`">更多></router-link> </div>   
                        <!-- /details/${pro.pid} -->
                        <!-- <div class="clear"></div> -->
                    </div>
                    <div class="products">
                        <ul>
                            <li v-for="(pro,k) of products" :key="k" >
                                <router-link :to="`/details/${pro.pid}`">
                                    <img :src="pro.img.split(`|`)[0]" alt="">
                                    <div class="price">¥{{pro.price}}</div>
                                    <div class="title">{{pro.title}}</div>
                                </router-link>
                            </li> 
                        </ul>
                    </div>
            </div>
            <div class="floor">
                    <div class="floortitle" v-if="title.length>0">
                        <div><img :src="title[1].fimg" alt="">{{title[1].fname}}</div>
                        <div class="floortitle_0"><span>专区</span></div>
                        <div class="floor_a"><router-link :to="`/product/筏竿`">更多></router-link></div>
                        <!-- <div class="clear"></div> -->
                    </div>
                    <div class="products">
                        <ul>
                            <li v-for="(pro,k) of products2" :key="k" >
                                <router-link :to="`/details/${pro.pid}`">
                                    <img :src="pro.img.split(`|`)[0]" alt="">
                                    <div class="price">¥{{pro.price}}</div>
                                    <div class="title">{{pro.title}}</div>
                                </router-link>  
                            </li> 
                        </ul>
                    </div>
            </div>
            <div class="floor">
                    <div class="floortitle" v-if="title.length>0">
                        <div><img :src="title[2].fimg" alt="">{{title[2].fname}}</div>
                        <div class="floortitle_0"><span>专区</span></div>
                        <div class="floor_a"><router-link :to="`/product/台钓`">更多></router-link></div>
                        <!-- <div class="clear"></div> -->
                    </div>
                    <div class="products">
                        <ul>
                            <li v-for="(pro,k) of products3" :key="k" >
                                <router-link :to="`/details/${pro.pid}`">
                                    <img :src="pro.img.split(`|`)[0]" alt="">
                                    <div class="price">¥{{pro.price}}</div>
                                    <div class="title">{{pro.title}}</div>
                                </router-link>
                            </li> 
                        </ul>
                    </div>
            </div>
        </div>
    </div>
    
</template>

<script>
import 'swiper/css/swiper.css' // 组件引入
// import 'swiper/swiper-bundle.css'//1111
// import 'swiper/swiper-bundle.js'
// import 'swiper/swiper-bundle.cjs'
import { swiper, swiperSlide } from 'vue-awesome-swiper'  // 组件样式
export default{
    data(){
        return{
            title:[],
            imgList:[],
            products:[],
            products2:[],
            products3:[],
                swiperOptions: {
                    pagination: {
                         el: '.swiper-pagination'
                    },
                autoplay:{
                    delay:1000  // 1秒时长切换
                },
                loop: true
                }
        }
    },
    methods:{
        // Get(){
        //     this.axios.get('http://localhost:3000/user/index')
        //     .then(res=>{
        //         console.log('this is axios get ');
        //         console.log(res.data);
        //         this.n=res.data
        //     })
        // },
        getBannerList(){
      // 发请求 拿到 mockjs 模拟的 数据
            this.axios.get('/index/banner')
             .then(res=>{
            //  console.log(res.data)
             this.imgList = res.data
            })
        },
        gettitle(){
            this.axios.get('/index/title').then(res=>{
                this.title = res.data
                // console.log(this.title)
            })
        },
        getproduct(){
            this.axios.get('/index/indexproduct').then(res=>{
                // console.log(res.data);
                // this.products=res.data.results
                for(var i of res.data.results){
                    if(i.fid==10&i.isindex==1){
                        this.products.push(i);
                        // this.products.img
                        // console.log(this.products[0].img.split("|")[0])
                    }else if(i.fid==20&i.isindex==1){
                        this.products2.push(i);
                        // console.log(this.products2)
                    }else if(i.fid==30&i.isindex==1){
                        this.products3.push(i);
                        // console.log(this.products3)
                    }
                }
                // console.log(this.products)
                // if(res.data.results.fid)res.data.results[i].fid
                // console.log(this.products)
            })
        }
    },
    created(){this.gettitle()},
    mounted(){
        // this.Get()
        this.getBannerList()
        
        this.getproduct()
    }


}

</script>

<style>
a{
    text-decoration: none;
    outline: none;
}
.products ul>li:hover{
    border: 1px solid #389CFF;
    box-shadow: 0 0 1px #389CFF;
    transition: all 0.2s;

}
.title{font-size: 12px;color: #666;line-height: 23px;padding: 0 18px;text-align: left;}
.price{color: #F40;font-weight: 700;line-height: 26px;padding: 0 20px;font-size: 14px;text-align: left;}
.products ul>li{width: 280px;height: 368px;float: left;margin:10px;box-sizing: border-box;border: 1px solid #DFDFDF;}
.products img{width: 100%;}
.floor{margin-bottom: 10px;clear: both;}
#main{width: 1200px;color: #1F76C0;
    font-size: 24px;
    line-height: 46px;
    }
/* .floortitle img{width: 100%;height: 100%;} */
.floortitle{margin-bottom: 10px;width: 1180px;border-bottom: 2px solid #3a91D2;}
.floortitle::after{content: '';display: block;height: 0 ;clear: both;visibility: hidden; }
/* #F1_T>div:last-child{width: 990px;} */
.floortitle>div{
    float: left;
    /* width: 112px; */
    height: 46px;
    line-height: 46px;
    margin-right: 10px;
}
.floor_a>a{text-decoration: none;outline: none;font-size: 14px;color: #095F8A;padding-top: 15px;}
.floortitle>.floor_a{float:right;}
/* img{
    width: 100%;
} */
.floortitle_0{
    width: 82px;
    height: 36px;
    display: inline-block;
    line-height: 36px;
    font-size: 18px;
    color: #1F76C0;
    text-align: center;
    cursor: pointer;
    transform: skew(-22deg);
    background: #3890D2 !important;
}
.floortitle_0 span{
    color: #FFF !important;
    transform: skew(22deg);
    display: inline-block;
    height: 36px;
    line-height: 36px;
    padding-left: 21px;
    padding-right: 21px;
    text-align: center;
    cursor: pointer;
    font-size: 20px;
}
.clear{
    float: none;
    border:1.2px solid #3890d2;
    width: 100% !important;
    height: 0 !important;
    clear: both;
    overflow: hidden;   
    }

/*轮播图 */
  .carouse{
    width: 100%;
    /* border:1px solid red; */
    border-top: 2px solid #3890d2;
    margin-bottom: 12px;
  }
  /*样式穿透*/
  .swiper >>> .swiper-pagination-bullet{
    background-color:blue;
  }
</style>