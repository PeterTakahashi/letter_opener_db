# frozen_string_literal: true

require_relative "lib/letter_opener_db/version"

Gem::Specification.new do |spec|
  spec.name = "letter_opener_db"
  spec.version = LetterOpenerDb::VERSION
  spec.authors = ["Peter Takahashi", "Seiya Takahashi"]
  spec.email = ["seiya4@icloud.com"]

  spec.summary = "Save mail sending history to DB (like letter_opener)"
  spec.description   = "A gem that stores ActionMailer emails in the database and allows searching."
  spec.homepage      = "https://github.com/PeterTakahashi/letter_opener_db"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = 'https://github.com/PeterTakahashi/letter_opener_db/blob/main/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib", "app"]
end
