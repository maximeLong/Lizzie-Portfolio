<template>
  <div id="sign-up">

    <div id="center-panel">
      <div class="title">About Lizzie Davis</div>
      <editor-content
        :view="aboutView"
        :active-language="activeLanguage"
        :edit-mode="editMode"
      ></editor-content>
    </div>

    <div class="back-pages" v-for="n in 8"></div>

  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'signUpPanel'
  components:
    EditorContent: require './EditorContent'

  computed:
    aboutView: -> return @$store.state.about
    activeLanguage: -> return @$store.state.activeLanguage
    editMode: -> return @$store.state.editMode



</script>

<style lang="sass">
@import src/styles/main

#sign-up
  position: relative
  background-color: $black_one_quarter
  margin: 20px 20px 20px 0
  +flex(1 1 50%)
  +flexbox
  +justify-content(center)
  +align-items(center)
  overflow: hidden

  #center-panel
    width: 55%
    height: 78%
    z-index: 99
    background-color: white
    position: relative
    padding: 30px
    font-family: 'Anonymous Pro'
    &::after
      content: 'i'
      left: 50%
      font-style: italic
      position: absolute
      bottom: 20px
    .title
      width: 100%
      text-align: center
      font-family: 'Anonymous Pro'
      padding: 0 0 10px 0

    .content
      p
        margin-top: 10px
        line-height: $regular_line_height

    .links
      margin-top: 30px
      width: 100%
      +flexbox
      +align-items(center)
      +justify-content(space-between)
      border-top: 1px solid $black_one_quarter
      border-bottom: 1px solid $black_one_quarter
      padding: 10px 0



  .back-pages
    z-index: 9
    position: absolute
    top: 0
    left: 0
    right: 0
    bottom: 0
    margin: auto
    height: calc(78% - 4px)
    width: calc(55% - 4px)
    opacity: .5
    background-color: white
    border-right: 1px solid #c0c0c0

    &:nth-last-of-type(8)
      height: 81%
      border: none
      width: 56%
      box-shadow: -27px 20px 50px rgba(0, 0, 0, 0.73)
    // &:nth-last-of-type(8)
    //   width: 50px
    //   height: 88%
    //   background-color: #e87b7b
    //   transform: translate3d(-188px,3%,0)
    //   opacity: 1

@for $i from 1 through 8
  $xamount: #{$i * 4}px
  // $yamount: #{$i * 1}px
  .back-pages:nth-last-of-type(#{$i})
     +translate3d($xamount, 0, 0)


</style>
