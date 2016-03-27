namespace :cta do
  desc 'Load up current CTA Stations'
  task :load_stations do
    puts "placeholder"
  end

  desc 'Load up current CTA Rails'
  task :load_rails => :environment do

    CTA_RAIL_KML_URL =  "https://data.cityofchicago.org/download/m3d6-pubu/application/xml"
    CTA_STATION_KML_URL = "https://data.cityofchicago.org/download/bs96-uama/application/xml"

    CTA_RAIL_FILE_NAME =    "cta_rail_lines"
    CTA_STATION_FILE_NAME = "cta_train_stations"

    DATA_DIRECTORY = Rails.root.join('lib', 'data')

    cta_rail_kml = KMLManager::KMLDownloader.download_kml(CTA_RAIL_KML_URL, CTA_RAIL_FILE_NAME)

    cta_rail_results = KMLManager::KMLParser.parse(cta_rail_kml)

    cta_rail_results.each do |result|
      puts result
    end
  end
end
