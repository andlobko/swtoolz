json.array!(@device_templates) do |device_template|
  json.extract! device_template, :id, :name, :description
  json.url device_template_url(device_template, format: :json)
end
