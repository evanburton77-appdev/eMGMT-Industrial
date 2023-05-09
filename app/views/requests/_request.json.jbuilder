json.extract! request, :id, :user_id, :agent_id, :gig_id, :status, :created_at, :updated_at
json.url request_url(request, format: :json)
