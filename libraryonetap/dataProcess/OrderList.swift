//
//  OrderList.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import Foundation
import SwiftyJSON

//public struct OrderList {
    func initialData(json:String)->(JSON,JSON) {
        var origin = json
        let jsonData = origin.data(using: String.Encoding.utf8)
        
        let transferData = JSON(jsonData)
        var validData:JSON = JSON("")
        
        for i in 1...10 {
            if transferData[i]["order_process"]=="进行中" {
                validData = transferData[i]
            }
        }
        return (transferData,validData)
    }
    
    public func getTotal(json:String) -> (String){
        let proData = initialData(json: json)
        return proData.0["total"].stringValue
    }
    
    public func getOrder_id(json:String) -> (String) {
        let proData = initialData(json: json)
        return proData.1["order_id"].stringValue
    }
    
    public func getSpace_name(json:String) -> (String) {
        let proData = initialData(json: json)
        return proData.1["space_name"].stringValue
    }
    
    public func getSeat_label(json:String) -> (String) {
        let proData = initialData(json: json)
        return proData.1["seat_label"].stringValue
    }
    
    public func getOrder_date(json:String) -> (String) {
        let proData = initialData(json: json)
        return proData.1["order_date"].stringValue
    }
//}
