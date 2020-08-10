<template>
    
    <div id="shopcar">
        <div class="carbox">
            <div class="carhead">
                <h1>我的购物车</h1>
                <div>
                    <ul>
                        <li class="select">
                            <span>1</span>
                            放进购物车
                        </li>
                        <li>
                            <span>2</span>
                            填写订单信息
                        </li>
                        <li>
                            <span>3</span>
                            支付/确定订单
                        </li>
                    </ul>
                </div>
            </div>
            <table>
                <tbody>
                    <tr>
                        <th style="width:48px" align="center">
                            <a href="">全选</a>
                        </th>
                        <th colspan="2" >商品信息</th>
                        <th width="84">单价</th>
                        <th width='104'>数量</th>
                        <th width='104'>金额(元)</th>
                        <th width='54'>操作</th>
                    </tr>
                    <tr>
                        <td><input type="radio"></td>
                        <td>
                            <a href="javascript:;"><img src="" alt=""></a>
                        </td>
                        <td>
                            <a href="">这是title</a>
                            <p>x6:150</p>
                        </td>
                        <td>$410.00</td>
                        <td>
                            <my-counter></my-counter>
                        </td>
                        <td>
                            <span>
                                ￥<label>410.00</label>
                            </span>
                        </td>
                        <td>
                            <a href="javascript:;">删除</a>
                        </td>
                    </tr>
                    <tr>
                        <th colspan="8" align="right">
                            已选择商品 <span>n</span> 件&nbsp;&nbsp;&nbsp;
                            商品总金额(不含运费): <span>￥0</span>
                            元
                        </th>
                    </tr>
                </tbody>    
            </table>
            <div class="carfoot">
                <div class="left">
                    <a href="javascript:;">全选</a>
                    <a href="javascript:;">清空购物车</a>
                </div>
                <div class="right">
                    <button>继续购物</button>
                    <button>立即结算</button>
                </div>
            </div>
        </div>
    </div>
</template>

<style scoped>
.right button:last-child{
    background: #52A152 !important;
    border: 1px solid #417F41 !important;
    text-shadow: 0 -1px 0 #52A152;
}
.right button{
    background: #1e7bb3;
    border: 1px solid #02598E;
    border-radius: 2px;
    vertical-align: middle;
    display: inline-block;
    margin: 0;
    padding: 0 25px;
    font-size: 12px;
    height: 38px;
    line-height: 38px;
    text-align: center;
    cursor: pointer;
    overflow: visible;
    color: #FFF !important;
    margin-right: 4px;
}
.right{
    float:right;
}
a{
    text-decoration: none;
    color: #000;
    outline: none;
}
.left a{
    margin-right: 20px;
    font-size: 14px;
    
}
.left{
    line-height: 40px;
}
.carfoot{
    margin-top: 20px;
    height: 40px;
}
.carbox tr span{
    color: red;
}
#shopcar{
    border-top: 2px solid #378AD0;
}
.carbox tr td{
    padding: 1em 0.5em;
    color: #555;
    font-size: 13px;
    border-bottom: 1px solid #f7f7f7;
}
.carbox tr th{
    padding: 0.8em 0.5em;
    color: #555;
    font-size: 13px;
    font-weight: 400;
    background: #f6f6f6;
    border-bottom: 1px solid #f7f7f7;
}
tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}
tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}
table{
    width: 100%;
    border: 1px solid #f7f7f7;
    margin-top:90px;
}
.carhead ul li:last-child{
    background-image: none;
}
.select{
    color: #5AB7EA;
}
.carhead ul li{
    float: left;
    width: 33.33%;
    height: 35px;
    line-height: 35px;
    text-align: center;
    background: url('../assets/cart-arrow.gif') no-repeat right -45px #f6f6f6;
    color: #999;
}
.carhead div{
    position: relative;
    margin-left: 200px;
}
.carhead h1{
    float: left;
    color: #555;
    font-size: 18px;
    line-height: 35px;
    font-style: normal;
    font-weight: 400;
    outline: none;
}
.carhead{
    position: relative;
    margin-top:30px ;
}
@media screen and (min-width: 1181px) {
    .carbox{width: 1180px;}
}
.carbox{
    position: relative;
    margin: 0 auto;
    padding: 0;
    width: 1180px;
    min-width: 941px;
    max-width: 1180px;
    text-align: left;
    overflow: hidden;
}
div{display: block;}
*{margin: 0;padding: 0;}
</style>