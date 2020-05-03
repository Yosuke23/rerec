# REREC

RERECはYosuke23の個人開発による、日々の読んだ本のページ数を記録して、ページ数や読んだタイトルや読んだ本の累計記録を取り、評価や、コメントを共有できる読書共有サイトです。


## Description

### CTPT frame work

#### Concept

- 

#### Target

- 読書愛好者層

##### The reason
- 自分の読書記録（本のタイトル/著者/日毎の読んだページ数/コメント）を取ることで、読書ページのアベレージを知りたい
- 読んだ本の自身の評価やコメント、メモ記録を簡単にできるようにしたい
- 記録数が多くなっても検索機能で、読んだタイトルと自分の評価やコメント簡単に検索したい
- 読んだ本の詳細記録がいつでも確認できるようにしたい
- 読んだ本の感動を共有しあいたい

#### Process

1. Product

- Railsを用いて会員登録システムを構築
- ユーザーが自由に読書記録、コメントを投稿できるようにする

2. Place

- AWS（Amazon Web Services）を用いてWeb上に公開

3. Price

- 完全無料

4. Promotion

- 特になし

5. Process

- その友人間の口コミで広げる

6. Profile

- 特になし

#### Tool

##### Development environment

* Infrastructure
  * TDD
    * Vagrant

  * Platform
    * AWS

  * Version control
    * Git

  * Web server 
    * Production
      * puma

  * DB
    * Development
      * MySQL
    * Production
      * MySQL

  * Test-driven development
    * Gurad-spec(Minitest)

  * Front end language
    * HTML
    * SCSS
    * JavaScript(jQUery)

  * Back end language
    * Ruby(2.5.1)
    * Ruby on Rails(5.2.4.2)


## Author

[Yosuke23](https://github.com/Yosuke23/)