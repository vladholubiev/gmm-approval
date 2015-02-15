Template.header.events
  "click #post-link": ->
    Router.go "newLink"

Template.header.helpers
  isLoggedOut: ->
    not (Meteor.user() and Meteor.userId())