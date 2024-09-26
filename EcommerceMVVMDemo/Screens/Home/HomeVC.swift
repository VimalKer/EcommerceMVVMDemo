//
//  HomeVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK: - IBOutlet Declaration
    @IBOutlet weak var tblProduct                : UITableView!
    @IBOutlet weak var tblProductHeight                : NSLayoutConstraint!
    @IBOutlet weak var collectionUsers           : UICollectionView!
    
    //MARK: - Varriable Declaration
    var productViewModel = ProductViewModel()
    var usersViewModel   = UsersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
}
//MARK: - UITableViewDelegate UITableViewDataSource
extension HomeVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productViewModel.arrProductModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tblProduct.dequeueReusableCell(withIdentifier: "HomeProductTVC") as! HomeProductTVC? else {
          fatalError()
        }
        cell.Product = self.productViewModel.arrProductModel[indexPath.row]
        return cell
    }
}
//MARK: - UICollectionViewDelegate UICollectionViewDataSource
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.usersViewModel.arrUsersDataModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionUsers.dequeueReusableCell(withReuseIdentifier: "HomeUsersCVC", for: indexPath)as! HomeUsersCVC? else {
          fatalError()
        }
        cell.Users = usersViewModel.arrUsersDataModel[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionUsers.frame.size.width) / 2.0 - 4, height: (collectionUsers.frame.size.width) / 1.8 - 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
//MARK: - Config Methods
extension HomeVC{
    
    func config(){
        self.collectionUsers.register(UINib(nibName: "HomeUsersCVC", bundle: nil), forCellWithReuseIdentifier: "HomeUsersCVC")
        self.tblProduct.register(UINib(nibName: "HomeProductTVC", bundle: nil), forCellReuseIdentifier: "HomeProductTVC")
        self.initViewModel()
        self.observeUsersEvent()
        self.observeProductEvent()
    }
    func initViewModel(){
        self.usersViewModel.fetchuserData()
        self.productViewModel.fetchProductData()
    }
    func observeProductEvent(){
        productViewModel.eventHandler = { [weak self] event in
            guard let self else {
                return
            }
            switch event{
            case .loading:
                print("Indicator Load")
            case .stopLoading:
                print("Indicator Stop/Hide")
            case .dataLoaded:
                print("Data Loaded..")
                print(self.productViewModel.arrProductModel)
                
                //MARK: - Main Thread UI reloading Data -> UI related Work -- It's work well in main
                DispatchQueue.main.async {
                    self.tblProduct.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription)
            }
        }
    }
    func observeUsersEvent(){
        usersViewModel.eventHandler = { [weak self] event in
            guard let self else{
                return
            }
            switch event{
            case .loading:
                print("Indicator Loading..")
            case .stopLoading:
                print("Indicator Stop/Hide..")
            case .dataLoaded:
                print("Data Loaded..")
                
                //MARK: - Main Thread UI reloading Data -> UI related Work -- It's work well in main
                DispatchQueue.main.async {
                    self.collectionUsers.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription)
            }
        }
    }
}
