//
//  UsersViewModel.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 26/09/24.
//

import Foundation

class UsersViewModel{
    
    var arrUsersDataModel = [UsersDataModel]()
    var eventHandler:((_ events: Events) -> Void)?
    
    //MARK: - fetchuserData
    func fetchuserData(){
        ApIHelper.sharedInstance.getApicallingAlamofire(modelType: [UsersDataModel].self, moduleURL: EndpointItems.users, method: .get, dictHeader: .default, encoding: .default, dictParam: nil, moduleIdentifier: moduleIdentifier.users.key()) { response in
            switch response{
            case .success(let arrData):
                self.arrUsersDataModel = arrData
                self.eventHandler?(.dataLoaded)
            case .failure(let error):
                self.eventHandler?(.error(error))
                print(error.localizedDescription)
            }
        }
    }
}
