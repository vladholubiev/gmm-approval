Template.newLink.events
  "click #post-links": (event) ->
    event.preventDefault()
    linksBoxText = $("#new-links").val().trim()
    links = linksBoxText.split("\n").filter((el) -> el.length > 0)
    #TODO validate links: domain, limit
    if links.length > 0
      pushLink link for link in links
      Router.go "/"

pushLink = (link) ->
  #TODO Check if link is already in DB
  Links.insert
    link: link
    date: moment().unix()
    owner: Meteor.userId()
    ownerName: Meteor.user().profile.name
    approvalStatus: "processing"