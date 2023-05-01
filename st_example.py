import streamlit as st
 
st.title("名前と年齢の入力")
 
# 名前を入力するフィールド
name = st.text_input("名前を入力してください:")
 
# 年齢を入力するフィールド
age = st.number_input("年齢を入力してください:", min_value=0, step=1)
 
# 送信ボタン
if st.button("送信"):
    if name and age >= 0:
        st.success(f"あなたの名前は{name}で、年齢は{age}歳です。")
    else:
        st.error("名前と年齢を正しく入力してください。")