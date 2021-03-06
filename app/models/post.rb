# == Schema Information
#
# Table name: posts
#
#  id               :integer          not null, primary key
#  title            :string
#  body             :text
#  description      :text
#  slug             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  banner_image_url :string
#  author_id        :integer
#  published        :boolean          default(FALSE)
#  published_at     :datetime
#

class Post < ApplicationRecord
	extend FriendlyId 
	validates :title, presence: true, length: {minimum: 1, maximum: 80}
	validates :body, presence: true, length: {minimum: 4000, maximum: 500000}
	validates :banner_image_url, presence: true 
	friendly_id :title, use: :slugged

	belongs_to :author

	scope :most_recent, -> {order(published_at: :desc)} 
	scope :published, -> {where(published: true)}

	def should_generate_new_friendly_id?
		title_changed?
	end

	def published_date 
		"Published on #{created_at.strftime("%-b, %-d, %-Y")}"
	end

end
