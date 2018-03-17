Rails.application.routes.draw do

  root to: 'messages#top'

  resources :messages do
    collection do # idなどを必要としない固有のルーティング設定
      post :confirm
    end
  end

end
