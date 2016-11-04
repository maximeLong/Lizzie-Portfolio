Vuex = require('vuex')

state =
  stateVal: 'hello world'

mutations =
  SET_STATE_VAL: (state, newVal)->
    state.stateVal = newVal

module.exports = new Vuex.Store({
  state
  mutations
  actions: require './actions'
  strict: process.env.NODE_ENV != 'production'
})
