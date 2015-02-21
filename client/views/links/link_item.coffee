Template.linkItem.rendered = ->
  $ -> $('[data-toggle="tooltip"]').tooltip()

Template.linkItem.events
  "click .open-comments": (e) ->
    $(e.target).tooltip "hide"
    Router.go "/post/#{@_id}"
  "click .link-owner-name": (e) ->
    $(e.target).tooltip "hide"
    Router.go "/user/#{@owner}"