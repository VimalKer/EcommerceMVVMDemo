//
//  ViewModel.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation

class ProductViewModel{
    
    var arrProductModel:[ProductDataModel] = []
    var eventHandler:((_ event: Events) -> Void)?
    
    func fetchProductData(){
   
        ApIHelper.sharedInstance.getApicallingAlamofire(
            modelType: [ProductDataModel].self,
            moduleURL: EndpointItems.products,
            method: .get,
            dictHeader: nil,
            encoding: .default, dictParam: nil,
            moduleIdentifier: moduleIdentifier.products.key()) { response in
            print(response)
            
        }
    }
}
