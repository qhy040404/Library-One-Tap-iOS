//
//  SettingsView.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import SwiftUI

struct SettingsView: View {
    let idPrompt :String = "学号"
    let passPrompt :String = "密码"
    @State var id :String = UserDefaults.standard.string(forKey: "LIBRARY_ID") ?? ""
    @State var passwd :String = UserDefaults.standard.string(forKey: "LIBRARY_PASS") ?? ""
    @State var inputId :String = ""
    @State var inputPasswd :String = ""
    
    var body: some View {
            VStack(alignment: .center, spacing: 0) {
                Form {
                    Section(header: Text("基本信息")) {
                        TextField("学号：\(id)", text: $inputId)
                            .keyboardType(.numberPad)
                        TextField("密码：\(passwd)", text: $inputPasswd)
                    }
                    
                    Button("保存") {
                        UserDefaults.standard.set(inputId, forKey: "LIBRARY_ID")
                        UserDefaults.standard.set(inputPasswd, forKey: "LIBRARY_PASS")
                        id = inputId
                        passwd = inputPasswd
                    }
                    
                    Section(header: Text("关于")) {
                        FormRowStaticView(app: "版本", ver: "Library-One-tap@1.0.0")
                        FormRowStaticView(app: "版权", ver: "Copyright © qhy040404\nAll rights reserved").multilineTextAlignment(.trailing)
                    }
                    .listStyle(GroupedListStyle())
                    .padding(.vertical, 3)
                }
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
            }
            .navigationTitle("设置")
            .background(Color("ColorBackground"))
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(id: "", passwd: "")
    }
}
