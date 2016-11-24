{ viewStream, views, server } = require 'src/db'
RxJS = require('rxjs');
_ = require('lodash')

module.exports =

  #socket method that watches for updates to server
  startStream: ({commit})=>
    query =
      $sort: { sort: -1}
    #TODO: WTF: A function that returns a function, which returns whether an item matches the original query or not.
    views.rx(matcher: (query)-> -> true)
    #TODO: query doesn't seem to work
    views.find(query)
      .subscribe (res) ->
        res = _.sortBy(res, 'sort')
        about = res[0]
        pageViews = res.filter( (view)-> view.title != 'About')
        commit('SET_VIEWS', pageViews) if pageViews.length
        commit('SET_ABOUT', about)
      , (err) -> console.log err

  updateView: ({commit, state}, [currentView, content])->
    newLanguage = {}
    newLanguage[state.activeLanguage] = {}
    newLanguage[state.activeLanguage].body  = content
    newLanguage[state.activeLanguage].title = currentView[state.activeLanguage].title
    views.patch(currentView?._id, newLanguage)
      .then (res)->
        console.log 'success'
      .catch (err)->
        console.log err

  createView: ({commit, state}, body)->
    views.create(body)
      .then (res)->
        console.log 'success'
      .catch (err)->
        console.log err

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
          username: 'stranger'
          email: ''
      .catch (err) ->
        console.log err
