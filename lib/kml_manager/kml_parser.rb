# frozen_string_literal: true
module KMLManager
  class KMLParser
    def self.parse(path_of_file)
      raise 'Input not a Pathname object' unless path_of_file.is_a? Pathname
      return [] unless path_of_file.exist?

      kml_file = Nokogiri::XML(File.open(path_of_file), &:strict)

      entries = kml_file.css('Placemark').map do |placemark|
        coords = placemark.at_css('coordinates').text.split

        output = { name: placemark.css('name').text }

        output.merge!(coordinates(coords.first)) if coords.size == 1
        output[:coordinates] = coords.map { |coord| coordinates(coord) } if coords.size > 1

        output
      end
      entries
    rescue Nokogiri::XML::SyntaxError
      []
    end

    def self.coordinates(coordinate_string)
      long, lat, elvtn = coordinate_string.split(',')
      {
        latitude: lat,
        longitude: long,
        elevation: elvtn
      }
    end
  end
end
