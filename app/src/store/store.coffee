Vuex = require('vuex')
{ init } = require('./plugins')

state =
  views: [
    { title: 'Publications' }
    { title: 'Cv' }
    { title: 'Contact' } ]
  languages: [
    { value: 'english' }
    { value: 'spanish' }
    { value: 'italian' } ]
  activeLanguage: 'english'


mutations =
  SET_VIEWS: (state, newViews)->
    state.views = newViews
  SET_CURRENT_VIEW: (state, newView)->
    state.currentView = newView
  SET_ACTIVE_LANGUAGE: (state, newLang)->
    state.activeLanguage = newLang

module.exports = new Vuex.Store({
  state
  mutations
  plugins: [init]
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
