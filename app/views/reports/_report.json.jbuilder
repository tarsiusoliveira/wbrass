json.extract! report, :id, :project_id, :content, :filename, :created_at, :updated_at
json.url report_url(report, format: :json)
