Template.link_item.helpers
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