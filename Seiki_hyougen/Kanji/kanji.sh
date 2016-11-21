#!/bin/bash

curl https://ja.wikipedia.org/wiki/%E5%B8%B8%E7%94%A8%E6%BC%A2%E5%AD%97%E4%B8%80%E8%A6%A7\
  | sed -n '/<table.*/,/\/table>/p'\
  | sed -n '/<a.*class="extiw".*>.<\/a>/p'\
  | sed -E 's/<.*title="wikt:.">(.).*>/\1/'\
  | tr '\n' ','\
  | sed 's/,$//' > jouyou_kanji


  # 1.漢字の入ってるtableを取り出す
  # 2.漢字一文字のある行を取り出す
  # 3.改行をカンマに置換
  # 4.末尾のカンマを削除

  # tr →  sed version  改行をカンマにして、末尾にカンマが入らない！
  # けどコマンドを理解してないので記述だけ残しておく。

  #| sed -r -e ':loop;N;$!b loop;s/\n/ /g' -e 's/ +/,/g'

