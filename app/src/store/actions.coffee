{ viewStream } = require 'src/db'
RxJS = require('rxjs');

module.exports =

  #socket method that watches for updates to server
  startStream: ({commit})=>
    viewStream.subscribe (res) ->
      commit('SET_VIEWS', res) if res.length
