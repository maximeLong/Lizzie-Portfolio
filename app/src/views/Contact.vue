<template>
  <div id="contact">

    {{contactBody}}

  </div>
</template>

<script lang="coffee">

module.exports =
  name: 'contact'

  computed:
    views: -> @$store.state.views
    activeLanguage: -> return @$store.state.activeLanguage

    #HACK: component loads before data is returned from server and into store
    contactBody: -> return @views[2]?[@activeLanguage].body


</script>

<style lang="sass">
@import src/styles/main


</style>
