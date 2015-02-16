Template.linkItem.helpers
  "getIconForApprovalStatus": (status) ->
    switch status
      when "published" then "ok"
      when "pending" then "time"
      when "deleted" then "trash"

      when "processing" then "refresh"
      when "malformed" then "remove"
  "getTitleForApprovalStatus": (status) ->
    switch status
      when "published" then "Опубліковано"
      when "pending" then "Очікує"
      when "deleted" then "Видалено"

      when "processing" then "Оброблення..."
      when "malformed" then "Неправильне посилання"

Template.linkItem.events
  "click .open-comments": ->
    Router.go "/post/#{@_id}"
  "click .link-owner-name": ->
    Router.go "/user/#{@owner}"