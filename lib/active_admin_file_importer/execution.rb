# frozen_string_literal: true

module ActiveAdminFileImporter
  class Execution
    attr_accessor :id, :items, :count, :warning, :successed, :errored

    def initialize(id)
      @id = id
      @count = 0
      @warning = 0
      @successed = 0
      @errored = 0
    end

    def build_items(items)
      @items = items
      @count = items.length
      @successed = items.filter(&:success).length
      @errored = items.filter(&:error).length
      @warning = items.filter(&:warning).length
    end

    def lines(kind)
      items.filter(&kind).map(&:number).join(', ')
    end
  end
end
