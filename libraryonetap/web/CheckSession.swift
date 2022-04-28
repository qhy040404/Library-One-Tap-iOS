//
//  CheckSession.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/24.
//

import Foundation
import SwiftyJSON

//public struct CheckSession {
    public func checkSession(json:String) ->(Bool){
        var originalData = json
        let jsonData=originalData.data(using: String.Encoding.utf8)
        
        let transferData = JSON(jsonData)
        
        var success:Bool = transferData["success"].boolValue
        return success
    }
//}
