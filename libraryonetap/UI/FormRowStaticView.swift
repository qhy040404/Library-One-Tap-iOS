//
//  FormRowStaticView.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import SwiftUI

struct FormRowStaticView: View {
    
    var app: String
    var ver: String
    
    var body: some View {
        HStack {
            
            Text(app)
            Spacer()
            Text(ver)
        }
    }
}

struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(app: "1", ver: "2")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
