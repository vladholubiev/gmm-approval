Template.newLink.events
  "click #post-links": (event) ->
    event.preventDefault()
    links = $("#new-links").val().split "\n"
    #TODO validate links: domain, length, limit
    pushLink link for link in links
    Router.go "/"

pushLink = (link) ->
  Links.insert
    links: link
    date: moment().unix()
    owner: Meteor.userId()