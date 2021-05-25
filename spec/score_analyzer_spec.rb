# frozen_string_literal: true

require 'score_analyzer'

describe ScoreAnalyzer do
  it 'should return the arena Barclays Center' do
    score_analyzer = ScoreAnalyzer.new(ENV.fetch('RAPIDAPI_KEY'))
    expect(score_analyzer.game_details(0, 'arena')).to eq 'Barclays Center'
  end

  it 'should return the status of the game as Finished' do
    score_analyzer = ScoreAnalyzer.new(ENV.fetch('RAPIDAPI_KEY'))
    expect(score_analyzer.game_details(4, 'statusGame')).to eq 'Finished'
  end

  it 'should return the city is Phoenix' do
    score_analyzer = ScoreAnalyzer.new(ENV.fetch('RAPIDAPI_KEY'))
    expect(score_analyzer.game_details(3, 'city')).to eq 'Phoenix'
  end
end
