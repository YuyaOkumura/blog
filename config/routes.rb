Rails.application.routes.draw do

  class TagSlugConstraints
    def matches?(request)
      paths = request.path_info.split('/').reject(&:blank?)
      is_tag_present = Tag.find_by(slug: paths.first)
      is_tag_present ? true : false
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#root', as: 'root'

  # indexアクションにmonthパラメータと値が含まれていれば、その月の投稿を表示する
  # likeパラメータが含まれていればいいね数順に並べて表示する
  # どちらもついていればそれに対応したページを表示
  resources :articles, only: [:index, :show]
  get '/tags', to: 'tags#index', as: 'tags'
  get '/:slug', to: 'tags#show', constraints: TagSlugConstraints.new, as: 'tag'
  # tagもarticleも同時に検索する
  get '/search', to: 'search#index', as: 'search'
  get '/suggest', to: 'search#suggest', as: 'suggest'
  # お問い合わせ機能。入力内容によって遊びたい
  resources :contacts, only: [:new, :create]
  # いいね作成
  post '/likes', to: 'likes#change_like'

  namespace :admin_writer do
    root to: 'root#root'
    # article配下ではパラメータによってタブを切り替えて下書きとそうでないものを区別する
    resources :articles do
      post 'tag_check', on: :collection
      post 'preview', on: :collection
    end
    resources :tags
  end
end
