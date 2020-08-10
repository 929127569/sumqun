<template>
    <div id="footer">
        <div id="footer-1">
            <div>
                <router-link to="/product/竿">全部产品</router-link>
                <b>|</b>
                <router-link to="/">商城首页</router-link>
                <b>|</b>
                <router-link to="/product/路亚">路亚竿专区</router-link>
                <b>|</b>
                <router-link to="/product/筏竿">筏竿专区</router-link>
                <b>|</b>
                <router-link to="/product/台钓">台钓竿专区</router-link>
                <b>|</b>
                <a href="javascript:;">联系我们</a>
            </div>
        </div>

        <div id="footer-2">
            <p>
                地址：中国 山东 威海市 经济技术开发区(威海震琳培训大厦附近)  联系电话:+86 0631 5978139 
                <a href="javascript:;">鲁ICP备15005350号-2 </a>
            </p>
        </div>
    </div>
</template>

<style>
#footer{margin-top: 60px;clear: both;}
#footer div:first-child{
    background-color: #28282E;
}
#footer>div>div{
    width: 1200px;
    height: 60px;
    line-height: 60px;
    color: #fff;
    text-align: left;
}
#footer a{
    color: #fff;
    text-decoration: none;
    outline: none;
    margin: 0 8px;
    font-size:14px ;
}

#footer a:hover{
    color: #00A9C6;
}
#footer-2{
    background-color: #2d2d33;
    height: 60px;
    margin: 0 auto;
}
#footer-2 p{
    margin: 0 auto;
    width: 1200px;
    line-height: 60px;
    text-align: left;
    color: #9b9b9b;
    font-size: 14px;
}
#footer-2 a{
    color: #000;
}
#footer-2 a:hover{
    color: #FFF;
}


</style>