module Fastlane
  module Actions
    class CleanCordovaAction < Action
      def self.run(params)
        FastlaneCore::CommandExecutor.execute(command: "npx --no-install cordova clean",
                                              print_all: true,
                                              print_command: true)
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
        []
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
          "clean_cordova()"
        ]
      end

      def self.category
        :building
      end
    end
  end
end
