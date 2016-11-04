<template>
  <div id="info-panel">
    <div id="logo">Lizzie Davis</div>

    <div id="title-slider">
      <div id="title-rotator"
        v-bind:style="{ transform: 'translate3d(0, -' + rotate + 'px, 0)'}">
        <div class="title" v-for="page in pages">{{page.title}}</div>
      </div>
    </div>

    <div id="panel-controls">
      <div class="panel-button"
        v-for='(page, index) in pages'
        v-bind:class="{ active: currentPage == page.title }"
        @click="changeCurrentPage(page, index)">
      </div>
    </div>

    <div v-if="currentPage == 'Publications'">
      landing page information
    </div>

    <div v-if="currentPage == 'CV'">
      <map-rolly></map-rolly>
    </div>

    <div v-if="currentPage == 'Contact'">
      contact information
    </div>



  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'infoPanel'
  components:
    MapRolly: require './MapRolly'

  data: ->
    currentPage: 'Publications'
    rotate: 0
    titleSize: 40
    pages: [
      { title: 'Publications' }
      { title: 'CV' }
      { title: 'Contact' }
    ]

  methods:
    changeCurrentPage: (page, index)->
      @currentPage = page.title
      @rotate = @titleSize * index

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

  #logo
    color: $action_color
    font-family: 'Playfair Display', serif
    font-size: 25px
    letter-spacing: 5px
    text-transform: uppercase
    position: absolute
    top: 20px
    left: 20px

  #title-slider
    position: absolute
    display: block
    height: 40px
    overflow-y: hidden
    top: 150px
    #title-rotator
      +transition(.35s ease all)

      .title
        display: block
        font-size: 25px
        height: 40px
        text-align: center



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
