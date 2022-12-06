json.extract! reading, :id, :title, :csv_file, :created_at, :updated_at
json.url reading_url(reading, format: :json)
json.csv_file url_for(reading.csv_file)
