#!/bin/bash

while true; do
    # 名前を取得するダイアログ
    dialog --title "名前入力" \
           --inputbox "名前を入力してください:" 8 40 \
           2> /tmp/name.txt

    # ユーザーがキャンセルした場合、スクリプトを終了
    if [ $? -ne 0 ]; then
        rm -f /tmp/name.txt
        clear
        exit 0
    fi

    # ダイアログの結果を変数に格納
    name=$(cat /tmp/name.txt)

    # 年齢を取得するダイアログ
    dialog --title "${name}さんの年齢入力" \
           --inputbox "年齢を入力してください:" 8 40 \
           2> /tmp/age.txt

    # ユーザーがキャンセルした場合、名前入力に戻る
    if [ $? -ne 0 ]; then
        rm -f /tmp/age.txt
        continue
    fi

    # ダイアログの結果を変数に格納
    age=$(cat /tmp/age.txt)

    # 結果を表示するダイアログ
    dialog --title "入力結果" \
        --msgbox "あなたの名前は${name}で、年齢は${age}歳です。" 8 40

    # 一時ファイルを削除
    rm -f /tmp/name.txt
    rm -f /tmp/age.txt

    # スクリプトを終了
    clear
    exit 0
done
