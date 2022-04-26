//
//  ViewExtension.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import SwiftUI

extension View {
    func endEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
