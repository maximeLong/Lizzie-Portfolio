module.exports =

  someAction: ({commit}, newVal) ->
    console.log('yo dawg get me some food', newVal)
    commit 'SET_STATE_VAL', newVal
