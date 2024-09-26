//
//  ViewModel.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import Foundation

final class ProductViewModel{
    
    var arrProductModel:[ProductDataModel] = []
    var eventHandler:((_ event: Events) -> Void)?
    
    //MARK: - FetchProductData
    func fetchProductData(){
        self.eventHandler?(.loading)
        ApIHelper.sharedInstance.getApicallingAlamofire(
            modelType: [ProductDataModel].self,
            moduleURL: EndpointItems.products,
            method: .get,
            dictHeader: nil,
            encoding: .default, dictParam: nil,
            moduleIdentifier: moduleIdentifier.products.key()) { response in
                self.eventHandler?(.stopLoading)
                switch response{
                case .success(let data):
                    self.arrProductModel = data
                    self.eventHandler?(.dataLoaded)
                case .failure(let error):
                    print(error.localizedDescription)
                    self.eventHandler?(.error(error))
                }
            }
    }
}
