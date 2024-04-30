module Fastlane
  module Helper
    class CordovaHelper
      def self.platform_add(platform)
        if File.directory?("./platforms/#{platform}")
          UI.message("Platform #{platform} already exists. Nothing to do")
        else
          FastlaneCore::CommandExecutor.execute(command: "npx --no-install cordova platform add #{platform.to_s}",
                                                print_all: true,
                                                print_command: true)
        end
      end

      def self.platform_rm(platform)
        if File.directory?("./platforms/#{platform}")
          FastlaneCore::CommandExecutor.execute(command: "npx --no-install cordova platform rm #{platform.to_s}",
                                                print_all: true,
                                                print_command: true)
        else
          UI.message("Platform #{platform} not found. Nothing to do")
        end
      end
    end
  end
end
