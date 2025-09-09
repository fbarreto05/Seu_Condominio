class Commentary < ApplicationRecord
  belongs_to :task

  after_create_commit { broadcast_prepend_to "task_#{task_id}_comments", target: "comments-container-#{task_id}" }
  after_destroy_commit { broadcast_remove_to "task_#{task_id}_comments" }
end
