Template.newLink.events
  "click #post-links": (event) ->
    event.preventDefault()
    links = $("#new-links").val().trim().split("\n").filter((el) -> el.length > 0)
    if links.length > 0
      pushLink link for link in links when linkIsValid link

      allLinksAreValid = (linkIsValid link for link in links)
      if not (false in allLinksAreValid)
        Router.go "/"

createLinkDoc = (link) ->
  url: link
  date: moment().unix()
  owner: Meteor.userId()
  ownerName: Meteor.user().profile.name
  approvalStatus: ApprovalStatuses.processing

linkIsValid = (link) ->
  #TODO Check if link is already in DB
  linkDoc = createLinkDoc(link)
  Match.test linkDoc, LinkSchema

pushLink = (link) ->
  Links.insert createLinkDoc link