if @newest.present?
  json.id @newest.id.to_s
  json.extract! @newest, :title, :sub_content, :type, :labels_content, :created_at
else
  json.null!
end
