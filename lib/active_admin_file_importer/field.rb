# frozen_string_literal: true

module ActiveAdminFileImporter
  class Field
    MAX_ORDER = 9999

    attr_accessor :name, :raw, :processed, :hidden, :order

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

    def show
      !@hidden
    end

    def order
      @order || MAX_ORDER
    end

    def order!(value)
      @order = value
    end

    def raw!(value)
      @raw = value
      @processed = raw
    end
  end
end
