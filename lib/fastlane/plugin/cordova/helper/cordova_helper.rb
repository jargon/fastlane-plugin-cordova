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

      def self.ensure_platform(platform)
        if !File.directory?("./platforms/#{platform}")
          self.platform_add(platform)
        end
      end

      def self.load_config_xml(path)
        UI.message("Load Cordova config.xml file from: #{path}")

        UI.user_error!("File not found: #{path}") unless File.exist?(path)

        xml = File.read(path)
        doc = Nokogiri::XML(xml)

        return doc
      end

      def self.save_config_xml(path, xml_doc)
        UI.message("Save config.xml to file: #{path}")

        File.write(path, xml_doc.to_xml)
      end

      def self.find_widget(xml_doc)
        return xml_doc.xpath("/w:widget", { "w" => "http://www.w3.org/ns/widgets" })
      end

      def self.update_version(widget_node, new_version)
        widget_node["version"] = new_version
      end
    end
  end
end
