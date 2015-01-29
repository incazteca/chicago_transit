module KMLManager
  class KMLParser
    def self.parse(path_of_file)
      raise 'Input not a Pathname object' unless path_of_file.is_a? Pathname
      return [] unless path_of_file.exist?

      kml_file = Nokogiri::XML(File.open(path_of_file)) { |config| config.strict }

      entries = kml_file.css('Placemark').map do |placemark|
        long, lat, elvtn = placemark.at_css('coordinates').text.split(',')
        {
          name: placemark.css('name').text,
          latitude: lat,
          longitude: long,
          elevation: elvtn
        }
      end

      entries
    rescue Nokogiri::XML::SyntaxError
      []
    end
  end
end
