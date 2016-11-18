<template>
  <div id="cv">

    {{cvBody}}

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'cv'

  computed:
    views: -> @$store.state.views
    activeLanguage: -> return @$store.state.activeLanguage

    #HACK: component loads before data is returned from server and into store
    cvBody: -> return @views[1]?[@activeLanguage].body


</script>

<style lang="sass">
@import src/styles/main


</style>
