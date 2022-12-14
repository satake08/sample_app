require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.hosts.clear
end

#アプリケーションのひな型作成→ターミナル内に「rails new アプリケーション名」でENT アプリケーション名：sample_app
#ホストを許可→config/environments/development.rb内一番下のendの上に「config.hosts.clear」と記述
#モデルの作成→ターミナル内「rails g model モデル名」でENT モデル名：List
 #モデルのカラム作成→db/migrate/作成日時(数字の羅列)_create_lists.rb内に「title（タイトル）、body（本文）(どちらもカラム)」を
  #「t.データ型 :カラム名」の形式で「create_table :lists do |t|」の下に記述
 #テーブルの作成→ターミナルで「rails db:migrate」を実行
#コントローラーの作成(homesコントローラ)→ターミナル内で「rails g controller コントローラ名」実行 コントローラ名：homes
 #アクションの追加→app/controllers/homes_controller.rb内に「def top end」を３行に分けて記述
 #ルーティングを作成→config/routes.rb内に「HTTPメソッド 'URL' => 'コントローラ#アクション'」を記述
 #ビューを作成→app/viewsの「homes」右クリ→「New File」クリックで作成→ファイル名の変更は「homes」右クリで「Rename」 ファイル名：top.html.erb
#＊ターミナルで「rails g controller homes top」実行でコントローラー作成からビュー作成までできる
 #config/routes.rb内の「get 'homes/top'」を「get '/top' => 'homes#top'」に書き換える
#Listsコントローラを作成→ターミナルで「rails g controller lists new index show edit」実行