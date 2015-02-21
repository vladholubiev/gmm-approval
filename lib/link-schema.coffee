@LinkSchema = new SimpleSchema
  url:
    type: String
    label: "Links URL"
    min: 10
    regEx: SimpleSchema.RegEx.Url
  date:
    type: Number
    label: "Link inserting date"
  owner:
    type: String
    label: "Owner user id"
  ownerName:
    type: String
    label: "Owner name"
  approvalStatus:
    type: String
  _id:
    type: String
    optional: true