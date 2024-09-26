//
//  HomeProductTVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 26/09/24.
//

import UIKit

class HomeProductTVC: UITableViewCell {
    
    @IBOutlet weak var lblTitle        : UILabel!
    @IBOutlet weak var lblCategory     : UILabel!
    @IBOutlet weak var lblCost         : UILabel!
    @IBOutlet weak var lblThumnailmages: CustomImageview!
    
    var Product:ProductDataModel?{
        didSet{
            self.lblTitle.text =  Product?.title
            self.lblCost.text  = "\(String(describing: Product!.price!))"
            self.lblCategory.text   = Product?.category
            self.lblThumnailmages.loadingImages(url: URL(string: (Product?.thumbnail)!)!)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
