require_relative '../helper/cordova_helper'

module Fastlane
  module Actions
    class CordovaPlatformAction < Action
      def self.run(params)
        action = params[:action]
        platform = params[:platform] == "" ? Actions.lane_context[SharedValues::PLATFORM_NAME] : params[:platform]
        version = params[:version]

        case action
        when "add"
          Helper::CordovaHelper.platform_add(platform, version)
        when "rm"
          Helper::CordovaHelper.platform_rm(platform)
        else
          UI.user_error!("Unknown action '#{action}'. Don't know what to do")
        end
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Add or remove a Cordova platform"
      end

      def self.details
        "Runs cordova platform <action> where action can be either 'add' or 'rm'."
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :action,
                                       env_name: "FL_CORDOVA_PLATFORM_ACTION",
                                       description: "Runs cordova platform <action>. Action can be either 'add' or 'rm'",
                                       verify_block: proc do |value|
                                         UI.user_error!("Action should be either add or rm") unless ['add', 'rm'].include? value
                                       end),
          FastlaneCore::ConfigItem.new(
                                        key: :platform,
                                        env_name: "FL_CORDOVA_PLATFORM",
                                        description: "Platform to add or remove. Must be one of the platforms supported by Cordova. Defaults to current fastlane platform",
                                        is_string: true,
                                        default_value: '',
                                        verify_block: proc do |value|
                                          UI.user_error!("Platform should be one of: android, browser, electron, ios") unless ['', 'android', 'browser', 'electron', 'ios'].include? value
                                        end
                                      ),
          FastlaneCore::ConfigItem.new(
                                        key: :version,
                                        env_name: "FL_CORDOVA_PLATFORM_VERSION",
                                        description: "Platform version. Only used for platform add. Defaults to whatever Cordova thinks it should be",
                                        is_string: true,
                                        default_value: '',
                                      )
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
          "cordova_platform(action: 'add', version: '13.0.0')",
          "cordova_platform(action: 'rm')"
        ]
      end

      def self.category
        :building
      end
    end
  end
end
