json.extract! test_file, :id, :name, :description, :file, :created_at, :updated_at
json.url test_file_url(test_file, format: :json)
