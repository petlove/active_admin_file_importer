# frozen_string_literal: true

module ActiveAdminFileImporter
  class Item
    attr_accessor :number, :warning, :error, :fields

    def initialize(params)
      @number = params[:number]
      @warning = params[:warning]
      @error = params[:error]
      @fields = build_fields(params[:fields])
    end

    def success
      !@error
    end

    def build_fields(param)
      param.to_h.each_with_object({}) { |field, obj| obj[field[0]] = { 'display' => field[1], 'raw' => field[1] } }
    end
  end
end
