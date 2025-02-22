LetterOpenerDb::Engine.routes.draw do
  resources :mail_records, only: [:index, :show, :destroy]
end
