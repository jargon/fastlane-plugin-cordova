require_relative '../helper/cordova_helper'

module Fastlane
  module Actions
    class CordovaSetVersionAction < Action
      def self.run(params)
        config_path = params[:config_xml_file]
        new_version = params[:new_version]

        config_xml = Helper::CordovaHelper.load_config_xml(config_path)
        widget_node = Helper::CordovaHelper.find_widget(config_xml)

        Helper::CordovaHelper.update_version(widget_node, new_version)
      end

      #####################################################
      # @!group Documentation
      #####################################################

      def self.description
        "Set app version in config.xml"
      end

      def self.details
        "Run cordova clean command"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :new_version,
                                       env_name: "FL_CORDOVA_NEW_VERSION",
                                       description: "Version to set in config.xml"),
          FastlaneCore::ConfigItem.new(key: :config_xml_file,
                                       env_name: "FL_CORDOVA_CONFIG_XML_FILE",
                                       description: "Path to config.xml file to use",
                                       default_value: "./config.xml")
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
          "cordova_set_version(new_version: 3.2.0)"
        ]
      end

      def self.category
        :building
      end
    end
  end
end
