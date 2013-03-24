class Venue < ActiveRecord::Base
	has_many :advertisements
	has_many :splash_ads
	has_many :schedules
	has_many :events
	has_one :display
	has_one :time_box
	has_one :weather_box
	belongs_to :user
	validates_presence_of :background_image
	validates_presence_of :name
	validates_presence_of :user_id
	validates_presence_of :time_zone
	validates_presence_of :time_interval
	accepts_nested_attributes_for :display, :allow_destroy => true
	accepts_nested_attributes_for :time_box, :allow_destroy => true
	accepts_nested_attributes_for :weather_box, :allow_destroy => true

  def del_file()
    background_image_path = Rails.root.join('public', 'venues', self.id.to_s)
    File.delete(File.join(background_image_path, self.background_image)) if File.exist?(File.join(background_image_path, self.background_image))
    #Dir.rmdir(background_image_path)
    Dir.rmdir(background_image_path) if File.directory?(background_image_path)
  end

end
