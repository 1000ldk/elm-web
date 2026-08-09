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