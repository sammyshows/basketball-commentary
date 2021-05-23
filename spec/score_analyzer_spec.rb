# frozen_string_literal: true

require 'score_analyzer'

describe ScoreAnalyzer do
  it 'should analyze that there are 25 games' do
    score_analyzer = ScoreAnalyzer.new(ENV.fetch('RAPIDAPI_KEY'))
    expect(score_analyzer.analyze).to eq '25 games closest score 1 1'
  end
end
