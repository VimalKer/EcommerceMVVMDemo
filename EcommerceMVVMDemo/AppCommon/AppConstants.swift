//
//  Constants.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation
import UIKit

enum screenIdentifier: String{
    case HomeVC , ProductListVC, CarListVC, UsersListVC ,LoginVC , SignUpVC ,CategoryListVC
    func Identifier() -> String {
        switch self {
        case .HomeVC:
            return "HomeVC"
        case .ProductListVC:
            return "ProductListVC"
        case .CarListVC:
            return "CarListVC"
        case .UsersListVC:
            return "UsersListVC"
        case .LoginVC:
            return "LoginVC"
        case .SignUpVC:
            return "SignUpVC"
        case .CategoryListVC:
            return "CategoryListVC"
        }
    }
}

//MARK: - tabBarIcon
enum mytabBarIcon{
    case Home
    case Product
    case Category
    case Users

    var selectedImage: UIImage {
        switch self {
            case .Home: return UIImage(named: "Home_s")!
            case .Product: return UIImage(named: "Product_s")!
            case .Category: return UIImage(named: "Category_s")!
            case .Users: return UIImage(named: "Users_s")!
        }
    }
    var defaultImage: UIImage {
        switch self {
            case .Home: return UIImage(named: "Home")!
            case .Product: return UIImage(named: "Product")!
            case .Category: return UIImage(named: "Category")!
            case .Users: return UIImage(named: "Users")!
        }
    }
}

enum moduleIdentifier: String{
    case auth , products, carts, recipes ,users , posts ,comments, todos ,quotes
    func key() -> String {
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
}

class UserDetails:NSObject{
    
    private override init(){}
    
    static var userId:String{
        get{
            UserDefaults.standard.value(forKey: "userId")as? String ?? ""
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "userId")
        }
    }
    
    static var IS_LOGIN: Bool{
        get{
            UserDefaults.standard.value(forKey: "IS_LOGIN")as? Bool ?? false
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "IS_LOGIN")
        }
    }
    static var IS_ADMIN : Bool{
        get{
            UserDefaults.standard.value(forKey: "IS_ADMIN")as? Bool ?? false
        }
        set{
            UserDefaults.standard.setValue(newValue, forKey: "IS_ADMIN")
        }
    }
}
