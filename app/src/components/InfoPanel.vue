<template>
  <div id="info-panel">

    <header-panel></header-panel>

    <div id="title-slider">
      <div id="title-rotator"
        v-bind:style="{ transform: rotateString }">
        <div class="title" v-for="view in views">{{view.title}}</div>
      </div>
    </div>

    <div id="panel-controls">
      <div class="panel-button"
        v-for='view in views'
        v-bind:class="{ active: currentView == view.title }"
        @click="changeCurrentView(view.title)">
      </div>
    </div>

    <div v-if="currentView == views[0].title">
      landing page information
    </div>

    <div v-if="currentView == views[1].title">
      <map-rolly></map-rolly>
    </div>

    <div v-if="currentView == views[2].title">
      contact information
    </div>



  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'infoPanel'
  components:
    MapRolly: require './MapRolly'
    HeaderPanel: require './HeaderPanel'

  computed:
    rotateAmount: ->
      currentIndex = 0
      for view,i in @views
        currentIndex = i if view.title == @currentView
      return currentIndex * @titleSize
    rotateString: -> return "translate3d(0, -#{@rotateAmount}px, 0)"

    views: ->           return @$store.state.views
    currentView: ->     return @$store.state.currentView
  methods:
    changeCurrentView: (index)->  @$store.commit('SET_CURRENT_VIEW', index)

  data: ->
    titleSize: 50 # update when you change css title height


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
  +flex-direction(column)
  +justify-content(center)

  #title-slider
    position: absolute
    display: block
    height: 50px
    overflow-y: hidden
    top: 91px
    left: 80px
    z-index: 99
    #title-rotator
      +transition(.35s ease all)
      .title
        display: block
        font-size: 30px
        height: 50px
        +flexbox
        +align-items(center)

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
