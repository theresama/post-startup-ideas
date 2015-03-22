class Idea < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :title, length: { maximum: 255 }
end
