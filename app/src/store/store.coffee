Vuex = require('vuex')
{ init } = require('./plugins')

state =
  views: []
  languages: [
    { value: 'english' }
    { value: 'spanish' }
    { value: 'italian' } ]
  activeLanguage: 'english'
  signin: false
  currentUser: {}


mutations =
  SET_VIEWS: (state, newViews)->
    state.views = newViews
  SET_ACTIVE_LANGUAGE: (state, newLang)->
    state.activeLanguage = newLang
  SET_SIGNIN: (state, signState)->
    state.signin = signState
  SET_CURRENT_USER: (state, user)->
    state.currentUser = user

module.exports = new Vuex.Store({
  state
  mutations
  plugins: [init]
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
