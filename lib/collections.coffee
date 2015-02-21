@Links = new Mongo.Collection "links"
@LinksListPages = new Meteor.Pagination Links,
  templateName: "linksList"
  itemTemplate: "linkItem"
  perPage: 25
  infinite: true
  dataMargin: 0
  availableSettings:
    filters: yes
  sort:
    date: -1

@UserLinksListPages = new Meteor.Pagination Links,
  templateName: "userProfile"
  itemTemplate: "linkItem"
  perPage: 25
  infinite: true
  dataMargin: 0
  sort:
    date: -1

Links.allow
  insert: (userId, doc) ->
    userId and doc.owner == userId