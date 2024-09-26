//
//  UserModel.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 26/09/24.
//

import Foundation

//MARK: - UsersDataModel
struct UsersDataModel:Decodable{
    
    var id:Int?
    var firstName:String?
    var lastName:String?
    var maidenName:String?
    var age:Int?
    var gender:String?
    var email:String?
    var phone:String?
    var username:String?
    var password:String?
    var birthDate:String?
    var image:String?
    var bloodGroup:String?
    var height:Double?
    var weight:Double?
    var eyeColor:String?
    var hair: Hair?
    var ip:String?
    var address:Address?
    var macAddress:String?
    var university:String?
    var bank:Bank?
    var company:Company?
    var ein:String?
    var ssn:String?
    var userAgent:String?
    var crypto:Crypto?
    var role:String?
}
struct Hair:Decodable{
    var color:String?
    var type:String?
}
struct Address:Decodable{
    var address,city,state,stateCode,postalCode:String?
    var coordinates:Coordinates?
    var country:String?
}
struct Coordinates:Decodable{
    var lat:Double?
    var lng:Double?
}
struct Bank:Decodable{
    var cardExpire:String?
    var cardNumber:String?
    var cardType:String?
    var currency:String?
    var iban:String?
}
struct Company:Decodable{
    
    var department,name,title:String?
    var address:CompanyAddress?
}
struct CompanyAddress:Decodable{
    var address,city,state,stateCode,postalCode:String?
    var coordinates:CompanyCoordinates?
    var country:String?
}
struct CompanyCoordinates:Decodable{
    var lat:Double?
    var lng:Double?
}
struct Crypto:Decodable{
    var coin:String?
    var wallet:String?
    var network:String?
}
