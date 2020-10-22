//
//  APIManager.swift
//  Desafio ioasys
//
//  Created by Lucas Feitosa on 21/10/20.
//

import Foundation
import Alamofire

class APIManager: NSObject {
    
    private var accessToken:String = ""
    private var client:String = ""
    private var uid:String = ""
    // MARK: - Vars & Lets
    private let encoding:JSONEncoding = JSONEncoding.default
    private var baseUrl:String
    private var authToken:String = ""
    
    private var headers: HTTPHeaders = [
        "Accept": "application/json"
    ]
    private let sessionManager: Session
    private static var sharedApiManager: APIManager = {
        let apiManager = APIManager(sessionManager: Session())
        
        return apiManager
    }()
    
    // MARK: - Accessors
    
    class func shared() -> APIManager {
        return sharedApiManager
    }
    
    // MARK: - Initialization
    
    private init(sessionManager: Session) {
        self.sessionManager = sessionManager
        self.baseUrl = "https://empresas.ioasys.com.br/api/v1"
        
    }
    
    func authenticate(body:Parameters,completion: @escaping (Bool) -> Void) {
        
        
        //self.headers["Authorization"] = authToken
        print(headers)
        let url = "\(self.baseUrl)/users/auth/sign_in"
        AF.request(url,method: .post, parameters: body, encoding: self.encoding,headers: headers).validate().responseJSON { response in
            
            if let header = response.response?.allHeaderFields {
                if let uid = header["uid"] as? String,
                   let token = header["access-token"] as? String,
                   let client = header["client"] as? String {
                    self.uid = uid
                    self.accessToken = token
                    self.client = client
                }
                
            }
            //print(response.response?.allHeaderFields)
            switch response.result {
            case let .success(value):
                print(value)
                completion(true)
                break
            case .failure(_):
                completion(false)
                //print(error)
                break
                
            }
        }
        
    }
    
    func getEnterprisesWithFilter(filter:String,id:String,completion:@escaping (Bool) -> Void) {
        
        let url = "\(self.baseUrl)/enterprises?enterprise_types=\(id)&name=\(filter)"
        headers["access-token"] = self.accessToken
        headers["uid"] = self.uid
        headers["client"] = self.client
        AF.request(url,encoding:JSONEncoding.default,headers:headers).validate().responseJSON { response in
            switch response.result {
            case let .success(value):
                print(value)
               completion(true)
                break
            case .failure:
                completion(false)
                break
            }
        }
        
    }
    
    func getEnterprises(id:String,completion:@escaping (Bool) -> Void) {
        
        let url = "\(self.baseUrl)/enterprises/\(id)"
        headers["access-token"] = self.accessToken
        headers["uid"] = self.uid
        headers["client"] = self.client
        AF.request(url,encoding:JSONEncoding.default,headers:headers).validate().responseJSON { response in
            switch response.result {
            case let .success(value):
                print(value)
               completion(true)
                break
            case .failure:
                completion(false)
                break
            }
        }
        
    }
    
    

    
    
}


