# shoeshine
![top-page](https://i.gyazo.com/39ce468ddff4a970de6d84e412f303be.png)

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
- 仕事で履いている靴を磨いて欲しい  
- 出張先で磨いて欲しいけど店舗が分からない  
- 靴を磨いて欲しいけど行くのが面倒臭い  
こういった人たちの悩みを解決します。

## 洗い出した要件
| 機能            | 目的                                        | 詳細                                                    |
| -------------- | ------------------------------------------- | ------------------------------------------------------ |
| 企業新規登録     | GoogleMapに店舗情報を反映させるため             | 店舗の住所や、インスタグラムのユーザーネームを登録するカラムにする |
| GoogleMap(API) | GoogleMapがメインページになるから               | 登録した店舗の住所を元にGoogleMapへ反映させる                |
| 詳細ページ       | GoogleMapに反映している店舗の詳細を表示させるため | Mapにあるマーカーをクリックして店舗が登録したデータを表示させる   |
| Instagramへ誘導 | 詳細ページから直接Instagramへログインするため     | 詳細ページに載っているインスタユーザーネームをクリックしただけでインスタへ移動できれば時間短縮できる |

## 実装した機能についてのGIFと説明

## 実装予定の機能
- GoogleMapに現在地を表示させる機能を図る
- 結合テストを実装し、アプリケーションの安全性を確保する

## データベース設計
**usersテーブル**
| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| user_name          | string  | null: false               |
| shop_name          | string  | null: false               |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |

**Association**
- has_many :shops

**shopsテーブル**
| Column       | Type        | Options                        |
| ------------ | ----------- | ------------------------------ |
| address      | string      | null: false                    |
| instagram    | string      | null: false                    |
| phone_number | string      | null: false                    |
| lat          | float       | null: false                    |
| lng          | float       | null: false                    |
| user         | references  | null: false, foreign_key: true |

**Association**
- belongs_to :user

## ローカルでの動作方法

