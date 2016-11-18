{ viewStream } = require 'src/db'
{ server } = require 'src/db'
RxJS = require('rxjs');

module.exports =

  #socket method that watches for updates to server
  startStream: ({commit})=>
    viewStream.subscribe (res) ->
      commit('SET_VIEWS', res) if res.length

  login: ({commit}, {email, password})->
    server.authenticate({type: 'local', email, password})
      .then (res) ->
        console.log res
        commit 'SET_CURRENT_USER', res.data
      .catch (err) ->
        console.log 'fuck me', err

  logout: ({commit})->
    server.logout()
      .then () ->
        commit 'SET_CURRENT_USER',
          username: 'anonymous'
          email: ''
      .catch (err) ->
        console.log err
