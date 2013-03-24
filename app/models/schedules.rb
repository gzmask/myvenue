class Schedule < ActiveRecord::Base
	belongs_to :venue
	has_many :events
	validates_presence_of :name
	validates_presence_of :top
	validates_presence_of :left
	validates_presence_of :width
	validates_presence_of :height
	validates_presence_of :title_font_size
	validates_presence_of :content_font_size
end
