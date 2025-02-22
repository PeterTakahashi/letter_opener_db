module LetterOpenerDb
  class Railtie < ::Rails::Railtie
    initializer "letter_opener_db.add_delivery_method" do
      ActiveSupport.on_load(:action_mailer) do
        require "letter_opener_db/delivery_method"
        ActionMailer::Base.add_delivery_method :letter_opener_db, LetterOpenerDb::DeliveryMethod
      end
    end
  end
end
