import Vue from 'vue'
import VueRouter from 'vue-router'
import Index from '../views/Index.vue'
import Login from '../views/Login.vue'
import Details from '../views/Details.vue'
import Register from '../views/Register.vue'
import Product from '../views/Product.vue'
import Shopcar from '../views/Shopcar.vue'



Vue.use(VueRouter)

  const routes = [
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
  {
    path:'/shopcar',
    component:Shopcar
  },
  {
    path:'/register',
    component:Register
  },
  {
    path:'/login',
    component:Login
  },
  {
    path:'/product/:kw',
    // name:'product',
    component:Product,
    props:true,
    
  },
  {
    path:'/',
    name:'index',
    component:Index
  },
  {
    path:'/details/:pid',//加参数lid,
    props:true,
    component:()=>import(/* webpackChunkName: "details" */ '../views/Details.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
