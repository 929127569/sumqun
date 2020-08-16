<template>
    <div>
        <button @click="minus" class="mybtn">-</button>
        <input type="text" v-model="count" >
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
            count:1,
        }
    },
    methods:{

        minus(){
            if(this.count>1){
            this.count--;
            this.$emit('getCount',this.count);
            
            }
        },
        add(){
            this.count++;
            this.$emit('getCount',this.count);
            
            // let product={
            //        count:this.count 
            //     }
            // this.$store.commit('addTocar',product);
        }
    }
}
</script>