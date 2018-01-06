//
//  CustomAlertVC.swift
//  CPAlertViewController
//
//  Created by Phong Cao on 3/11/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class CustomAlertVC: CPAlertVC {

    //MARK: - DECLARE
    
    @IBOutlet weak var imageView: UIImageView!
    var imgLogo: UIImage?
    
    //MARK: - CONFIG
    
    func showCheckImage(_ isCheck: Bool) {
        imgLogo = (isCheck) ? #imageLiteral(resourceName: "ic_check") : #imageLiteral(resourceName: "ic_music")    
    }
    
    /// Custom your UI in here

    override func configUI() {
        
        super.configUI()
        self.imageView.image = imgLogo
        
    }
    
}
