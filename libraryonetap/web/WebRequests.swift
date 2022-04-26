//
//  WebRequests.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/24.
//

import Foundation

struct WebRequests {
    
    /*static func saveCookies(for urlStr: String){
        if let url = URL(string: urlStr){
            if let cookies = HTTPCookieStorage.shared.cookies(for: url){
                var name:[String]
                var data:[String]
                var i = 0
                //var un = ""
                //var hash = ""
                for cookie in cookies {
                    /*if cookie.name == "cas_hash" {
                        hash = cookie.value
                        break
                    }
                }
                for cookie in cookies {
                    if cookie.name == "dlut_cas_un" {
                        un = cookie.value
                        break
                    }*/
                    name[i]=cookie.name
                    data[i]=cookie.value
                    i+=1
                }
                let defaults = UserDefaults.standard
                for j:Int in 0...i{
                    defaults.set(data[j], forKey: name[j])
                }
                //defaults.set(un, forKey: "dlut_cas_un")
                //defaults.set(hash, forKey: "cas_hash")
                defaults.synchronize()
            }
        }
    }*/
    var session:URLSession=URLSession.shared.self
    
    func GET(Url:String) ->(String){
        var result:String = ""
        let url: URL = URL(string: Url)!
        var request:URLRequest=URLRequest(url: url)
        //var session:URLSession = URLSession.shared.self
        var dataTask:URLSessionDataTask=session.dataTask(with: request) {(data, _, error) in
            if(error == nil){
                result=String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        dataTask.resume()
        return result
    }
    
    func POST(Url:String, param:String) -> (String){
        var result:String = ""
        let url = URL(string: Url)!
        //var session = GET(Url: url, id: id, passwd: passwd).1
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: String = param
        request.httpBody=parameters.data(using: String.Encoding.utf8, allowLossyConversion: false)
        var dataTask:URLSessionDataTask=session.dataTask(with: request) {(data, _, error) in
            if(error == nil){
                result = String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        dataTask.resume()
        return result
    }
    
    func loginPostData(rsa:String, id:String, passwd:String, ltData:String) ->(String){
        let none:String = "none=on&"
        let rsa:String = "rsa="+rsa+"&"
        let ul:String = "ul="+String(id.lengthOfBytes(using: String.Encoding.utf8))+"&"
        let pl:String = "pl="+String(passwd.lengthOfBytes(using: String.Encoding.utf8))+"&"
        let sl:String = "sl=0&"
        let lt:String = "lt="+ltData+"&"
        let const:String = "execution=e1s1&_eventId=submit"
        return none+rsa+ul+pl+sl+lt+const
    }
    
}
