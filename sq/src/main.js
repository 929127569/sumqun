import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MH from './components/MyHeader.vue'
import MF from './components/MyFooter.vue'
import MC from './components/MyCounter.vue'
import axios from 'axios'


import VueAwesomeswiper from 'vue-awesome-swiper'
Vue.use(VueAwesomeswiper)

Vue.config.productionTip = false

Vue.component("my-header",MH);
Vue.component("my-footer",MF);
Vue.component("my-counter",MC);

axios.defaults.baseURL='http://127.0.0.1:3000'
Vue.prototype.axios=axios;
Vue.config.productionTip=false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
