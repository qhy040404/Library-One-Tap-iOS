//
//  Login.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/26.
//

import Foundation

//struct Login {
public func login(id:String, pass:String, session:URLSession) -> String {
        var returnText = ""
        
        let requestUrl = "https://sso.dlut.edu.cn/cas/login?service=http://seat.lib.dlut.edu.cn/yanxiujian/client/login.php?redirect=index.php"
        let sessionUrl = "http://seat.lib.dlut.edu.cn/yanxiujian/client/orderRoomAction.php?action=checkSession"
        var loged_in:Bool = false
        var timer:Int = 0
        while !loged_in {
            let ltResponse = GET(Url: requestUrl, session: session)
            let ltCheck = ltResponse.contains("LT")
            if ltCheck {
                let ltData = String("LT"+ltResponse.components(separatedBy: "LT")[1].components(separatedBy: "cas")[0]+"cas")
                let rawData = "\(id)\(pass)\(ltData)"
                let rsa = strEnc(data: rawData, firstKey: "1", secondKey: "2", thirdKey: "3")
                var login = POST(Url: requestUrl, param: loginPostData(rsa: rsa, id: id, passwd: pass, ltData: ltData), session: session)
                let librarySession = POST(Url: sessionUrl, param: "", session: session)
                if checkSession(json: librarySession) {
                    loged_in = true
                } else {
                    timer += 1
                    if timer>=3 {
                        returnText = "登录信息有误"
                        break
                    }
                }
            } else {
                returnText = "登录信息有误"
                break
            }
        }
        if loged_in {
            let listUrl = "http://seat.lib.dlut.edu.cn/yanxiujian/client/orderRoomAction.php?action=myOrderList&order=asc&offset=0&limit=10"
            let list = GET(Url: listUrl, session: session)
            let total = getTotal(json: list)
            if total != "0" {
                let space_name = getSpace_name(json: list)
                let seat_label = getSeat_label(json: list)
                let order_date = getOrder_date(json: list)
                let order_id = getOrder_id(json: list)
                returnText = "order_id:\(order_id)\n\n\(space_name)\n\(seat_label)\n\(order_date)"
            }
        }
        
        
        return returnText
    }
//}
