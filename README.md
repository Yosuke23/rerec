# REREC

![スクリーンショット](https://raw.githubusercontent.com/Yosuke23/rerec/master/app/assets/images/rerec.png)

https://rerec.work/

読書記録（読んでいる、読んだ本の感想日記、読んだ本のページ数、本の数）を
簡単な操作で管理することができ、手軽に読本管理ができるWEBサービスです。

## 動機
私は読書が大好きで、読み終わった本は、タイトルと読了日、簡単な感想をノートに記録するというのを習慣にしていました。こうした、読了記録、書籍検索、購読リストアップをなんどか既存の読書管理アプリを使い 管理を試みてましたが、なかなか自分の目的に操作感マッチしているアプリがなかったため、自身のアプリ開発の勉強も兼ねて、 “少ないページ推移で「読んだ本の記録」と「次読む本の検索登録」を実現きる書籍管理アプリ”をコンセプトとして開発に着手しました。

## 現在の主要機能

- 本の検索、登録
- 検索した本をユーザーの「読んでいる本」「読んだ本」「読みたい本」のいずれかに登録
 
## ER図

![er_rerec](https://raw.githubusercontent.com/Yosuke23/rerec/correction-branch/erd.png)

## インフラ

クラウドインフラとして現在のデファクトスタンダードであるAWSを選択

AWS: VPC / EC2 / RDS / S3 / ElastiCache / Route53 / IAM / ACM

## 開発環境

チーム開発での開発環境構築を想定し、Docker,docker-composeを使用いたしました。

[Dockerfile](https://github.com/Yosuke23/rerec/blob/master/Dockerfile), [docker-compose.yml](https://github.com/Yosuke23/rerec/blob/master/docker-compose.yml)

確認手順は以下の通りです。

$ git clone git@github.com:Yosuke23/rerec.git

$ docker-compose build

$ docker-compose run web rails db:create db:migrate db:seed

$ docker-compose up -d