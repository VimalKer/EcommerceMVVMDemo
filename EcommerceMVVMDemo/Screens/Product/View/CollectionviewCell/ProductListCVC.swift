//
//  ProductListCVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 26/09/24.
//

import UIKit

class ProductListCVC: UICollectionViewCell {

    @IBOutlet weak var imgProduct: CustomImageview!
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var lblReviewerName: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblRatings: UILabel!
    @IBOutlet weak var lblreviewerEmail: UILabel!
    
    var Product:ProductDataModel?{
        didSet{
            self.imgProduct.loadingImages(url: URL(string: (Product?.thumbnail)!)!)
            self.lblTitle.text     =  Product?.title
            self.lblRatings.text   =  "\(String((Product?.rating!)!))"
            self.lblreviewerEmail.text = Product?.reviews?[0].reviewerEmail
            self.lblCategory.text  = Product?.category
            self.lblReviewerName.text = Product?.reviews?[0].reviewerName
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
