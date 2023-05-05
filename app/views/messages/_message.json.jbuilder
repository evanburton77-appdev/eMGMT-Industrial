json.extract! message, :id, :user_id, :agent_id, :content, :subject, :read_receipt_user, :read_receipt_manager, :reaction_user, :reaction_manager, :created_at, :updated_at
json.url message_url(message, format: :json)
