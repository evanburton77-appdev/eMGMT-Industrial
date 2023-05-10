json.extract! gpt, :id, :content, :role, :user_id, :created_at, :updated_at
json.url gpt_url(gpt, format: :json)
