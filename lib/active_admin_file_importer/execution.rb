# frozen_string_literal: true

module ActiveAdminFileImporter
  class Execution
    attr_accessor :id, :items, :count, :warning, :repeated, :successed, :errored

    def initialize(id)
      @id = id
      @count = 0
      @warning = 0
      @successed = 0
      @errored = 0
      @repeated = 0
    end

    def build_items(items)
      @items = items
      @count = items.length
      @repeated = handle_repateds!
      @successed = items.filter(&:success).length
      @errored = items.filter(&:error).length
      @warning = items.filter(&:warning).length
    end

    def columns
      @items.flat_map { |item| item.show_sorted.flat_map(&:name) }.uniq
    end

    def handle_repeateds!
      @items
        .group_by(&:digest)
        .filter { |_digest, values| values.length > 1 }
        .flat_map { |_key, values| values }
        .each(&:repeated!)
        .length
    end

    def numbers(kind)
      items
        .filter(&kind)
        .map(&:number)
        .join(', ')
    end
  end
end
