json.data do
    json.array! @announcements do |announcement|
      json.partial! 'api/v1/announcements/announcement', announcement: announcement
    end
  end