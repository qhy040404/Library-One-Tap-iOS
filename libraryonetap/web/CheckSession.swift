//
//  CheckSession.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/24.
//

import Foundation

struct CheckSession {
    func checkSession(json:String) ->(Bool){
        var originalData = json
        let jsonData=originalData.data(using: String.Encoding.utf8)
        
        let transferData = JSON(jsonData)
        
        var success:Bool = transferData["success"].boolValue
        return success
    }
}
