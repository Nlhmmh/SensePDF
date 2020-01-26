import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../components/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/viewdata',
    name: 'ViewData',
    component: () => import('../components/ViewData.vue')
  },
  {
    path: '/about',
    name: 'about',
    component: () => import('../components/About.vue')
  }
]

const router = new VueRouter({
  routes
})

export default router
