//
//  UserAPI.swift
//  IOSTraining
//
//  Created by VIETLAMTR on 23/02/2566 BE.
//

import Foundation
import Alamofire

class APIHandler{
    static let sharedInstance = APIHandler()
    
    let token: HTTPHeaders = [.authorization(bearerToken: "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")]

    func fetchDataListUser(handler: @escaping (_ apiData:[User]) -> (Void)) {
        let url = "https://api.github.com/users"
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: token, interceptor: nil)
            .response { response in
                switch response.result {
                    case .success(let data):
                        do{
                            let jsonData = try JSONDecoder().decode([User].self, from: data!)
                            handler(jsonData)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
    }
    
    func fetchDataListUserDetail(handler: @escaping (_ apiData:[Detail]) -> (Void), login: String) {
        let url = "https://api.github.com/users/" + login
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: token, interceptor: nil)
            .response { response in
                switch response.result {
                    case .success(let data):
                        do{
                            let jsonData = try JSONDecoder().decode([Detail].self, from: data!)
                            handler(jsonData)
                        } catch {
                            print(error.localizedDescription)
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                }
            }
    }
}
