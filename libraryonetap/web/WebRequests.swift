//
//  WebRequests.swift
//  libraryonetap
//
//  Created by qhy on 2022/4/24.
//

import Foundation

//public struct WebRequests {
public func createSession() -> URLSession{
    let config=URLSessionConfiguration.default
    config.httpShouldSetCookies = true
    config.httpCookieAcceptPolicy = .always
    let session:URLSession=URLSession(configuration: config)
    return session
}

var session = createSession()
    
    public func GET(Url:String) ->(String){
        var result:String = ""
        let url: URL = URL(string: Url)!
        var request:URLRequest=URLRequest(url: url)
        //var session:URLSession = URLSession.shared.self
        var dataTask:URLSessionDataTask=session.dataTask(with: request) {(data, response, error) in
            if(error == nil){
                result=String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        dataTask.resume()
        return result
    }
    
    public func POST(Url:String, param:String) -> (String){
        var result:String = ""
        let url = URL(string: Url)!
        //var session = GET(Url: url, id: id, passwd: passwd).1
        var request = URLRequest(url: url)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let parameters: String = param
        request.httpBody=parameters.data(using: String.Encoding.utf8, allowLossyConversion: false)
        var dataTask:URLSessionDataTask=session.dataTask(with: request) {(data, response, error) in
            if(error == nil){
                result = String(data: data!, encoding: String.Encoding.utf8)!
            }
        }
        dataTask.resume()
        return result
    }
    
    public func loginPostData(rsa:String, id:String, passwd:String, ltData:String) ->(String){
        let none:String = "none=on&"
        let rsa:String = "rsa="+rsa+"&"
        let ul:String = "ul="+String(id.count)+"&"
        let pl:String = "pl="+String(passwd.count)+"&"
        let sl:String = "sl=0&"
        let lt:String = "lt="+ltData+"&"
        let const:String = "execution=e1s1&_eventId=submit"
        return none+rsa+ul+pl+sl+lt+const
    }
    
//}
