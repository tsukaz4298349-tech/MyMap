//
//  ContentView.swift
//  MyMap
//
//  Created by 中尾司 on 2025/09/07.
//

import SwiftUI

struct ContentView: View {
    //入力中の文字列を保持する状態変数
    @State var inputText: String = ""
    //検索キーワードを保持する状態変数、初期値は"東京駅"
    @State var displaySearchKey: String = "東京駅"
    //マップ種類　最初は標準から
    @State var displayMapType: MapType = .standard
    
    var body: some View {
        //垂直にレイアウト
        VStack {
            //テキストフィールド(文字入力)
            TextField("キーワード", text: $inputText, prompt:
                Text("キーワードを入力してくださ"))
            //入力が完了された時
                .onSubmit {
                    //入力が完了したので検索キーワードに設定する
                    displaySearchKey = inputText
            }
            //余白を追加
                .padding()
            
            //奥から手前方向にレイアウト　(右下基準で配置する)
            ZStack(alignment: .bottomTrailing) {
                //マップを表示
                MapView(searchKey: displaySearchKey, mapType: displayMapType)
                
                //マップ種類切り替えボタン
                Button {
                    //標準 -> 衛生写真 -> 衛生写真+交通機関ラベル
                    if displayMapType == .standard {
                        displayMapType = .satelite
                    } else if displayMapType == .satelite {
                        displayMapType = .hybrid
                    } else {
                        displayMapType = .standard
                    }
                } label: {
                    //マップアイコンの表示
                    Image(systemName: "map")
                        .resizable()
                        .frame(width: 35.0, height: 35.0)
                }//Buttonここまで
                //右の余白を20あける
                .padding(.trailing, 20.0)
                //下の余白30あける
                .padding(.bottom, 30.0)
                
            }//ZStackここまで
        }//VStackここまで
    }
}

#Preview {
    ContentView()
}
