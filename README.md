# elm-web

# Elmプロジェクトで使ったコマンドまとめ

## 1. パッケージのインストール
Browser.application や Url モジュールを使うために必要。

    elm install elm/url

## 2. npmプロジェクトの初期化(elm-liveを使う場合)

    npm init -y

## 3. elm-liveのインストール(開発サーバー)
毎回 npx でダウンロードされるのを防ぐため、ローカルに入れておく。

    npm install --save-dev elm-live

## 4. 開発サーバーの起動
ファイル変更を検知して自動リビルド&ブラウザリロードしてくれる。

    npx elm-live src/Main.elm --open -- --output=main.js

## 5. 本番用ビルド(まだ使っていないが今後使うもの)
サイズを最適化した main.js を1回だけ出力する。

    elm make src/Main.elm --output=main.js --optimize

## 6. GitHub Pages へのデプロイ

`.github/workflows/deploy.yml` により、`main` ブランチへの push で自動的に
GitHub Pages へ公開される(Pull Request ではビルド確認のみ)。

公開 URL: https://1000ldk.github.io/elm-web/

### 初回だけ必要な設定

リポジトリの **Settings → Pages → Build and deployment → Source** を
**GitHub Actions** に変更する。これをしないとデプロイジョブが失敗する。

### ワークフローがやっていること

1. `elm make src/Main.elm --optimize --output=main.js` でビルド
2. `index.html` の `<base href="/">` を `<base href="/elm-web/">` に書き換え
   (プロジェクトページはサブパス配信のため)
3. `main.js` / `articles/` / `index.html` を `_site/` に配置
4. `index.html` を `404.html` としてもコピー
   (SPA なので `/post/1` などへの直接アクセスを Elm 側で処理させる)

### パスの扱い

- アプリ内リンクと記事の取得は `<base>` 基準の相対パス
  (`about`, `post/1`, `articles/1.md`)
- ルーティングの基準パスは `index.html` からフラグとして Elm に渡し、
  `Route.parseUrl` が URL から取り除く
- そのためローカル(`/` 配信)でも Pages(`/elm-web/` 配信)でも同じコードで動く
