Meteor.methods
  getUsernameById: (userId) ->
    Meteor.users.findOne(_id: userId)?.profile.name
  getUserLinksCount: (userId) ->
    Links.find(owner: userId).count()