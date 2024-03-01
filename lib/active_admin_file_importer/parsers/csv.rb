# frozen_string_literal: true

require 'csv'

module ActiveAdminFileImporter
  module Parsers
    class Csv < Base
      def parse!(params)
        raise 'Arquivo inválido' unless params[:file]

        File
          .open(params[:file], 'r:bom|utf-8')
          .read
          .gsub("\r\n", "\n")
          .then { |data| CSV.parse(data, **csv_settings) }
          .map(&:to_h)
          .reject { |row| row.values.compact.length.zero? }
          .map do |row|
            count = row.keys.length
            row
              .each_with_index
              .map do |field, index|
                ActiveAdminFileImporter::Field
                  .new(field[0], field[1])
                  .tap { |f| f.order!(ActiveAdminFileImporter::Field::MAX_ORDER - count + index) }
              end
          end
      end

      def csv_settings
        { headers: true, col_sep: ';', row_sep: :auto, encoding: 'UTF-8', quote_char: '|' }
          .merge(@settings.slice(:col_sep, :encoding))
      end
    end
  end
end
