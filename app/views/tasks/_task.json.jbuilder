json.extract! task, :id, :name, :beginning, :end, :estimated_cost, :status, :created_at, :updated_at
json.url task_url(task, format: :json)
