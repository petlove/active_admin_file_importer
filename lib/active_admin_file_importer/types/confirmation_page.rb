# frozen_string_literal: true

module ActiveAdminFileImporter
  module Types
    class ConfirmationPage < Base
      def build!
        build_instructions_page
        build_instructions_link if @link
        build_confirmation_page
        build_process_api
        build_confirm_api
      end

      private

      def build_instructions_link
        path = instructions_path(:path)
        link = @label

        @resource.action_item(instructions_name, only: :index, label: @label) do
          link_to(link, send(path))
        end
      end

      def build_instructions_page
        process_api_path = build_name(process_name, :admin, admin_pluralized)
        instructions_partial = "admin/#{admin_pluralized}/#{@name}/instructions"
        page_title = @label

        @resource.send(:collection_action, instructions_name, method: :get) do
          @route = process_api_path
          @instructions_partial = instructions_partial
          @page_title = page_title

          render "#{ActiveAdminFileImporter::Core.gem_name}/confirmation_page/instructions"
        end
      end

      def build_process_api
        redirect_success = confirmation_path(:path)
        redirect_error = instructions_path
        type = self

        @resource.send(:collection_action, process_name, method: :post) do
          redirect_to send(redirect_success, ActiveAdminFileImporter::Core.process!(type, params))
        rescue StandardError => e
          raise if Rails.env.development?

          Honeybadger.notify(e)
          redirect_to redirect_error, alert: "Erro: #{e}"
        end
      end

      def build_confirm_api
        redirect_success = origin_path
        redirect_error = instructions_path
        type = self

        @resource.send(:member_action, confirm_name, method: :post) do
          redirect_to send(redirect_success), notice: ActiveAdminFileImporter::Core.confirm!(type, params)
        rescue StandardError => e
          raise if Rails.env.development?

          Honeybadger.notify(e)
          redirect_to redirect_error, alert: "Erro: #{e}"
        end
      end

      def build_confirmation_page
        confirm_api_path = build_name(confirm_name, :admin, admin)
        page_title = @label
        type = self

        @resource.send(:member_action, confirmation_name, method: :get) do
          @route = confirm_api_path
          @page_title = page_title
          @execution = type.store.find!(params[:id])

          render "#{ActiveAdminFileImporter::Core.gem_name}/confirmation_page/confirmation"
        end
      end

      def confirmation_path(suffix = nil)
        build_name(confirmation_name, :admin, @admin, suffix)
      end

      def instructions_path(suffix = nil)
        build_name(instructions_name, :admin, admin_pluralized, suffix)
      end

      def origin_path
        build_name(:admin, admin_pluralized, :path)
      end

      def confirmation_name
        build_name(@name, :confirmation)
      end

      def instructions_name
        build_name(@name, :instructions)
      end

      def process_name
        build_name(@name, :process)
      end

      def confirm_name
        build_name(@name, :confirm)
      end
    end
  end
end
