require 'rails_helper'

describe KMLManager::KMLDownloader do
  let (:cta_rail_kml_url)    { "https://data.cityofchicago.org/download/m3d6-pubu/application/xml" }
  let (:cta_station_kml_url) { "https://data.cityofchicago.org/download/bs96-uama/application/xml" }
  let (:missing_url)         { "https://data.cityofchicago.org/download/bs-uama/application/xml" }
  let (:invalid_url)         { "ttpS://data.city.of.chicago.org/download/" }

  let (:dummy)                 { "dummy_file_name" }
  let (:cta_rail_file_name)    { "cta_rail_lines" }
  let (:cta_station_file_name) { "cta_train_stations" }

  let (:data_directory)        { Rails.root.join('lib', 'data') }

  after(:each) do
    FileUtils.rm_f(Dir.glob("#{data_directory}/*"))
  end

  it "Downloads a file for cta rail KML data", :vcr do
    downloaded_file_path = KMLManager::KMLDownloader.
      download_KML(cta_rail_kml_url, cta_rail_file_name)

    expect(downloaded_file_path.exist?).to be_truthy
    expect(downloaded_file_path.file?).to be_truthy
  end

  it "Downloads a file for cta station KML data", :vcr do
    downloaded_file_path = KMLManager::KMLDownloader.
      download_KML(cta_station_kml_url, cta_station_file_name)

    expect(downloaded_file_path.exist?).to be_truthy
    expect(downloaded_file_path.file?).to be_truthy
  end

  it "Creates a backup of older file if different", :vcr do
    # To simulate a different file we're going to download the rail KML file
    # under the station KML file name
    backup_file_name = data_directory.join("#{cta_station_file_name}.bak")

    [cta_station_kml_url, cta_rail_kml_url].each do |url|
      KMLManager::KMLDownloader.download_KML(url, cta_station_file_name)
    end

    expect(backup_file_name.exist?).to be_truthy
    expect(backup_file_name.file?).to be_truthy
  end

  it "Does not keep a backup if older file is the same", :vcr do
    backup_file_name = data_directory.join("#{cta_station_file_name}.bak")

    [cta_station_kml_url, cta_station_kml_url].each do |url|
      KMLManager::KMLDownloader.download_KML(url, cta_station_file_name)
    end

    expect(backup_file_name.exist?).to be_falsey
    expect(backup_file_name.file?).to be_falsey
  end

  it "raises an error for invalid url", :vcr do
    expect{KMLManager::KMLDownloader.download_KML(invalid_url, dummy)}.to raise_error
  end

  it "raises an error for 404", :vcr do
    expect{KMLManager::KMLDownloader.download_KML(missing_url, dummy)}.to raise_error(OpenURI::HTTPError)
  end
end
