namespace :letter_opener_db do
  namespace :install do
    desc "Run the LetterOpenerDb install generator (copy migrations)"
    task :migrations => :environment do
      Rails::Generators.invoke("letter_opener_db:install")
    end
  end
end
