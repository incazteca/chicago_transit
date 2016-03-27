require 'rails_helper'

describe KMLManager::KMLParser do
  let(:multi_coord_valid_kml)   { Rails.root.join('spec', 'data', 'test_cta_rails.kml') }
  let(:valid_kml)               { Rails.root.join('spec', 'data', 'test_cta_stations.kml') }
  let(:invalid_kml)             { Rails.root.join('invalid.kml') }
  let(:empty_file)              { Rails.root.join('empty_file') }
  let(:non_existant_file)       { Rails.root.join('non_existant_file') }

  context 'KML file multiple coordinates per entry' do
    it "returns an array of hash from a valid Kml file with array of hash" do
      results = KMLManager::KMLParser.parse(multi_coord_valid_kml)

      expect(results).to be_a(Array)
      expect(results[0]).to include(:name, :coordinates)
      expect(results[0][:coordinates][0]).to include(:latitude, :longitude, :elevation)
      expect(results.count).to be > 0
    end

  end

  context 'KML file with single coordinate per entry' do
    it "returns an array of hash from a valid Kml file" do
      results = KMLManager::KMLParser.parse(valid_kml)

      expect(results).to be_a(Array)
      expect(results[0]).to include(:name, :latitude, :longitude, :elevation)
      expect(results.count).to be > 0
    end
  end

  context 'other file handling' do
    it "returns an empty array from an invalid file" do
      results = KMLManager::KMLParser.parse(invalid_kml)

      expect(results).to be_a(Array)
      expect(results.count).to eq 0
    end

    it "returns an empty array from an empty file" do
      results = KMLManager::KMLParser.parse(empty_file)

      expect(results).to be_a(Array)
      expect(results.count).to eq 0
    end

    it "returns an empty array from a nonexistant file" do
      results = KMLManager::KMLParser.parse(non_existant_file)

      expect(results).to be_a(Array)
      expect(results.count).to eq 0
    end

    it "raises error on string being passed in" do
      expect { KMLManager::KMLParser.parse('foo') }.to raise_error
    end
  end
end
