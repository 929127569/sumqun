<template>
    <div id="index">
        <div class="carouse">
    <!--vue-awesome-swiper 文档copy-->
            <swiper ref="mySwiper" :options="swiperOptions" class="swiper">
                <swiper-slide v-for="(i,k) in imgList" :key="k">
                <img :src="i.img" alt="">
            </swiper-slide>
            <div class="swiper-pagination" slot="pagination"></div>
            </swiper>
        </div>
        <!-- 首页商品 -->
        <div id="F1" class="floor">
            <div id="F1_T" class="floortitle">
                 <div v-if="title.length > 0"><img :src="title[0].fimg" alt="">{{title[0].fname}}</div>
                 
                 <div class="floortitle_0"><span>专区</span></div>
                 <div><a href="javascript:;">更多></a></div>
                
            </div>
            <div id="F1_main">

            </div>
        </div>
    </div>
</template>

<script>
// import 'swiper/css/swiper.css' // 组件引入
import 'swiper/swiper-bundle.css'//1111
import 'swiper/swiper-bundle.js'
// import 'swiper/swiper-bundle.cjs'
import { swiper, swiperSlide } from 'vue-awesome-swiper'  // 组件样式
export default{
    data(){
        return{
            title:[],
            imgList:[],
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
                console.log( res.data)
            })
        }
    },
    mounted(){
        // this.Get()
        this.getBannerList()
        this.gettitle()
    }


}

</script>

<style>
.floor{margin-bottom: 10px;}
.floortitle{width: 1200px;color: #1F76C0;
    font-size: 24px;
    line-height: 46px;
    
    }
/* .floortitle img{width: 100%;height: 100%;} */
.floor::after{content: '';display: block;height: 0 ;clear: both;visibility: hidden;border: 2px solid #3890D2;}
/* #F1_T>div:last-child{width: 990px;} */
.floortitle>div{
    float: left;
}
.floortitle>div:last-child{float:right;}
img{
    width: 100%;
}
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

/*轮播图 */
  .carouse{
    width: 100%;
    border:1px solid red;
    margin-bottom: 12px;
  }
  /*样式穿透*/
  .swiper >>> .swiper-pagination-bullet{
    background-color:blue;
  }
</style>