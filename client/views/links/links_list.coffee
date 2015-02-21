Template.linksList.rendered = ->
  $.fn.bootstrapSwitch.defaults.size = "mini"
  $.fn.bootstrapSwitch.defaults.onText = "🕒"
  $.fn.bootstrapSwitch.defaults.offText = "Усі"
  $.fn.bootstrapSwitch.defaults.animate = false
  $.fn.bootstrapSwitch.defaults.onInit = -> $(".bootstrap-switch").addClass "pull-right"
  $.fn.bootstrapSwitch.defaults.onSwitchChange = (event, state) ->
    if state is on
      LinksListPages.set
        filters:
          approvalStatus: "pending"
    else
      LinksListPages.set
        filters:
          approvalStatus:
            $ne: "whatever"
  $(".switch").bootstrapSwitch()

Template.linksList.helpers
  linksCount: ->
    Meteor.call "getAllLinksCount", (err, result) ->
      Session.set "allLinksCount", result
    Session.get "allLinksCount"
