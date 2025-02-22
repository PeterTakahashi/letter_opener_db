require "rails/generators"
require "rails/generators/migration"

module LetterOpenerDb
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('templates', __dir__)

    def self.next_migration_number(_dirname)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end

    def copy_migrations
      migration_template(
        "create_letter_opener_db_mail_records.rb",
        "db/migrate/create_letter_opener_db_mail_records.rb"
      )
    end
  end
end
