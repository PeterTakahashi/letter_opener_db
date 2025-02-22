# LetterOpenerDb

**LetterOpenerDb** は、Rails アプリケーションで送信されるメールをフックし、ファイルシステムではなくデータベースに保存して、簡単に閲覧・検索・デバッグできるようにする Ruby gem です。  
[letter_opener](https://github.com/ryanb/letter_opener) から着想を得ていますが、ファイルシステムに依存せず、Web インターフェースでメールの内容を確認できるようにしています。

## 作成の背景 (Motivation)

オリジナルの **letter_opener** gem はメールをファイルとして保存しますが、以下のような制限があります:

1. **検索ができない**: ファイルシステムに保存したメールを検索するのは容易ではありません。
2. **サーバーを増やした場合の問題**: ステージング環境などで複数台のサーバーを起動すると、メールが各サーバーのファイルシステムに分散してしまい、すべてのメールを一元的に閲覧できなくなります。

こうした問題を解決するため、**LetterOpenerDb** ではメールをデータベースに保存し、下記が可能になります:

- **件名や本文等の検索**
- **マルチサーバー環境でも一括管理** して全メールを閲覧

## 特徴 (Features)

- **データベース保存**  
  ActionMailer が送信したすべてのメールをデータベースに保存します。
- **Web インターフェース**  
  Rails エンジンとして組み込み、ブラウザで送信メールを簡単に閲覧できます。
- **シンプルな検索機能**  
  件名や本文をテキスト検索できるため、メールを素早く見つけられます。
- **Rails エンジン**  
  マイグレーション、コントローラ、ビューを含むため、インストールが簡単です。

## インストール (Installation)

アプリケーションの `Gemfile` に以下の行を追加します。  
（プライベートまたはパブリックの Git リポジトリ、あるいはローカルパスを指定可能です）

```ruby
gem 'letter_opener_db'
```

### その後実行:

`bundle install`

### セットアップ (Setup)

1. マイグレーション
   letter_opener_db_mail_records テーブルを作成するため、以下を実行します:

```sh
rails generate letter_opener_db:install
rails db:migrate
```

2. メール送信方法の設定 (Delivery Method)

config/environments/development.rb (または config/environments/test.rb) に以下を追記します:

```ruby
config.action_mailer.delivery_method = :letter_opener_db
```

3. エンジンのマウント (Mount the Engine)

config/routes.rb に以下を追加します:

```ruby
mount LetterOpenerDb::Engine, at: '/letter_opener_db'
```

'/mails' など、お好みのパスを指定することも可能です。

## 使い方 (Usage)

- 開発やテスト環境で、通常どおりメールを送信します。
- http://localhost:3000/letter_opener_db/mail_records (または設定したパス) にアクセスすると、保存されたメールを閲覧できます。
- 一覧・検索
- 送信したメールが時系列で表示されます。
- 件名をクリックすると、宛先や本文を含む詳細情報が表示されます。
- 件名や本文で検索することが可能です。

## 開発 (Development)

1. リポジトリをクローンまたはフォークします。
2. lib ディレクトリや app ディレクトリ内のファイルを必要に応じて編集します。
3. 下記コマンドで変更内容をテストします:
   `bundle exec rspec`
4. 別の Rails アプリにローカルパスで参照して動作確認も可能です:

`gem 'letter_opener_db', path: '../letter_opener_db'`

## コントリビュート (Contributing)

機能追加や修正の提案は歓迎します！手順は以下のとおりです: 1. このリポジトリをフォークしてください。 2. 新しいブランチを作成します (git checkout -b feature/my-feature)。 3. 変更をコミットします (git commit -m 'Add my feature')。 4. ブランチをプッシュします (git push origin feature/my-feature)。 5. 変更内容を明確に説明した Pull Request を作成してください。

## ライセンス (License)

このプロジェクトは MIT License のもとで公開されています。
