<template>
  <div id="map-rolly">

    title:<input v-model="title">
    sort:<input v-model="sort">
    <button @click="setViews">set Views</button>

  </div>
</template>

<script lang="coffee">
{ views } = require 'src/db'


module.exports =
  name: 'mapRolly'
  data: ->
    title:  'view title'
    sort: 0

  methods:
    setViews: ->
      views.create
        title: @title
        sort: @sort
        english:
          title: 'english title'
          body: 'english body'
        spanish:
          title: 'spanish title'
          body: 'spanish body'
        italian:
          title: 'italian title'
          body: 'italian body'
      [@title, @eng, @span, @ital] = ['','','','']



</script>

<style lang="sass">
@import src/styles/main

#map-rolly
  +flexbox
  +flex-direction(column)

</style>
