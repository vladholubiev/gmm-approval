Template.linksList.helpers
  links: -> Links.find {},
    sort:
      date: -1
  linksCount: ->
    Links.find().count()
