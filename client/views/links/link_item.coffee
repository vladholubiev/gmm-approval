Template.linkItem.rendered = ->
  $ -> $('[data-toggle="tooltip"]').tooltip()

Template.linkItem.events
  "click .approval-status-icon": (e) ->
    $(e.target).tooltip "hide"
    Meteor.call "forceUpdateLinkStatus", this
  "click .open-comments": (e) ->
    $(e.target).tooltip "hide"
    Router.go "/post/#{@_id}"
  "click .link-owner-name": (e) ->
    $(e.target).tooltip "hide"
    Router.go "/user/#{@owner}"