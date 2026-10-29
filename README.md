# cloudinary_app

[Cloudinary](https://cloudinary.com/) に画像を保存する写真管理アプリの試作品です。
Ruby on Rails で作られていて、写真の登録・一覧表示・編集・削除ができます。

## 機能

- 写真の登録・一覧表示・詳細表示・編集・削除
- 画像は CarrierWave を通して Cloudinary に保存
- 一覧画面では、Cloudinary の画像変換で 150×150 に切り抜き、角を丸めたサムネイルを表示
- ファイルサイズ（バイト数）はアップロード時に自動で記録
- 同じ操作を JSON API でも実行可能（`/photos.json` など）

## 技術構成

| 項目 | 内容 |
|---|---|
| 言語・フレームワーク | Ruby 4.0.9 / Rails 8.1.4 |
| 画像アップロード | carrierwave, cloudinary |
| 画面 | Bootstrap 5（CDN）, simple_form, Propshaft, importmap, Turbo, Stimulus |
| データベース | 開発・テスト: SQLite3 / 本番: PostgreSQL |
| 本番サーバ | puma |
| 環境変数 | dotenv-rails（`.env` を読み込む） |
| 日本語化 | rails-i18n |
| テスト | RSpec, FactoryBot, Capybara, shoulda-matchers, SimpleCov |

## データモデル

`photos` テーブルだけのシンプルな構成です。

| カラム | 型 | 説明 |
|---|---|---|
| `title` | string | タイトル（必須） |
| `image` | string | Cloudinary 上の画像（必須） |
| `bytes` | integer | ファイルサイズ（0 より大きい値） |
| `created_at` / `updated_at` | datetime | 作成・更新日時 |

## セットアップ

Ruby 4.0.9 が必要です。バージョンは `.ruby-version` と `.tool-versions` に書いてあります。

```bash
% git clone https://github.com/maangie/cloudinary_app.git
% cd cloudinary_app
% bundle config set --local without production
% bundle install
% bin/rails db:migrate
```

プロジェクト直下に `.env` を作り、Cloudinary の認証情報を書きます。
値は Cloudinary のダッシュボードで確認できます。
`.env` は `.gitignore` に入っているので、リポジトリには含まれません。

```bash
% cat > .env
CLOUDINARY_URL=cloudinary://999999999999999:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
CLOUDINARY_API_KEY=999999999999999
CLOUDINARY_API_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxx
```

## 起動

```bash
% bin/rails server -d
% open http://localhost:3000
```

## 停止

```bash
% kill `cat tmp/pids/server.pid`
```

## テスト

```bash
% bundle exec rspec
```

テスト用の画像は `spec/fixtures/` にあります。
テストでは Cloudinary に実際にはアップロードしないので、`.env` がなくても動きます。

## 主なファイル

| ファイル | 役割 |
|---|---|
| `app/models/photo.rb` | `Photo` モデルとバリデーション |
| `app/uploaders/image_uploader.rb` | Cloudinary 用のアップローダー |
| `app/controllers/photos_controller.rb` | 写真の CRUD |
| `app/views/photos/` | 画面と JSON のテンプレート |
| `config/routes.rb` | ルーティング（`/` は写真一覧） |
| `spec/` | RSpec のテスト |
