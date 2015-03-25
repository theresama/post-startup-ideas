class Idea < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order(created_at: :desc) }
	validates :user_id, presence: true
	validates :title, length: { maximum: 255 }

	acts_as_ordered_taggable # Alias for acts_as_taggable_on :tags
	acts_as_ordered_taggable_on :keyword

	acts_as_votable

	def self.highest_voted
	  self.unscoped.order("cached_votes_score DESC")
	end
end
