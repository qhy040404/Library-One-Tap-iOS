//
//  ContentView.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50.0) {
            Image(/*@START_MENU_TOKEN@*/"Image Name"/*@END_MENU_TOKEN@*/)
                .frame(width: 250.0, height: 250.0)
            VStack {
                HStack(spacing: 75.0) {
                    Button(/*@START_MENU_TOKEN@*/"离退码"/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                    
                    Button(/*@START_MENU_TOKEN@*/"暂离码"/*@END_MENU_TOKEN@*/) {
                        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/ /*@END_MENU_TOKEN@*/
                    }
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
                    
                }
                Text("加载中...")
                    .padding(.all)
                    .dynamicTypeSize(/*@START_MENU_TOKEN@*/.xLarge/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
