# frozen_string_literal: true

require_relative "letter_opener_db/version"
if defined?(Rails)
  require "letter_opener_db/railtie"
  require "letter_opener_db/engine"
  require "generators/letter_opener_db/install/install_generator"
  require "letter_opener_db/delivery_method"
end

module LetterOpenerDb
  class Error < StandardError; end
end
