<template>
  <div id="publications">

    {{publicationsBody}}

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'publications'

  computed:
    views: -> @$store.state.views
    activeLanguage: -> return @$store.state.activeLanguage

    #HACK: component loads before data is returned from server and into store
    publicationsBody: -> return @views[0]?[@activeLanguage].body


</script>

<style lang="sass">
@import src/styles/main


</style>
