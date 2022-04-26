//
//  CharacterExtension.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import Foundation

extension Character {
    func toInt() -> Int {
        var intFromCharacter:Int = 0
        for scalar in String(self).unicodeScalars {
            intFromCharacter = Int(scalar.value)
        }
        return intFromCharacter
    }
}
