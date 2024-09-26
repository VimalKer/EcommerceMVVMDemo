//
//  Model.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation

//MARK: - ProductDataModel
struct ProductDataModel : Decodable{
    
    let id:Int?
    let title  :String?
    let description:String?
    let category:String?
    let price:Double?
    let discountPercentage:Double?
    let rating:Double?
    let stock:Int?
    let tags:[String]?
    let brand:String?
    let sku:String?
    let weight:String?
    let dimensions: Dimensions?
    let warrantyInformation:String?
    let shippingInformation:String?
    let availabilityStatus:String?
    let reviews: [Reviews]?
    let returnPolicy:String?
    let minimumOrderQuantity:String?
    let meta:Meta?
    let images:[String]?
    let thumbnail:String?
}
struct Dimensions:Decodable{
    
    let width:String?
    let height:String?
    let depth:String?
}
struct Reviews:Decodable{
    
    let rating:Int?
    let comment:String?
    let date:String?
    let reviewerName:String?
    let reviewerEmail:String?
}
struct Meta:Decodable{
    let createdAt:String?
    let updatedAt:String?
    let barcode:String?
    let qrCode:String?
}
