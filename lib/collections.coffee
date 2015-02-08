@Links = new Mongo.Collection "links"

Links.allow
  insert: (userId, doc) ->
    userId and doc.owner == userId