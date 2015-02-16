Template.new_link.events
  "click #post-links": (event) ->
    event.preventDefault()
    links = $("#new-links").val().trim().split("\n").filter((el) -> el.length > 0)
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