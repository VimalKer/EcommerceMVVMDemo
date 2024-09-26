//
//  TabBarVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 25/09/24.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = mainStoryboard.instantiateViewController(withIdentifier: screenIdentifier.HomeVC.Identifier())
        let productVC = mainStoryboard.instantiateViewController(withIdentifier: screenIdentifier.ProductListVC.Identifier())
        let categoryVC = mainStoryboard.instantiateViewController(withIdentifier: screenIdentifier.CategoryListVC.Identifier())
        let usersVC = mainStoryboard.instantiateViewController(withIdentifier: screenIdentifier.UsersListVC.Identifier())
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: mytabBarIcon.Home.defaultImage,selectedImage: mytabBarIcon.Home.selectedImage)
        productVC.tabBarItem = UITabBarItem(title: "Product", image: mytabBarIcon.Product.defaultImage,selectedImage: mytabBarIcon.Product.selectedImage)
        categoryVC.tabBarItem = UITabBarItem(title: "Category", image: mytabBarIcon.Category.defaultImage,selectedImage: mytabBarIcon.Category.selectedImage)
        usersVC.tabBarItem = UITabBarItem(title: "Users", image: mytabBarIcon.Users.defaultImage,selectedImage: mytabBarIcon.Users.selectedImage)
        let controllers = [homeVC,productVC,categoryVC,usersVC]
        self.viewControllers = controllers
    }
}
