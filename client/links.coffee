Template.links.helpers
  links: -> Links.find()
  linksCount: ->
    Links.find().count()