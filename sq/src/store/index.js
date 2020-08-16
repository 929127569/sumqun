import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin:sessionStorage.getItem('isLogin')||false,
    car:[],
    // count:JSON.parse(localStorage.getItem('count')||'[]')
  },
  mutations: {
    login_mutations(state){
      state.isLogin=true;
    },
    logout_mutations:(state)=>{
      state.isLogin=false;
      localStorage.clear();
    },
    addcount(state,count){
     
    },
    // addTocar(state,product){
    //   let falg=false;
    //   state.car.forEach(item=>{
    //     if(item.proid==product.proid){
    //       item.
    //     }
    //   })
    // }
    // count(state,count){
    //   state.count=count;
    //   localStorage.setItem('count',JSON.stringify(state.count))
    // },
    addTocar(state,product){
      state.car.push(product);
      //localStorage.setItem('car',JSON.stringify(product))
    }
  },
  actions: {
  },
  modules: {
  }
})
