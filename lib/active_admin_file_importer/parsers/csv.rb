# frozen_string_literal: true

require 'csv'

module ActiveAdminFileImporter
  module Parsers
    class Csv < Base
      def parse!(params)
        raise 'Arquivo inválido' unless params[:file]

        File
          .open(params[:file]).read.gsub("\r\n", "\n")
          .then { |data| CSV.parse(data, csv_settings) }
          .map(&:to_h)
          .reject { |item| item.values.compact.length.zero? }
      end

      def csv_settings
        { headers: true, col_sep: ';', row_sep: :auto, encoding: 'UTF-8', quote_char: '|' }
          .merge(@settings.slice(:col_sep, :encoding))
      end
    end
  end
end
