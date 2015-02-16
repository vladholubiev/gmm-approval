Router.configure
  layoutTemplate: "layout"
  loadingTemplate: "loading"
  notFoundTemplate: "404_not_found"
  waitOn: ->
    Meteor.subscribe "links"

Router.route "/",
  name: "main"
Router.route "/new-link",
  name: "new_link"
Router.route "/post/:_id",
  name: "post"
  data: -> Links.findOne @params._id
Router.route "/user/:_id",
  name: "user_profile"
  data: -> Links.find owner: @params._id,
    sort:
      date: -1