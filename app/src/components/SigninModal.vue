<template>
  <div id="signin-modal">
    <div class="close-btn" @click="close">x</div>
    <div class="title">Hi {{userName}}!</div>

    <input placeholder="email" v-model="credentials.email" v-if="!userExists">
    <input placeholder="password" v-model="credentials.password" type="password" v-if="!userExists">

    <div class="submit-btn" @click="login" v-if="!userExists">Log in</div>
    <div class="submit-btn" @click="logout" v-if="userExists">Log out</div>


  </div>
</template>

<script lang="coffee">
{ user, server } = require('src/db')

module.exports =
  name: 'signinModal'

  data: ->
    credentials:
      email: ''
      password: ''

  computed:
    userName: -> return @$store.state.currentUser.username
    userExists: ->
      if @userName != 'stranger'
        return true
      else return false

  methods:
    close: -> @$store.commit('SET_SIGNIN', false)
    logout: -> @$store.dispatch 'logout'
    login: ->
      @$store.dispatch 'login', @credentials
      setTimeout =>
        @close()
      , 1500

      # TODO: REMOVE
      # user.create({
      #   username: 'lizziedavis'
      #   email: 'edavis256@gmail.com'
      #   password: 'myfriendmax'
      # })




</script>

<style lang="sass">
@import src/styles/main

#signin-modal
  margin: auto
  position: absolute
  top: 0
  bottom: 0
  left: 0
  right: 0
  width: 400px
  height: 200px
  background-color: white
  box-shadow: 0 0 100px #cdcdcd
  padding: 30px
  z-index: 99999
  +flexbox
  +flex-direction(column)
  +align-items(center)
  +justify-content(center)

  .close-btn
    position: absolute
    top: 10px
    right: 10px
    width: 20px
    height: 20px
    text-align: center
    +clickable

  .title
    margin-bottom: 10px
    font-style: italic
    color: $action_color
    font-size: $font_size_small
    line-height: 17px
  input
    border: 1px solid $black_two_quarters
    border-radius: 2px
    +defaultType
    font-size: $font_size_small
    padding: 5px
    margin: 5px 0
    width: 100%
  .submit-btn
    width: 100%
    margin-top: 5px
    font-size: $font_size_small
    padding: 10px
    background-color: $action_color
    color: white
    text-align: center
    +clickable


</style>
