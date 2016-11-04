import Vue from 'vue'
import Vuex from 'vuex'
import App from './App'

Vue.use(Vuex)

const store = require('src/store/store')

/* eslint-disable no-new */
new Vue({
  el: '#app',
  template: '<App/>',
  store,
  components: { App }
})
