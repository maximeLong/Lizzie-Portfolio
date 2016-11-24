<template>
  <div id="publications" class="default-view">

    <editor-content
      :view="contactView"
      :active-language="activeLanguage"
      :edit-mode="editMode"
    ></editor-content>

  </div>
</template>

<script lang="coffee">

{ views } = require 'src/db'

module.exports =
  name: 'contact'
  components:
    EditorContent: require 'src/components/EditorContent'

  computed:
    contactView: -> return @$store.state.views[2]
    activeLanguage: -> return @$store.state.activeLanguage
    editMode: -> return @$store.state.editMode

</script>

<style lang="sass">
@import src/styles/main

#publications


</style>
