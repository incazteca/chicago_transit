require 'pathname'
require 'open-uri'
require 'diffy'

module KMLManager
  class KMLDownloader
    def self.download_kml(url, file_name)
      file_path = base_directory.join(file_name)
      download_into_temp_file(url)

      if file_path.exist?
        diff = Diffy::Diff.new(file_path.to_s, temp_file.to_s, source: 'files')
        if diff.count > 0
          backup_file(file_path)
        end
      end

      move_temp_to_filename(file_path)
      Pathname.new(file_path)
    end

    def self.download_into_temp_file(url)
      open(temp_file.to_s, 'w') do |io|
        open(url) do |response|
          io.write(response.read)
        end
      end
    end

    def self.temp_file
      base_directory.join('downloaded_kml.tmp')
    end

    def self.move_temp_to_filename(target)
      File.rename temp_file, target
    end

    def self.base_directory
      Rails.root.join('lib', 'data')
    end

    def self.backup_file(original_file)
      File.rename original_file, "#{original_file}.bak"
    end
  end
end
