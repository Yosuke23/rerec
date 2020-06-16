# REREC

読書記録（読んでいる、読んだ本の感想日記、読んだ本のページ数、本の数）を
簡単な操作で管理することができ、手軽に読本管理ができるWEBサービスです。

## 動機

読んでいる本、読んだ本別に感想日記を書いたり、その記録から検索して、過去の自身の読本記録を確認するような読本管理アプリが欲しかっため、自身の読本管理の為に作成に取り掛かりました。

## 現在の主要機能

- 本の検索、登録
- 検索した本をユーザーの「読んでいる本」「読んだ本」「読みたい本」のいずれかに登録

## インフラ（予定）

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