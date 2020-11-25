# shoeshine

## 概要
靴磨き店舗と磨いて欲しいお客様をInstagramへ繋げます。  
このアプリでは、  
1. 地図を見てお店の情報を参照
2. Instagramへログイン
3. お店のアカウントへ移動  
が可能になります。  

開発環境
- MacBook Pro (13-inch, 2019, Two Thunderbolt 3 ports)
- macOS Catalina (10.15.7)

## App URL


## テスト用アカウント


## 利用方法

## 目指した課題解決
仕事で履いている靴を磨いて欲しい  
出張先で磨いて欲しいけど店舗が分からない  
靴を磨いて欲しいけど行くのが面倒臭い  
こういった人たちの悩みを解決します。

## 洗い出した要件
| 機能            | 目的                                        | 詳細 |
| -------------- | ------------------------------------------- | ---- |
| 企業新規登録     | GoogleMapに店舗情報を反映させるため             |  |
| GoogleMap(API) | GoogleMapがメインページになるから               |     |
| 詳細ページ       | GoogleMapに反映している店舗の詳細を表示させるため |     |
| Instagramへ誘導 | 詳細ページから直接Instagramへログインするため     | |

## 実装した機能についてのGIFと説明

## 実装予定の機能

## データベース設計

## ローカルでの動作方法

## usersテーブル
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| shop_name          | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| instagram          | string  | null: false               |
| homepage           | string  | null: false               |
| phone_number       | string  | null: false               |
| prefecture_id      | integer | null: false               |
| city               | string  | null: false               |
| house_number       | string  | null: false               |
| building_name      | string  |                           |
