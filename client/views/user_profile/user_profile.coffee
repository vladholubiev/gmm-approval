Template.userProfile.helpers
  "username": (userId) ->
    Meteor.call "getUsernameById", userId, (err, result) ->
      Session.set "viewingUserName", result
    Session.get "viewingUserName"
  "userLinksCount": (userId) ->
    Meteor.call "getUserLinksCount", userId, (err, result) ->
      Session.set "viewingUserLinksCount", result
    Session.get "viewingUserLinksCount"