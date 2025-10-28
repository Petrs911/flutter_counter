module SharedFastlane
  def self.validate_file_exists(file_path:, file_name:)
    FastlaneCore::UI.user_error!("❌ #{file_name} not found at: #{file_path}") unless File.exist?(file_path)
    FastlaneCore::UI.message("✅ #{file_name} found")
  end

  def self.get_apk_path(flavor:, fastfile_dir:)
    flutter_root = File.expand_path('../..', fastfile_dir)
    base_path = File.join(flutter_root, 'build', 'app', 'outputs', 'apk', 'release')

    if flavor.to_s.strip.empty?
      File.join(base_path, 'app-release.apk')
    else
      File.join(base_path, "app-#{flavor}-release.apk")
    end
  end

  def self.get_env_key(base_key, flavor)
    if flavor.to_s.empty?
      base_key
    else
      "#{base_key}_#{flavor.upcase}"
    end
  end
end
