Vuex = require('vuex')

state =
  views: [
    { title: 'Publications' }
    { title: 'Curriculum Vitae' }
    { title: 'Contact Me' } ]
  languages: [
    { value: 'english' }
    { value: 'spanish' }
    { value: 'italian' } ]
  currentView: 'Publications'
  activeLanguage: 'english'


mutations =
  SET_CURRENT_VIEW: (state, newView)->
    state.currentView = newView
  SET_ACTIVE_LANGUAGE: (state, newLang)->
    state.activeLanguage = newLang

module.exports = new Vuex.Store({
  state
  mutations
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
