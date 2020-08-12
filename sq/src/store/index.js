import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isLogin:sessionStorage.getItem('isLogin')||false,
  },
  mutations: {
    login_mutations(state){
      state.isLogin=true;
    }
  },
  actions: {
  },
  modules: {
  }
})
