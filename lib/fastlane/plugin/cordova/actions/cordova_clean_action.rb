require_relative '../helper/cordova_helper'

module Fastlane
  module Actions
    class CordovaCleanAction < Action
      def self.run(params)
        platform = Actions.lane_context[SharedValues::PLATFORM_NAME]

        Helper::CordovaHelper.ensure_platform(platform)
        FastlaneCore::CommandExecutor.execute(command: "npx --no-install cordova clean #{platform.to_s}",
                                              print_all: true,
                                              print_command: true)

        if params[:rm_platform]
          Helper::CordovaHelper.platform_rm(platform)
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Clean Cordova build"
      end

      def self.details
        "Run cordova clean command"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :rm_platform,
                                       env_name: "FL_CORDOVA_RM_PLATFORM",
                                       description: "Also remove platform",
                                       is_string: false,
                                       default_value: false)
        ]
      end

      def self.output
        []
      end

      def self.authors
        ['jargon']
      end

      def self.is_supported?(platform)
        true
      end

      def self.example_code
        [
          "cordova_clean",
          "cordova_clean(rm_platform: true)"
        ]
      end

      def self.category
        :building
      end
    end
  end
end
