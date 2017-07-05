source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'mysql2', '~> 0.3.20'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'therubyracer', platforms: :ruby

gem 'jquery-rails'
gem "jquery-ui-rails"
gem 'jbuilder', '~> 2.5'

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'pry-rails'
  gem 'better_errors'

  gem 'html2slim'

  gem 'rspec-rails', '~> 3.0'
  gem "factory_girl_rails"

  gem 'database_cleaner'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'capistrano'
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-unicorn'
  gem 'capistrano-secrets-yml'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'config'
# シードデータ
gem 'seed-fu', '~> 2.3'
# 認証系
gem 'devise'

gem 'aws-sdk'
# 画像処理とアップロード
gem 'rmagick'
# gem "mini_magick"
gem 'paperclip', '~> 5.0'
# 画像の最適化
gem 'image_optim'
gem 'image_optim_pack'
# Slackの通知管理
gem 'slack-notifier'
# 1対多formの構築
gem 'cocoon'
# フロント
gem 'bootstrap-sass'
gem 'kaminari'
gem 'slim-rails'
gem 'font-awesome-rails'
# パンくず
gem 'breadcrumbs_on_rails'
# markdown対応
gem 'redcarpet', '~> 2.3.0'
gem 'coderay'
# 検索機能のサジェスト
gem 'rails4-autocomplete'
