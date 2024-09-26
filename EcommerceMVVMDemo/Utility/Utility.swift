//
//  Utility.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation
import Alamofire

//MARK: - Methods
//enum HTTPMethods:String{
//    case get  = "GET"
//    case post = "POST"
//}

protocol EndpointType{
    var baseURL: String { get }
    var path: String { get }
    var url:URL? { get }
   // var methods:HTTPMethod { get }
}
enum EndpointItems{
    case auth
    case products
    case carts
    case recipes
    case users
    case posts
    case comments
    case todos
    case quotes
}

extension EndpointItems:EndpointType{
    var baseURL: String {
        return  "https://dummyjson.com/"
    }
    var path: String {
        switch self {
        case .auth:
            return "auth"
        case .products:
            return "products"
        case .carts:
            return "carts"
        case .recipes:
            return "recipes"
        case .users:
            return "users"
        case .posts:
            return "posts"
        case .comments:
            return "comments"
        case .todos:
            return "todos"
        case .quotes:
            return "quotes"
        }
    }
    var url: URL? {
        return URL(string: baseURL + path)
    }
    
//    var methods: HTTPMethod{
//        switch self{
//        case "get":
//            return .get
//        case .posts:
//            return .post
//        }
//    }

}
enum Events{
    
    case loading
    case stopLoading
    case dataLoaded
    case error(Error?)
}
