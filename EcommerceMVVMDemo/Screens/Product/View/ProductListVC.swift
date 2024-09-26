//
//  ProductListVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import UIKit

class ProductListVC: UIViewController {

    //MARK: - IBOutlet Declaration
    @IBOutlet weak var collectionProduct                : UICollectionView!
    
    var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        config()
    }
}
//MARK: - UICollectionViewDelegate UICollectionViewDataSource
extension ProductListVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productViewModel.arrProductModel.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionProduct.dequeueReusableCell(withReuseIdentifier: "ProductListCVC", for: indexPath)as! ProductListCVC? else {
          fatalError()
        }
        cell.Product = productViewModel.arrProductModel[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionProduct.frame.size.width) / 2.0 - 4, height: (collectionProduct.frame.size.width) / 1.5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
}
//MARK: - Config Methods
extension ProductListVC{
    
    func config(){
        self.collectionProduct.register(UINib(nibName: "ProductListCVC", bundle: nil), forCellWithReuseIdentifier: "ProductListCVC")
        self.initViewModel()
        self.observeProductEvent()
    }
    func initViewModel(){
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
                    self.collectionProduct.reloadData()
                }
            case .error(let error):
                print(error?.localizedDescription)
            }
        }
    }
}
