<template>
    <div id="login-box">
        <img :src="img.img" alt="">
        <div class="login">
            <h1>会员登录</h1>
            <ul>
                <li>
                    <label>用户名：</label>
                    <input type="text" placeholder="用户名/手机/邮箱" v-model="uname" @blur.capture="checkuname">
                </li>
                <li>
                   <label>密码：</label> 
                   <input type="text" placeholder="输入登录密码" v-model="upwd">
                </li>
            </ul>
            <input type="submit" value="登录" class="btn-submit" @click="Login">
            <div class="check"> <label> <input type="checkbox">记住登录</label> <a href="javascript:;">忘记密码</a> </div> <br>
            <div class="loginbottom"> <h3> 还没注册？ <router-link :to="`/register`"> 点击注册</router-link> </h3> </div>
        </div>
    </div>
</template>

<script>

export default {
    data(){
        return{
            img:[],
            uname:'',
            upwd:'',
        }
    },
    methods:{
        getimg(){
            this.axios.get('/index/banner')
             .then(res=>{
             console.log(res.data)
             this.img = res.data[3]
             console.log(this.img)
            })
        },
        checkuname(){
            let uname=this.uname;
            let unameRegExp = /^[0-9A-Za-z_]{6,12}$/;
            if(uname==''||!unameRegExp.test(uname)){
                alert('请输入合法用户名');
                return false;
            }else{
                return true;
            }
        },
        Login(){
            if(this.checkuname()){
                this.axios.post('/user/login','uname='+this.uname+'&upwd='+this.upwd).then(res=>{
                    console.log(res.data);
                   if(res.data.code==1){
                        this.$router.push('/')
                        }else{
                            alert("对不起 用户名或密码错误");
                        }
                })
            }
        }
    },
    mounted(){
        this.getimg()
    }
}
</script>

<style>
.loginbottom h3 a{color: #1e7bb3;text-decoration: none;outline: none;}
.loginbottom{clear:both;padding-top: 20px;}
.loginbottom h3{
    display: block;
    margin-bottom: 10px;
    color: #555;
    font-size: 14px;
    line-height: 30px;
    height: 30px;
    font-weight: normal;
}

.check >label{
    float: left;
}
.check>a{
    display:block;
    float:right;
}
.check::after{
    content: '';
    overflow: hidden;
    visibility: hidden;
    clear: both;
}
.btn-submit{
    display: block;
    padding: 10px 20px;
    width: 100%;
    color: #fff;
    font-size: 14px;
    line-height: 20px;
    border: 0;
    background: #1e7bb3;
    text-align: center;
    border-radius: 3px;
    cursor: pointer;
    margin-bottom:20px;
    /* padding-bottom: 10px; */
}
.login h1{
    margin-bottom: 20px;
    color: #555;
    font-size: 22px;
    font-weight: 700;
    letter-spacing: 3px;
    line-height: 30px;
    height: 30px;
    text-align: center;
}
.login{
    float: right;
    margin: 62px auto;
    padding: 20px;
    width: 300px;
    text-align: left;
    border: 1px solid #e5e5e5;
    border-radius: 3px;
    background: #fff;
}
.login ul>li{
    list-style: none;
    position: relative;
    clear: both;
    margin-bottom: 10px;
    height: 50px; 
    font-size: 14px;
}
.login ul>li input{
    display: block;
    margin: 0;
    padding: 10px 10px 10px 80px;
    width: 208px;
    height: 20px;
    line-height: 20px;
    border: 1px solid #e8e8e8;
    background: #fbfcff;
    color: #333;
    font-size: 14px;
    border-radius: 3px;
}
.login ul>li label{
    position: absolute;
    top: 1px;
    left: 10px;
    width: 68px;
    height: 40px;
    line-height: 40px;
    color: #999;
    font-size: 14px;
    cursor: default;
}
#login-box{position: relative;}
#login-box>div{
    width: 300px;
    /* height: 200px; */
    position:absolute;
    top:5px;
    right: 80px;
}
</style>