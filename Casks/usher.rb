cask "usher" do
  version "1.0.0"
  sha256 "9d453fe7ce1b760b6393c9c8dfa1df48fec35c9a8bfcb35ad22b08edd8f50d82"

  url "https://github.com/soheik/Usher/releases/download/v#{version}/Usher-#{version}.zip"
  name "Usher"
  desc "Set default apps for file extensions on macOS"
  homepage "https://github.com/soheik/Usher"

  app "Usher.app"

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr",
                     args: ["-dr", "com.apple.quarantine", "#{staged_path}/Usher.app"]
    end
  end
end
