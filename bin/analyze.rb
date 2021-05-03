#!/usr/bin/env ruby
$LOAD_PATH << File.join(File.dirname(__FILE__), "..", "lib")

require 'score_analyzer'

score_analyzer = ScoreAnalyzer.new(ENV.fetch('RAPIDAPI_KEY'))
puts score_analyzer.analyze
