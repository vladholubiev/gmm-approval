Template.linksList.helpers
  linksCount: ->
    Meteor.call "getAllLinksCount", (err, result) ->
      Session.set "allLinksCount", result
    Session.get "allLinksCount"
