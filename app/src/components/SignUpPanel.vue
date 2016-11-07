<template>
  <div id="sign-up">

    <div id="center-panel">
      <div class="title">About me</div>
      <div class="content">
        <p>Lizzie Davis is a writer, editor, and literary translator from Spanish and Italian to English. Her translations from the Spanish include works by Ezio Neyra, Pilar Fraile Amador, Daniel Saldaña París, and others, as well as Elena Medel's My First Bikini (Jai-Alai Books, 2015) and the prose for Then Come Back: The Lost Neruda (Copper Canyon, 2016). She acquires Spanish-language texts and edits works both in their original English and in translation at Coffee House Press.
        </p>
      </div>
      <div class="links">
        <a href="https://twitter.com/lizzie_davis_">twitter.</a>
        <a href="https://twitter.com/lizzie_davis_">linkedin.</a>
        <a href="https://twitter.com/lizzie_davis_">facebook.</a>
      </div>
    </div>

    <div class="back-pages" v-for="n in 8"></div>

  </div>
</template>

<script lang="coffee">
module.exports =

  name: 'signUpPanel'


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
    &::after
      content: 'i'
      left: 50%
      font-style: italic
      position: absolute
      bottom: 20px
    .title
      width: 100%
      text-align: center

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
