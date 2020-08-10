<template>
    <div>
        <button @click="minus" class="mybtn">-</button>
        <input type="text" v-model="n">
        <button @click="add" class="mybtn">+</button>
    </div>
</template>

<style  scoped>
.mybtn{
    width: 25px;
    height: 27px;
    font-size: 16px;
    /* line-height: 27px; */
    text-align: center;
    border: 1px solid #c5c0c0;
    overflow: hidden;
    background-color: #fff;
}
input{
    width: 42px;
    height: 27px;
    text-align: center;
    margin: 0;
    box-sizing: border-box;
    border: 1px solid #c5c0c0;
}
</style>

<script>
export default {
    data(){
        return{
            n:1,
        }
    },
    methods:{
        minus(){
            if(this.n>1){
                this.n--
            }
        },
        add(){
            this.n++;
        }
    }
}
</script>