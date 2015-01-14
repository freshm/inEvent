require 'open-uri'
require 'rmagick'
require 'pry'

class ImageDownloader
	def initialize image
		@image_url = image
	end

	def download_image_for_user(user, image_url)
		open(image_url, 'wb') do |file|
			binding.pry	
			file << open(image_url).read
		end
	end
end