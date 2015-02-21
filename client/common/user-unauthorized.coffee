Template.userUnauthorized.rendered = ->
  Tracker.autorun ->
    if Meteor.user()
      Router.go "/"