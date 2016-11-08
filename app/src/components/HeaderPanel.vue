<template>
  <div id="header-panel">

    <div id="logo">Lizzie Davis.</div>

    <div id="languages">
      <div class="language-button"
           v-bind:class="{ active: activeLanguage == languages[0].value }"
           @click="changeActiveLang(languages[0].value)">English</div>
      <div class="language-button"
           v-bind:class="{ active: activeLanguage == languages[1].value }"
           @click="changeActiveLang(languages[1].value)">Español</div>
     <div class="language-button"
          v-bind:class="{ active: activeLanguage == languages[2].value }"
          @click="changeActiveLang(languages[2].value)">Italiano</div>
    </div>

    <div id="navigation">
      <div class="nav-button"
           v-bind:class="{ active: currentView == views[0].title }"
           @click="changeCurrentView(views[0].title, 0)">Publications.</div>
      <div class="nav-button"
           v-bind:class="{ active: currentView == views[1].title }"
           @click="changeCurrentView(views[1].title, 1)">CV.</div>
      <div class="nav-button"
           v-bind:class="{ active: currentView == views[2].title }"
           @click="changeCurrentView(views[2].title, 2)">Contact.</div>
    </div>

  </div>
</template>

<script lang="coffee">
module.exports =
  
  name: 'headerPanel'
  computed:
    views: ->           return @$store.state.views
    languages: ->       return @$store.state.languages
    currentView: ->     return @$store.state.currentView
    activeLanguage: ->  return @$store.state.activeLanguage
  methods:
    changeCurrentView: (index)->  @$store.commit('SET_CURRENT_VIEW', index)
    changeActiveLang: (index)->   @$store.commit('SET_ACTIVE_LANGUAGE', index)


</script>

<style lang="sass">
@import src/styles/main

#header-panel
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

</style>
