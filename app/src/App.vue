<template>
  <div id="app">

    <info-panel></info-panel>
    <sign-up-panel></sign-up-panel>

  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'app'
  components:
    InfoPanel: require './components/InfoPanel'
    SignUpPanel: require './components/SignUpPanel'

  data: ->
    someData: 'hey im andy'
    inputModel: 'write something'
    pins: [
      { src: 'src jfdlskja ' },
      { src: 'src two' },
      { src: 'src three' }
    ]

  computed:
    vuexData: ->
      return @$store.state.stateVal

  methods:
    doWork: ->
      console.log 'i did work'

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

</style>
