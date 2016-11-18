<template>
  <div id="app">

    <info-panel></info-panel>
    <sign-up-panel></sign-up-panel>

    <div id="signin-button" @click="setSignin"></div>
    <div v-if="signin">
      <signin-modal><signin-modal>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'app'
  components:
    InfoPanel: require './components/InfoPanel'
    SignUpPanel: require './components/SignUpPanel'
    SigninModal: require './components/SigninModal'

  computed:
    signin: -> @$store.state.signin
  methods:
    setSignin: -> @$store.commit('SET_SIGNIN', true)

</script>

<style lang="sass">
@import src/styles/main

#app
  +defaultType
  +flexbox
  +flex-direction(row)
  +align-content(center)
  height: 100vh
  width: 100vw

  #signin-button
    position: fixed
    bottom: 20px
    right: 20px
    width: 30px
    height: 30px
    background-color: pink
    cursor: pointer

</style>
