<template>
    <div class="reg">
        <div class="clearfix">
            <div class="regtitle">
                <h2>会员注册</h2>
            </div>
            <div class="regbox">
                <ul class="reglist">
                    <li>
                        <span>用户名：</span>
                        <div>
                           <input type="text" placeholder="输入登录用户名" class="input" v-model="username" @blur.capture="checkUsername">
                            <span class="spanmesg" :class="spanclass">{{namemesg}}</span> 
                        </div>
                    </li>
                    <li>
                        <span class="textspace">密&nbsp; 码：</span>
                        <div>
                            <input type="password" placeholder="输入登录密码" class="input" v-model="password"  @blur.capture="checkPassword">
                            <span class="spanmesg" :class=" passspan">{{passwordmesg}}</span>  
                            <!-- <div  class="img111"><img :src="passwordmesg" alt=""></div> -->
                        </div>
                    </li>
                    <li>
                        <span>确认密码：</span>
                        <div>
                            <input type="password" placeholder="输再次输入密码" class="input"  v-model="password2"  @blur.capture="checkPassword2">
                            <span class="spanmesg" :class=" passspan2">{{password2mesg}}</span>    
                        </div>
                    </li>
                    <li>
                        <span class="textspace">手&nbsp; 机：</span>
                        <div>
                            <input type="text" placeholder="输入手机号码" class="input" v-model="phone" @blur.capture="checkphone">
                            <span class="spanmesg" :class="phonespan">{{phonemesg}}</span>    
                        </div>
                    </li>
                    <li>
                        <span class="textspace">邮&nbsp; 箱：</span>
                        <div>
                            <input type="text" placeholder="输入邮箱账号" class="input" v-model="email" @blur.capture="checkemail">
                            <span class="spanmesg" :class="emailspan">{{emailmesg}}</span> 
                        </div>
                    </li>
                    <li>
                        <span>验证码：</span>
                        <div>
                            <input type="password" placeholder="输入验证码" class="inputcode">
                            <span></span>
                        </div>
                    </li>
                    <li class="checkbox">
                        <label>
                            <input type="checkbox" v-model="isAgreen">我已仔细阅读并接受 
                        </label>
                        <a href="">注册许可协议</a>
                    </li>
                    <li>
                        <input type="submit" value="立即注册" class="submit" @click="handle">
                        <!-- <button @click="handle">立即注册</button> -->
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script>
export default {
    data(){
        return{
            username:'',
            namemesg:'请输入登录的用户名',
            password:'',
            passwordmesg:'请输入6-20位的登录密码',
            password2:'',
            password2mesg:'请再次输入密码',
            phone:'',
            phonemesg:'请输入手机号码',
            email:'',
            emailmesg:'请输入邮箱',
            unameState:false,
            isAgreen:false,
            spanclass:{
                success:false,
                faill:false
            },
            passspan:{
                success:false,
                faill:false
            },
            passspan2:{
                success:false,
                faill:false
            },
            phonespan:{
                success:false,
                faill:false
            },
            emailspan:{
                success:false,
                faill:false
            }
            
        }
    },
    methods:{
        checkUsername(){
            let username=this.username;
            let usernameRegExp = /^[0-9A-Za-z_]{6,12}$/;
            if(username==''){
                this.namemesg='请输入用户名';
                this.unameState=false;
                this.spanclass={
                    success:false,
                    faill:true
                }
            }else if(usernameRegExp.test(username)){
                this.axios.post('/user/registercheck','username='+this.username).then(res=>{
                    // console.log(res.data);
                    if(res.data.code==0){
                        alert('该用户已存在');
                        this.unameState=false,
                        this.spanclass={
                            success:false,
                            faill:true
                        }
                    }else{
                        this.namemesg='用户名可用';
                       this.unameState=true;
                        console.log('用户名正确'),
                        this.spanclass={
                            success:true,
                            faill:false
                         }
                    }
                })
            }else{
                this.namemesg='该用户名不可用';
                this.unameState=false;
                this.spanclass={
                    success:false,
                    faill:true
                 }
            }
        },
        checkPassword(){
            let password=this.password;
            let passwordRegExp=/^[0-9A-Za-z_]{8,20}$/;
            if(password==''){
                this.passwordmesg='请输入登录密码';
                this.passspan={
                    success:false,
                    faill:true
                };
                return false;
            }else if(passwordRegExp.test(password)){
                // this.passwordmesg='密码正确';//'<img src="../assets/logo(1).png">'
                // console.log('密码正确');
                this.passwordmesg='';
                this.passspan={
                            success:true,
                            faill:false
                         };
                return true;
            }else{
                this.passwordmesg='密码格式错误';
                this.passspan={
                    success:false,
                    faill:true
                };
                return false;
            }
        },
        checkPassword2(){
            let password2=this.password2;
            
            if(password2==''){
                this.password2mesg='请再次输入登录密码';
                this.passspan2={
                    success:false,
                    faill:true
                }
                return false;
            }else if(password2 == this.password){
                this.password2mesg='';
                // console.log('密码名正确');
                this.passspan2={
                            success:true,
                            faill:false
                         };
                return true;
            }else{
                this.password2mesg='两次输入的密码不一致';
                this.passspan2={
                    success:false,
                    faill:true
                }
                return false;
            }
        },
        checkphone(){
            let phone=this.phone;
            let phoneRegExp=/^1[3-9]\d{9}$/;
            if(phone==''){
                this.phonemesg='请输入手机号码';
                this.phonespan={
                    success:false,
                    faill:true
                }
                return false;
            }else if(phoneRegExp.test(phone)){
                this.phonemesg='';
                 console.log('手机名正确');
                 this.phonespan={
                            success:true,
                            faill:false
                         }
                return true;
               
            }else{
                this.phonemesg='请输入正确的手机号码';
                this.phonespan={
                    success:false,
                    faill:true
                };
                return false;
            }
        },
        checkemail(){
            let email=this.email;
            let emailRegExp=/^[A-Za-z0-9\u4e00-\u9fa5]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
            if(email==''){
                this.emailmesg='请输入邮箱';
                this.emailspan={
                    success:false,
                    faill:true
                };
                return false;
            }else if(emailRegExp.test(email)){
                this.emailmesg="";
                this.emailspan={
                            success:true,
                            faill:false
                         };
                console.log('邮箱名正确')
                return true;
            }else{
                this.emailmesg='邮箱格式错误';
                this.emailspan={
                    success:false,
                    faill:true
                };
                return false;
            }
        },


        handle(){
            

            // if(this.checkUsername()){console.log('true')}
            if(this.isAgreen && this.unameState && this.checkPassword() && this.checkPassword2() && this.checkphone() && this.checkemail()){
                 this.axios.post('/user/userregister','username='+this.username+'&password='+this.password+'&phone='+this.phone+'&email='+this.email)
                .then(res=>{ 
                    // console.log(res.data);
                    if(res.data.code==0){
                        this.$messagebox("注册提示","对不起,用户已存在");
                    }else{
                        this.$router.push('/')
                    }
                })
            }
        }




    },
    mounted(){
        this.handle()
    }
}
</script>

