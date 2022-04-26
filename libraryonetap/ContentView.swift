//
//  ContentView.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import SwiftUI

struct ContentView: View {
    @State var textData: String = "请点击登录"
    //@State var session: URLSession = createSession()
    //@State var id:String = UserDefaults.standard.string(forKey: "LIBRARY_ID") ?? ""
    //@State var passwd:String = UserDefaults.standard.string(forKey: "LIBRARY_PASS") ?? ""
    

    
    var body: some View {
        NavigationView {
            VStack(spacing: 50.0) {
                Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)
                    .frame(width: 250.0, height: 250.0)
                VStack {
                    Button("登录") {
                        let id:String = UserDefaults.standard.string(forKey: "LIBRARY_ID") ?? ""
                        let passwd:String = UserDefaults.standard.string(forKey: "LIBRARY_PASS") ?? ""
                        textData = login(id: id, pass: passwd)
                    }
                    .padding(.bottom)
                    HStack(spacing: 75.0) {
                        Button(/*@START_MENU_TOKEN@*/"离退码"/*@END_MENU_TOKEN@*/) {
                            let id:String = UserDefaults.standard.string(forKey: "LIBRARY_ID") ?? ""
                            let passwd:String = UserDefaults.standard.string(forKey: "LIBRARY_PASS") ?? ""
                        }
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                        Button(/*@START_MENU_TOKEN@*/"暂离码"/*@END_MENU_TOKEN@*/) {
                            let id:String = UserDefaults.standard.string(forKey: "LIBRARY_ID") ?? ""
                            let passwd:String = UserDefaults.standard.string(forKey: "LIBRARY_PASS") ?? ""
                        }
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                    }
                    Text(textData)
                        .padding(.all)
                        .frame(width: 200.0, height: 200.0)
                        .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                    NavigationLink {
                        SettingsView()
                    } label: {
                        Text("设置")
                    }
                    .dynamicTypeSize(.xLarge)
                }
            }
            .navigationTitle("图书馆")
        }
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
