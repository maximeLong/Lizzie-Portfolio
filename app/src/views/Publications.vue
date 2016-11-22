<template>
  <div id="publications">

    <!-- <button @click="updateView(new)">update view</button> -->

    <textarea
       @input="updateView"
       :value="publicationsBody"
       v-if="editMode">{{publicationsBody}}
    </textarea>

    <div class="editor-view" v-if="!editMode">
      <div v-html="interpretMarkdown"></div>
    </div>


  </div>
</template>

<script lang="coffee">
_ = require 'lodash'

marked = require 'marked'
# MediumEditor = require 'medium-editor'
{ views } = require 'src/db'

module.exports =
  name: 'publications'

  created: ->
    editedInput = @$store.state.views[0]?[@$store.state.activeLanguage].body

  data: ->
    editedInput: ''

  computed:
    interpretMarkdown: ->
      marked(@publicationsBody, { sanitize: true }) if @publicationsBody

    newContent: =>
      console.log @views[0][@activeLanguage]
      content = {}
      content[@activeLanguage].title  = @views[0][@activeLanguage].title
      content[@activeLanguage].body   = @editedInput
      return content

    #HACK: component loads before data is returned from server and into store
    publicationsBody: -> return @views[0]?[@activeLanguage].body
    views: -> @$store.state.views
    activeLanguage: -> return @$store.state.activeLanguage
    editMode: -> return @$store.state.editMode

  methods:
    updateEdit: (e)-> @editedInput = e.target.value

    updateView: _.debounce (e) ->
      @$store.dispatch('updateView', [@views[0], e.target.value])
    , 2000


</script>

<style lang="sass">
@import src/styles/main

#publications
  height: 100%
  width: 100%
  margin-top: 150px
  margin-bottom: 20px
  padding: 0 120px 0 40px
  display: block
  overflow-y: scroll
  overflow-x: hidden

  line-height: 20px
  p
    margin-bottom: 20px
  h1
    font-size: $font_size_big
    margin-bottom: 20px
    line-height: 27px

  // .editor
  //   position: relative

  textarea
    height: 100%
    width: 100%
    +defaultType






</style>