<style>
.success{
    color: #71b83d !important;
    padding-left: 20px;
    background: url('../assets/valid_icons.png') no-repeat -40px -20px;
}
.faill{
    color: red !important;
    padding-left: 20px;
    white-space: nowrap;
    background: url('../assets/valid_icons.png') no-repeat -20px -40px;
}

.spanmesg{
    margin-left: 8px;
    line-height: 20px;
    height: 20px;
    overflow: hidden;
    color: #999;
    font-size: 12px;
    /* padding: 2px; */
    padding-bottom: 2px;
}

.submit{
    border-radius:2px ;
    vertical-align: middle;
    display: inline-block;
    font-size: 12px;
    text-align: center;
    height: 40px;
    line-height: 40px;
    padding: 0px 25px;
    background: #52A152;
    border: 1px solid #417F41;
    text-shadow: 0 -1px 0 #52A152;
    cursor: pointer;
    margin-left: 105px;
    color: #fff;
}
.textspace{
    letter-spacing:8px;
}
.checkbox{
    position: relative;
    padding: 5px 0 5px 20px;
    line-height: 42px;
    min-height: 42px;
    color: #555;
    overflow: hidden;
    width: 250px;
    margin-left:105px;
}
.inputcode{width: 84px;text-transform: uppercase;padding: 10px;border: 1px solid #E8E8E8;
    color: #999;}
.input{
    border: 1px solid #E8E8E8;
    color: #999;
    display: inline;
    margin-right: 5px;
    padding: 10px;
    /* height: 20px; */
    line-height: 20px;
    vertical-align: middle;
    background: #fff;
}
.reglist>li>div{
    position: relative;
    padding: 5px 0 5px 20px;
    line-height: 42px;
    min-height: 42px;
    color: #555;
    overflow: hidden;
}

.reglist>li>span:first-child{
    display: block;
    padding: 5px 0;
    float: left;
    width: 85px;
    line-height: 42px;
    min-height: 42px;
    color: #555;
    text-align: left;
}
.reglist>li{
    clear: both;
    display: block;
    padding: 5px 0;
    
}
.regbox .reglist li::after{
    clear: none;
    content: "";
    display: block;
    height: 0;
    visibility: hidden;
}
.reglist{
    margin-left:350px;
    padding: 30px;
    text-align: left;
    width: 879px;
    font-size: 14px;
    padding-top: 0px;
    }
.regbox{
    padding: 30px;
    /* margin: 30px 0; */
    min-height: 350px;
    height: 502px;
    border: 1px solid #f0f0f0;
    background: #fff;
    text-align: center;
}
.regtitle{
    display: block;
    padding-right: 10px;
    color: #666;
    font-size: 24px;
    font-weight: 400;
    line-height: 25px;
}
.regtitle{margin: 0 auto;
    padding: 30px 0 0;
    }
.clearfix::after{
    content: "/20";
    display: block;
    visibility: hidden;
    clear: both;
    font-size: 0;
    line-height: 0;
    height: 0;
    box-sizing: border-box;
    margin-bottom: 30px;
}
@media only screen and (max-width:1180px) {
    .clearfix{
        width: 941px;
    }
}
.clearfix{
    position: relative;
    margin: 0 auto;
    padding: 0;
    width: 1180px;
    min-width: 941px;
    max-width: 1180px;
    text-align: left;
    overflow: hidden;
}
.reg{
    position: relative;
    margin-bottom: -30px;
    width: 100%;
    background: #f2f2f2;
}
div{
    display:block;
}
</style>