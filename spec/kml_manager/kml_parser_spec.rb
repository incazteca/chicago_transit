require 'rails_helper'

describe KMLManager::KMLParser do
  let (:valid_kml)         { 'test_cta_stations.kml' }
  let (:invalid_kml)       { 'invalid.kml' }
  let (:empty_file)        { 'empty_file' }
  let (:non_existant_file) { 'non_existant_file' }


  it "returns an array of hash from a valid Kml file" do
    results = KMLManager::KMLParser.parse(
      Rails.root.join('spec', 'data', valid_kml))

    expect(results).to be_a(Array)
    expect(results[0]).to include(:name, :latitude, :longitude, :elevation)
    expect(results.count).to be > 0
  end

  it "returns an empty array from an invalid file" do
    results = KMLManager::KMLParser.parse(
      Rails.root.join('spec', 'data', invalid_kml))

    expect(results).to be_a(Array)
    expect(results.count).to eq 0
  end

  it "returns an empty array from an empty file" do
    results = KMLManager::KMLParser.parse(
      Rails.root.join('spec', 'data', empty_file))

    expect(results).to be_a(Array)
    expect(results.count).to eq 0
  end

  it "returns an empty array from a nonexistant file" do
    results = KMLManager::KMLParser.parse(
      Rails.root.join('spec', 'data', non_existant_file))

    expect(results).to be_a(Array)
    expect(results.count).to eq 0
  end

  it "raises error on string being passed in" do
    expect { KMLManager::KMLParser.parse('foo') }.to raise_error
  end
end
