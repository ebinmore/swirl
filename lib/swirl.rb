require "swirl/version"
require "swirl/parser"

module Swirl
  def self.new
    Parser.new
  end
end
