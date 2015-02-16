@Links = new Mongo.Collection "links"
#@Pages = new Meteor.Pagination Links,
#  perPage: 10
#  itemTemplate: "linksPanelBody"
#  infinite: true

Links.allow
  insert: (userId, doc) ->
    userId and doc.owner == userId