import Vue from 'vue'
import Vuex from 'vuex'
import App from './App'
import VueRouter from 'vue-router'
import { sync } from 'vuex-router-sync'
import server from './db'
Vue.use(Vuex)
Vue.use(VueRouter)

const store = require('src/store/store')
const router = require('src/router')
sync(store, router) // registers store.state.router


/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<App/>',
  store,
  router,
  components: { App }
})
