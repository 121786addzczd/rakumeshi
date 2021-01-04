# Rakumeshi

## サービス概要
![](https://i.gyazo.com/59b715c849bebdb48dc41a433a61d715.jpg)
料理を作るのがおっくうな方。なるべく安くかつ、早くといった効率よく作れることを共有できればいいなと思いつくりました。
かなりコアな部分ではありますが、地方住まい限定になります。近頃の地方では、ドラッグストアがコンビニと同じくらいにあり、生鮮食品もあり、品揃えはスーパーとなんら変わりもありません。数も多いこともあり値段もリーズナブルです。
また、クレジット、電子マネー対応しており支払いもスムーズで利用もしやすく、もっとうまく活用できれば豊かになるのでは?と思い立ち上げました。

## 作る上で意識したこと
一つ一つの機能自体はいたってシンプルなものばかりであり、画期的で面白みのある作品かどうかと問われればあまり自信はありません。しかしながら、Rails最大の強みでもある「MVCアーキテクチャ」の概念にひたすら忠実に従い、何よりも基本を意識した構成を心掛けております。

ユーザー目線になってこれがあるといいなと思ったことを、小さく小さく細切にして実装したことです。一気に作業をしてしまうと全体のバランスが崩れた時の修正が大変です。小分けにして作業することで、なにがどう変わったか把握しやすいですし、小さい段階なら修正も小さく済んで修正時間も早いです。また、少しずつ良くなる実感が味わえてモチベーションアップにつながり、作業も楽しく続けれるようになりました。
また、変に背伸びをせず、自分が理解して、これはどういう動きなのか説明できる範囲での技術を使っています。

**他にも、branchを切る -> 開発を行う -> pushする -> pull requestを送信する -> mergeする」といったチーム開発の流れを疑似的に再現するなど、より実践的な環境で作業を進めました。**

## DEMO
![b06c4e600013ff3b36437ac36599e160](https://user-images.githubusercontent.com/72346611/103330704-068f1900-4aa6-11eb-88b3-f7364b37241a.gif)

![4048587e6b768b6fe6e416e14f6cb514](https://user-images.githubusercontent.com/72346611/103330817-7ef5da00-4aa6-11eb-89c5-b0f7d3b30923.gif)



## URL
https://rakumeshi.xxxxxxxx.com

テストユーザーアカウント

メールアドレス：test@example.com

パスワード：qwer1234

※ページ内には「簡単ログイン（ゲストユーザーとしてワンクリックでログインができる機能）」も実装してありますので、そちらをご利用いただけると幸いです。

## 開発環境
Ruby 2.6.5

Rails 6.0.0

## ER図
![demo](https://i.gyazo.com/f6bb2c43af888bea14bb8c09ac43b889.png)

## 各種機能＆導入技術
- プラットフォーム（Heroku）
- データベース（MySQL）
- テスト（Rspec、Capybara、factory_bot）
- 自動テスト＆自動デプロイ（Circleci）
- コードチェック（rubocop）
- ユーザー登録＆ログイン（devise)
- 画像アップロード（carrierwave、mini_magick、 AWS S3）
- カレンダー（simple_calendar）
- いいね、ブックマーク（Ajax）
- エディタ（vsコード）
- 検索（ransack）
- アプリケーションメッセージ日本語化(rails-i18n)
- パンくずリスト（gretel）
-各種API（Google、Facebook）

## トップページ
![](https://i.gyazo.com/5dfeecaf00e6a88d30a164950a3d8246.jpg)

## マイページ 自分の投稿一覧
![](https://i.gyazo.com/e91096d3914ceaf6c039e50efad111e4.png)

## 自分のいいね一覧
![](https://i.gyazo.com/a8744fbe1b823e02557e78b4f652d8fc.png)
