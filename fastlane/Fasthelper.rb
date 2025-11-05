module SharedFastlane
  def self.flutter_root(fastfile_dir:)
    File.expand_path('../..', fastfile_dir)
  end

  private_class_method :flutter_root

  def self.service_account_path(file_name:, fastfile_dir:)
    root = flutter_root(fastfile_dir: fastfile_dir)
    File.join(root, 'fastlane', 'service_account', file_name)
  end

  def self.validate_file_exists(file_path:, file_name:)
    FastlaneCore::UI.user_error!("❌ #{file_name} not found at: #{file_path}") unless File.exist?(file_path)
    FastlaneCore::UI.message("✅ #{file_name} found")
  end

  def self.get_apk_path(relative_path:, fastfile_dir:)
    root = flutter_root(fastfile_dir: fastfile_dir)
    File.join(root, 'build', 'app', 'outputs', relative_path)
  end
end
