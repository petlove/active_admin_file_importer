# frozen_string_literal: true

module ActiveAdminFileImporter
  class Item
    attr_accessor :number, :warning, :error, :fields

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

    def show
      @fields.filter { |f| !f.hidden }
    end

    def field(name)
      @fields.find { |field| field.name == name }
    end
  end
end
