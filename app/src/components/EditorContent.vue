<template>
  <div id="editor-content">

    <textarea
       @input="updateView"
       :value="body"
       v-if="editMode">{{body}}
    </textarea>

    <div class="editor-view" v-if="!editMode">
      <div v-html="interpretMarkdown"></div>
    </div>

  </div>
</template>

<script lang="coffee">
marked = require 'marked'
_ = require 'lodash'

module.exports =
  name: 'editorContent'

  props:
    editMode: Boolean
    view: Object
    activeLanguage: String

  computed:
    body: ->
      # javascript doesn't return undefined if object is empty
      @view?[@activeLanguage].body if _.isEmpty(@view) is false

    interpretMarkdown: ->
      marked(@body, { sanitize: true }) if @body

  methods:
    updateView: _.debounce (e) ->
      @$store.dispatch('updateView', [@view, e.target.value])
    , 2000


</script>

<style lang="sass">
@import src/styles/main

#editor-content
  line-height: 20px
  height: 100%

  p, h1, ul, ol, code, blockquote
    margin-bottom: 20px
  h1
    font-size: $font_size_big
    line-height: 27px
  code
    background-color: #ececec
    padding: 5px 7px
    border-radius: 2px
    color: #e25e49
    font-family: 'Anonymous Pro', monospace
  blockquote
    border-left: 5px solid $action_color
    padding-left: 20px
  ul
    li
      margin-left: 25px
      position: relative
      padding-bottom: 5px
      &::before
        content: '—'
        margin-left: -25px
        position: absolute
        color: $action_color
  ol
    counter-reset: number-counter
    li
      margin-left: 25px
      position: relative
      padding-bottom: 5px
      &::before
        content: counter(number-counter, lower-roman)
        counter-increment: number-counter
        margin-left: -25px
        position: absolute
        color: $action_color

  textarea
    height: 100%
    width: 100%
    border: 1px solid $black_one_quarter
    border-radius: 2px
    padding: 10px
    +defaultType
    font-family: 'Anonymous Pro', monospace
    line-height: 20px

</style>
