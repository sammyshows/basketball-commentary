# frozen_string_literal: true

require 'score_analyzer'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr_cassettes'
  config.hook_into :webmock
end

describe ScoreAnalyzer do
  it 'should analyze that there are 25 games' do
    VCR.use_cassette('teams') do
      score_analyzer = ScoreAnalyzer.new('TEST_RAPIDAPI_KEY')
      expect(score_analyzer.analyze).to eq '25 games'
    end
  end
end
