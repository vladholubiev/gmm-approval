Template.registerHelper "userProfileLink", -> "/user/#{Meteor.userId()}"
Template.registerHelper "shortenName", (name) ->
  firstName = name.split(" ")[0]
  switch
    when firstName.length > 12
      firstName.substr 0, 10 + ".."
    when name.length > 12
      firstName
    else
      name
Template.registerHelper "formatUnixTime", (timestamp) ->
  moment.unix(timestamp).format("HH:mm:ss DD.MM.YYYY")
Template.registerHelper "isLoggedOut", ->
  not Meteor.user()
Template.registerHelper "getIconForApprovalStatus", (status) ->
  ApprovalStatusIcons[status]
Template.registerHelper "getTitleForApprovalStatus", (status) ->
  ApprovalTitles[status]