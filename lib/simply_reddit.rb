# frozen_string_literal: true

require_relative "simply_reddit/version"

module SimplyReddit
  class Error < StandardError; end
  def self.hi(language = "english")
    translator = Translator.new(language)
    puts translator.hi
  end
end
