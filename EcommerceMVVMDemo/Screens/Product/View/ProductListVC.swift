//
//  ProductListVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import UIKit

class ProductListVC: UIViewController {

    var productViewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        productViewModel.fetchProductData()
    }
}
