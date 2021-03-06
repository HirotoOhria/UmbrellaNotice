# :closed_umbrella: Umbrella Notice (天気予報通知アプリ)

2020/8/29 Bitbucket --> GitHub へ移行

## アプリケーションの概要

LINE公式アカウントにて、毎朝設定した地域の天気予報を取得し、雨が降る場合のみ通知を送信するアプリケーションです。

<!--
 - [Web ホームページ](https://www.umbrellanotice.work)
 - [LINE 公式アカウント](https://lin.ee/Q28r1Nv)
-->

**[公開終了しました]**
 - ~~Web ホームページ~~
 - ~~LINE 公式アカウント~~

Webはテストユーザーログインで、LINE公式アカウントは登録無しでサクッと利用できます。<br>
ぜひ遊びに来てください！:coffee:

※テストユーザーは、メールアドレスの変更など破壊的操作は完了しない仕様になっています。

## アプリケーションの画面

- ### Webホームページ

![Webホームページ](https://user-images.githubusercontent.com/60952535/93661860-42bde100-fa96-11ea-9320-de6572b073e1.png)

- ### Line 公式アカウント

|天気予報通知|リッチメニュー|
|---|---|
|![天気予報通知](https://user-images.githubusercontent.com/60952535/91653870-42f23e80-eadf-11ea-9367-78d32592964a.png)|![リッチメニュー](https://user-images.githubusercontent.com/60952535/91653871-44236b80-eadf-11ea-960d-38e622246800.png)|

## クラウドアーキテクチャ

画像をクリックすると、より大きな画像でご覧いただけます。

![クラウドアーキテクチャ](https://user-images.githubusercontent.com/60952535/93044438-d99e2e00-f68f-11ea-9c34-1ceef478bb03.png)

## 特に見ていただきたい点

- ### インフラ面
    - Dockerを使い、ECS(EC2)/ECRで本番環境をスケーラブルに運用している点。
    - Terraformを使い、本番環境インフラをコードで管理している点。
    - CDNを使い、アセットファイルを高速配信している点、
    - CircleCIを使い、CI/CDパイプラインを構築している点。

- ### バックエンド面
    - 外部API（OpenWeatherMapAPI,GeocodingAPI）を利用し、機能を追加している点。
    - Sidekiqを採用し、大規模アクセスを考慮した非同期処理を実装している点。
    - APIパラメータのバリデーションを別クラスに切り出し、可読性・保守性を向上している点。
    - 配信用のLINEメッセージを動的に作成できる[独自ライブラリ](https://github.com/HirotoOhria/line_message_creator)を作成し、組み込んでいる点。
    - E2Eテストにて高カバレッジ(98.17%)を実現している点。

- ### フロントエンド面
    - セマンティックHTMLを使用し、HTML構造をマークアップしている点。
    - TypeScriptを採用し、型安全なコードを記述している点。
    - Next.jsを採用し、SSRを実装している点。
    - Atomic DesignやPresentational / Container設計手法を採用し、スケーラブルに実装している点。
    - Amplifyを採用し、AWS Cognitoを利用したログイン/ログアウトを実装している点。

## アプリケーションの機能

- ### LINE公式アカウント
    - 指定した時間に天気予報を通知
    - フォロー時
        - 位置情報設定
            - テキスト送信
            - 位置座標送信
    - リッチメニュー
        - 天気予報の手動通知
        - 天気予報の通知時間変更
        - サイレント通知 ON/OFF
        - 天気予報の位置設定の変更
        - アカウント紐付けIDの発行
        - プロフィール画面リンク

- ### Webサイト
    - 静的ページ
        - ホーム
        - 利用規約
        - プライバシーポリシー
    - アカウント
        - アカウント登録
        - ログイン / ログアウト
        - アカウント削除
        - ユーザー情報の変更

- ### Web API
    - 各リソースのCRUD
    - LINE Messaging API のハンドリング
    - AWS Lambda イベントを受け取り、非同期処理

## アプリケーションの使用技術

- **仮想化技術**
   - Docker
   - Docker Compose
   - ENTRYKIT

- **フロントエンド**
   - Nginx
   - React
        - TypeScript
        - Hooks
        - Redux
        - Redux Thunk
        - Amplify
   - Next.js

- **バックエンド**
   - Unicorn
   - Rails
        - Active Model Serializers
        - Sidekiq
        - Redis Rails

- **デプロイ**
    - CircleCI
- **テスト,品質管理**
    - RSpec
    - RuboCop
    - SimpleCov
    - ESLint
    - Prettier

- **インフラ**
    - Terraform
    - AWS ECS (EC2)
        - Nginx
        - Unicorn
        - Sidekiq
    - AWS ECR
    - AWS ELB (ALB)
    - AWS AutoScaling
    - AWS VPC
    - AWS Route53
    - AWS CertificateManager

- **データーベース**
    - MySQL
    - AWS RDS

- **キャッシュストア**
    - AWS ElasticCache (Redis)

- **定期イベント**
    - AWS Lambda

- **ログ管理**
    - AWS CloudWatch

- **機密情報管理**
    - Rails Credentials
    - AWS SystemsManager (パラメータストア)

- **LINE**
    - 公式アカウント
    - リッチメニュー

- **外部API**
    - LINE
        - Login API
        - Messaging API
            - 応答メッセージ
            - プッシュメッセージ
            - リッチメニュー
            - クイックリプライ
    - OpenWeatherMap API (天気予報)
    - Geocoding API (住所→座標変換)

## 開発環境
- Visual Studio Code
    - TypeScript - v3.7.5
    - React -  v16.13.1

- RubyMine
    - Ruby - v2.7.1
    - Rails - v6.0.3.2

- Docker
    - コンテナ構成
        - Nginx
        - Unicorn
        - Sidekiq
        - Redis
        - MySQL

- CircleCI
- RuboCop
- RSpec
- SimpleCov
