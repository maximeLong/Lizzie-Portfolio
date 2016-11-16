VueRouter = require('vue-router')
Publications = require('src/views/Publications')
Cv = require('src/views/Cv')
Contact = require('src/views/Contact')

module.exports = new VueRouter({

  mode: 'history'
  routes: [
    { path: '/publications', component: Publications }
    { path: '/cv', component: Cv }
    { path: '/contact', component: Contact }
    { path: '/', redirect: '/publications' }
  ]

})
