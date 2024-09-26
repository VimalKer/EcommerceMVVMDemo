//
//  HomeUsersCVC.swift
//  EcommerceMVVMDemo
//
//  Created by Apple on 26/09/24.
//

import UIKit

class HomeUsersCVC: UICollectionViewCell {

    @IBOutlet weak var imgUser      : CustomImageview!
    @IBOutlet weak var lblUserName  : UILabel!
    @IBOutlet weak var lblphone     : UILabel!
    @IBOutlet weak var lblCity      : UILabel!
    @IBOutlet weak var lblBloodGroup: UILabel!
    
    var Users:UsersDataModel?{
        didSet{
            
            self.imgUser.loadingImages(url: URL(string: (Users?.image)!)!)
            self.lblUserName.text = "\(Users!.firstName!) \(Users!.lastName!)" 
            self.lblphone.text   =  Users?.phone
            self.lblCity.text   =  Users?.address?.city
            self.lblBloodGroup.text = Users?.bloodGroup
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
