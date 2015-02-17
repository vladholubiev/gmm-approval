Meteor.methods
  getUsernameById: (userId) ->
    Meteor.users.findOne(_id: userId)?.profile.name
  getUserLinksCount: (userId) ->
    Links.find(owner: userId).count()
  getAllLinksCount: ->
    Links.find().count()
  getPostById: (postId) ->
    Links.findOne(_id: postId)