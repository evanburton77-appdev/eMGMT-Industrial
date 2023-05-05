json.extract! gig, :id, :title, :user_id, :agent_id, :description, :industry, :created_at, :updated_at
json.url gig_url(gig, format: :json)
