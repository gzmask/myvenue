class SplashAd < ActiveRecord::Base
	belongs_to :venue
	validates_presence_of :image_file
	validates_presence_of :name
	validates_presence_of :time_interval
	validates_presence_of :width
	validates_presence_of :height

  def del_file()
    image_file_path = Rails.root.join('public', 'splash_ads', self.id.to_s)
    File.delete(File.join(image_file_path, self.image_file)) if File.exist?(File.join(image_file_path, self.image_file))
    Dir.rmdir(image_file_path) if File.directory?(image_file_path)
  end

end
