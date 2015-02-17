Meteor.publish "links", ->
  Links.find {},
    sort:
      date: -1