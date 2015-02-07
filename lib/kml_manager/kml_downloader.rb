require 'open-uri'

module KMLManager
  class KMLDownloader
    def self.download_KML(url, file_name)
      base_directory = Rails.root.join('lib','data')
      #uri = URI(url)

      file_path = base_directory.join(file_name)

      URI.parse(url).read do |response|
        open file_path.to_s, 'w' do |io|
          response.read_body do |chunk|
            io.write chunk
          end
        end
      end

      file_path
    end
  end
end
