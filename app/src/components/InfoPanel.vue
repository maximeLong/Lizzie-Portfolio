<template>
  <div id="info-panel">

    <div id="panel-controls">
      <div class="panel-button"
        v-for='(butt, index) in 2'
        v-bind:class="{ active: currentComponent == index }"
        @click="changeCurrentComponent(index)">
      </div>
    </div>

    <div v-if="currentComponent == 0">
      show landing component
    </div>

    <div v-if="currentComponent == 1">
      <map-rolly></map-rolly>
    </div>



  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'infoPanel'
  components:
    MapRolly: require './MapRolly'

  data: ->
    currentComponent: 0

  methods:
    changeCurrentComponent: (index)->
      @currentComponent = index
      console.log @currentComponent

</script>

<style lang="sass">
@import src/styles/main

#info-panel
  position: relative
  background-color: white
  +flex(1 1 50%)
  +flexbox
  height: 100%
  +align-items(center)
  +justify-content(center)

  #panel-controls
    position: absolute
    right: 20px
    +flexbox
    +flex-direction(column)
    .panel-button
      background-color: white
      display: block
      width: 60px
      height: 20px
      +clickable
      +flexbox
      +align-items(center)
      +translate3d(0,0,0)
      +transition(.35s all ease)
      &::before
        display: block
        content: ''
        height: 3px
        width: 100%
        background-color: $black_two_quarters
        +transition(.35s all ease)
    .active
      +translate3d(-20px,0,0)
      +transition(.35s all ease)
      cursor: default
      &::before
        content: ''
        background-color: $black_three_quarters
        +transition(.35s all ease)





</style>
