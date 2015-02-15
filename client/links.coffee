Template.links.helpers
  links: -> Links.find {},
    sort:
      date: -1
  linksCount: ->
    Links.find().count()

Template.links.events
  "click .open-comments": ->
    Router.go "/post/#{@_id}"
  "click .link-owner-name": ->
    Router.go "/user/#{@owner}"
