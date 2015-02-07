Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  notFoundTemplate: "404_not_found"
  waitOn: ->
    Meteor.subscribe "links"

Router.route "/",
  name: "main"