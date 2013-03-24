class Advertisement < ActiveRecord::Base
	belongs_to :venue
	validates_presence_of :name
	validates_presence_of :flash_file
	validates_presence_of :time_interval

  def del_file()
    flash_file_path = Rails.root.join('public', 'advertisements', self.id.to_s)
    File.delete(File.join(flash_file_path, self.flash_file)) if File.exist?(File.join(flash_file_path, self.flash_file))
    Dir.rmdir(flash_file_path) if File.directory?(flash_file_path)
  end

end
