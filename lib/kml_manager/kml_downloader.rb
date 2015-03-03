require 'pathname'
require 'open-uri'

module KMLManager
  class KMLDownloader
    def self.download_KML(url, file_name)
      base_directory = Rails.root.join('lib','data')

      file_path = base_directory.join(file_name)

      open(file_path.to_s, 'w') do |io|
        open(url) do |response|
          io.write(response.read)
        end
      end

      Pathname.new(file_path)
    end
  end
end
