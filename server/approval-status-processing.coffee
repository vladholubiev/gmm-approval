ALL_LINKS_UPDATE_INTERVAL = 2 * 60 * 60 * 1000 # 2 hours

getApprovalStatus = (url) ->
  PUBLISHED_ICON = "/mapmaker/mapfiles/markerA-k.png"
  PENDING_ICON = "/mapmaker/mapfiles/marker_orangeA-k.png"
  PLACE_DELETED = "/mapmaker/mapfiles/marker_greyA-k.png"

  cheerio = Meteor.npmRequire "cheerio"
  $ = cheerio.load HTTP.get(url).content

  console.log "Processing link: #{url}"

  switch
    when _.str.include $.html(), PUBLISHED_ICON then ApprovalStatuses.published
    when _.str.include $.html(), PENDING_ICON then ApprovalStatuses.pending
    when _.str.include $.html(), PLACE_DELETED then ApprovalStatuses.deleted
    when not _.str.include url, "gw=" or _.str.include url, "gw=129" then ApprovalStatuses.malformed
    else
      ApprovalStatuses.malformed

updateLinkApprovalStatus = (id, link) ->
  if link.approvalStatus is ApprovalStatuses.processing or link.approvalStatus is ApprovalStatuses.pending and Match.test link, LinkSchema
    linkApprovalStatus = getApprovalStatus link.url

    console.log "Approval status is #{linkApprovalStatus}"

    Links.update {_id: id}, $set:
      approvalStatus: linkApprovalStatus

Links.find().observeChanges
  added: (id, link) ->
    updateLinkApprovalStatus(id, link)

scheduledLinkApprovalStatusUpdate = ->
  for link in Links.find().fetch()
    updateLinkApprovalStatus link._id, link

Meteor.setInterval scheduledLinkApprovalStatusUpdate, ALL_LINKS_UPDATE_INTERVAL

Meteor.methods
  forceUpdateLinkStatus: (link) ->
    updateLinkApprovalStatus link._id, link