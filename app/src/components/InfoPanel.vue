<template>
  <div id="info-panel">

    <header-panel></header-panel>

    <div id="title-slider">
      <div id="title-rotator"
        v-bind:style="{ transform: rotateString }">
        <div class="title" v-for="title in viewTitles">
          {{title}}
          <span @click="toggleEditMode">turn edit {{ editMode ? 'off' : 'on' }}</span>
        </div>
      </div>
    </div>

    <!-- main view router -->
    <transition name="fade" mode="out-in">
      <router-view class="view"></router-view>
    </transition>


    <!-- side panel controls -->
    <div id="panel-controls">
      <div class="panel-button"
        v-for='view in views'
        v-bind:class="{ active: buttonIsActive(view.title) }"
        @click="changeCurrentView(view.title)">
      </div>
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
        currentIndex = i if view.title == @$store.state.route.path[1..]
      return currentIndex * @titleSize
    rotateString: -> return "translate3d(0, -#{@rotateAmount}px, 0)"
    viewTitles: -> return @views.map (view)=> view[@activeLanguage]?.title

    views: ->           return @$store.state.views
    currentView: ->     return @$store.state.currentView
    activeLanguage: ->  return @$store.state.activeLanguage
    editMode: ->        return @$store.state.editMode
  methods:
    changeCurrentView: (index)->  return @$router.push(index)
    buttonIsActive: (index)->     return @$store.state.route.path[1..] is index
    toggleEditMode: -> @$store.commit('SET_EDIT_MODE', !@editMode)


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
      span
        margin-left: 20px
        +defaultType
        +clickable
        color: $action_color
        border: 1px solid $action_color
        border-radius: 2px
        padding: 6px 12px

  #panel-controls
    position: absolute
    right: 40px
    +flexbox
    +flex-direction(column)
    .panel-button
      background-color: white
      display: block
      width: 50px
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
