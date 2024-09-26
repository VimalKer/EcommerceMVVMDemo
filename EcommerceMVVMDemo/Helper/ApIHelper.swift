//
//  ApIHelper.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation
import Alamofire

typealias handler<T> = (Result<T, DataError>) -> Void

class ApIHelper{
    
    static var sharedInstance =  ApIHelper()
    private init(){}
    
    func getApicallingAlamofire<T: Decodable>(
        modelType   : T.Type,
        moduleURL   : EndpointType,
        method      : HTTPMethod,
        dictHeader  : HTTPHeaders?,
        encoding    : JSONEncoding,
        dictParam   : [String:Any]?,
        moduleIdentifier :moduleIdentifier.RawValue,
        completion: @escaping handler<T>
    ){
        guard let url = moduleURL.url else {
            completion(.failure(.invalidURL))
            return
        }
        print(url)
        
        AF.request(url, method: method,parameters: dictParam,encoding: encoding,headers: dictHeader).response { (request) in
            debugPrint(request)
            guard (request.data != nil),
                  request.error == nil else {
                completion(.failure(.inValidResponse))
                return
            }
            do{
                guard let data = (try JSONSerialization.jsonObject(with: request.data!) as? [String: Any]),
                      let _ = data[moduleIdentifier] as? [[String: Any]] else {
                    print("Error productData Data")
                    completion(.failure(.invalidData))
                    return
                }
                let arrProduct  =  try JSONDecoder().decode(modelType.self, from: request.data!)
                // print(arrProduct)
                
                //                if let json = try JSONSerialization.jsonObject(with: request.data!) as? [String: Any],
                //                   let results = json["products"] as? [[String: Any]] {
                //                    for result in results {
                //                        print(result)
                //                    }
                //                    print(results)
                //                }
                completion(.success(arrProduct))
            }catch{
                completion(.failure(.message(error)))
            }
        }.resume()
        print("Ending API")
    }
    
    func postApicallingAlamofire(
        
    ){
        
    }
    func uploadwebServiceAlmofire(){
        
    }
    func downloadwebServiceAlmofire(){
        
    }
}
enum DataError:Error{
    case inValidResponse
    case invalidURL
    case invalidData
    case message(_ error: Error?)
    
//    guard response.data != nil, response.error == nil else{
//        completion(.failure(.invalidData))
//        return
//    }
}
