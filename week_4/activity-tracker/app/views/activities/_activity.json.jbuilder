json.extract! activity, :id, :title, :activity_type, :start, :duration, :calories, :created_at, :updated_at
json.url activity_url(activity, format: :json)
