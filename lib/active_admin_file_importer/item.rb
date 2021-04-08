# frozen_string_literal: true

require 'json'
require 'digest'

module ActiveAdminFileImporter
  class Item
    attr_accessor :number, :index, :warning, :error, :fields, :repeated

    def initialize(params)
      @number = params[:number]
      @warning = params[:warning]
      @error = params[:error]
      @fields = params[:fields] || []
    end

    def success
      !@error
    end

    def add_field(name, raw)
      field = Field.new(name, raw)
      @fields << field

      field
    end

    def show_sorted
      @fields.filter { |f| !f.hidden }.sort_by { |a| a.order || 9999 }
    end

    def field(name)
      @fields.find { |field| field.name == name }
    end

    def digest
      Digest::MD5.hexdigest(@fields.to_json)
    end

    def error!(message)
      @error = [error, message].compact.join("\n")
    end

    def warning!(message)
      @warning = [warning, message].compact.join("\n")
    end

    def repeated!
      @repeated = true
      warning!('Item repetido!')
      self
    end
  end
end
