# frozen_string_literal: true

module ActiveAdminFileImporter
  class Field
    attr_accessor :name, :raw, :processed, :hidden

    def initialize(name, raw)
      @name = name
      @raw = raw
      @processed = raw
    end

    def process!
      @processed = yield raw
      self
    end

    def hide!
      @hidden = true
      self
    end
  end
end
