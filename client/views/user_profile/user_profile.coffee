Template.user_profile.helpers
  "username": (that) ->
    that.fetch()[0].ownerName
  "userLinksCount": (that) ->
    that.fetch().length