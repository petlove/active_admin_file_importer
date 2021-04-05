# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'

module SimpleCov
  def self.configure
    SimpleCov.formatter = SimpleCov::Formatter::Console
    SimpleCov.start do
      add_filter { |source_file| cover?(source_file.lines) }
      add_filter '/spec/'
    end
  end

  def self.cover?(lines)
    !lines.detect { |line| line.src.match?(/(def |attributes)/) }
  end
end
