# Rakumeshi

## サービス概要
![](https://i.gyazo.com/fa2eb84d144d66d366ae30c702d82748.jpg)
料理を作るのがおっくうな方や食事を作るのに時間をかけたくない方。なるべく安くかつ、早くといった効率よく食事を作るor食べるれることを共有できればいいなと思いつくりました。
対象のユーザーは、独身の方、料理を作るのが苦手な方、食事を作る、食べる時間を短縮して少しでも活動時間を増やしたい方、生産性に捧げている方等になります。
基本的にブログ形式の投稿となります。
## 作る上で意識したこと
一つ一つの機能自体はいたってシンプルなものばかりですが、ユーザー目線になってこれがあるといいなと思ったことを、小さく小さく細切にして実装しました。一気に作業をしてしまうと全体のバランスが崩れた時の修正が大変です。小分けにして作業することで、なにがどう変わったか把握しやすいですし、小さい段階なら修正も小さく済んで修正時間も早いです。また、少しずつ良くなる実感が味わえてモチベーションアップにつながり、作業も楽しく続けれるようになりました。
投稿機能に関しては、ユーザーが任意で改行が反映できるようにと、railsのヘルパーメソッド「simple_format」を採用しています。

**他にも、branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めました。**

## DEMO
![2cb737bb6af50b9d2802f9cc1e4bc641](https://user-images.githubusercontent.com/72346611/104146320-a38a7400-540d-11eb-8ca0-5417cf3eee72.gif)

![2871034e206e5d45ad688190c4376ced](https://user-images.githubusercontent.com/72346611/104146883-a9815480-540f-11eb-979f-c281d90878a7.gif)


## URL
https://rakumeshi.herokuapp.com

テストユーザーアカウント

メールアドレス：test@example.com

パスワード：qwer1234

※ページ内には「簡単ログイン（ゲストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

## 開発環境
Ruby 2.6.5

Rails 6.0.0

## ER図
![](https://user-images.githubusercontent.com/72346611/104139438-c8bbba00-53ee-11eb-82d5-c070ff3ee600.png)

## 各種機能＆導入技術
- プラットフォーム（Heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- コードチェック（rubocop）
- ユーザー登録＆ログイン（devise)
- 画像アップロード（active_storage、mini_magick、 AWS S3）
- カレンダー（simple_calendar）
- いいね、コメント投稿、　タグ入力（Ajax）
- アプリケーションメッセージ日本語化(rails-i18n)
- パンくずリスト（gretel
- ページネーション（kaminari)
- 各種API（Google、Facebook,twitter）
- エディタ（vsコード）
## トップページ
![](https://i.gyazo.com/aeb77edb8d4a9518593559591ab6d40a.jpg)

## ログインページ
![](https://i.gyazo.com/2402e961180e10a7aa9f54d0e546c65f.png)

## ユーザー一覧
![](https://i.gyazo.com/c964f379426ea58cb1db57242cf0a648.png)

## マイページ
![](https://i.gyazo.com/b385eb94defa156f41b3969c622385f0.png)

## マイページ 自身の投稿一覧
![](https://i.gyazo.com/f5ddd7ecab8d308e08bcc29329431080.png)

## マイページ　自身がいいね！した投稿一覧
![](https://i.gyazo.com/26e8b99c2509c3a9f8a39c100edc1261.png)

## マイページ フォローしたユーザー一覧
![](https://i.gyazo.com/37bf964e8b92b812aa8e7253088eb25f.png)

## マイページ フォロワー一覧
![](https://i.gyazo.com/a637b94a8064587f83c9f8ac91a857c9.png)




