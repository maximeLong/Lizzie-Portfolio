{ server } = require('src/db')

module.exports =

  init: (store)=>
    # server authenticate from localstorage if available
    server.authenticate()
    .then ({data}) -> store.commit('SET_CURRENT_USER', data)
    .catch (err) ->
      store.commit 'SET_CURRENT_USER',
        username: 'anonymous'
        email: ''
    # start stream
    store.dispatch('startStream')
