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
      @repeated = handle_repeateds!
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
        .flat_map { |_key, values| values.sort_by {|v| v.index}[1..] }
        .each(&:repeated!)
        .length
    end

    def warnings
      @items.filter(&:warning)
    end

    def errors
      @items.filter(&:error)
    end

    def repeateds
      @items.filter(&:repeated)
    end
  end
end
