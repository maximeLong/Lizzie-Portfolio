<template>
  <div id="info-panel">

    <div id="header-bar">
      <div id="logo">Lizzie Davis.</div>
      <div id="languages">
        <div class="language-button"
             v-bind:class="{ active: activeLanguage == 'English' }"
             @click="activeLanguage = 'English'">English</div>
        <div class="language-button"
             v-bind:class="{ active: activeLanguage == 'Espanol' }"
             @click="activeLanguage = 'Espanol'">Español</div>
       <div class="language-button"
            v-bind:class="{ active: activeLanguage == 'Italiano' }"
            @click="activeLanguage = 'Italiano'">Italiano</div>
      </div>
      <div id="navigation">
        <div class="nav-button"
             v-bind:class="{ active: currentPage == 'Publications' }"
             @click="changeCurrentPage('Publications', 0)">Publications.</div>
        <div class="nav-button"
             v-bind:class="{ active: currentPage == 'Curriculum Vitae' }"
             @click="changeCurrentPage('Curriculum Vitae', 1)">CV.</div>
        <div class="nav-button"
             v-bind:class="{ active: currentPage == 'Contact Me' }"
             @click="changeCurrentPage('Contact Me', 2)">Contact.</div>
      </div>
    </div>


    <div id="title-slider">
      <div id="title-rotator"
        v-bind:style="{ transform: 'translate3d(0, -' + titleRotate + 'px, 0)'}">
        <div class="title" v-for="page in pages">{{page.title}}</div>
      </div>
    </div>

    <div id="panel-controls">
      <div class="panel-button"
        v-for='(page, index) in pages'
        v-bind:class="{ active: currentPage == page.title }"
        @click="changeCurrentPage(page.title, index)">
      </div>
    </div>

    <div v-if="currentPage == 'Publications'">
      landing page information
    </div>

    <div v-if="currentPage == 'Curriculum Vitae'">
      <map-rolly></map-rolly>
    </div>

    <div v-if="currentPage == 'Contact Me'">
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
    activeLanguage: 'English'
    titleRotate: 0
    titleSize: 40
    pages: [
      { title: 'Publications' }
      { title: 'Curriculum Vitae' }
      { title: 'Contact Me' }
    ]

  methods:
    changeCurrentPage: (title, index)->
      @currentPage = title
      @titleRotate = @titleSize * index

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

  #header-bar
    +flexbox
    +align-items(center)
    +flex-direction(row)
    +justify-content(space-between)
    position: absolute
    top: 20px
    left: 20px
    width: calc(100% - 20px)
    letter-spacing: 2px
    #logo
      color: #5bb99f
      font-family: 'Playfair Display', serif
      font-size: 25px
      display: none
    #languages
      +flexbox
      +flex-direction(row)
      .language-button
        +clickable
        color: $action_color
        +transition(.35s ease all)
      .language-button:nth-of-type(1)::after
        content: '/'
        padding: 0 5px
      .language-button:nth-of-type(2)::after
        content: '/'
        padding: 0 5px
      .active
        color: $black_three_quarters
        +transition(.35s ease all)
        cursor: default
    #navigation
      +flexbox
      +flex-direction(row)
      .nav-button
        +clickable
        color: $action_color
        padding: 0 10px
        +transition(.35s ease all)
        &:last-of-type
          padding-right: 20px
      .active
        color: $black_three_quarters
        +transition(.35s ease all)
        cursor: default


  #title-slider
    position: absolute
    display: block
    height: 40px
    overflow-y: hidden
    top: 91px
    left: 80px
    z-index: 99
    #title-rotator
      +transition(.35s ease all)
      .title
        display: block
        font-size: 30px
        height: 40px


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
