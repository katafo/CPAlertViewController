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
    
    override class func create() -> CustomAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "CustomAlertVC") as! CustomAlertVC
        
        return alertVC
        
    }
    
    func showCheckImage(_ isCheck: Bool){
        
        imgLogo = (isCheck) ? #imageLiteral(resourceName: "ic_check") : #imageLiteral(resourceName: "ic_music")
        
    }
    
    /// Custom your UI in here

    override func customizeUI() {
        
        self.imageView.image = imgLogo
        
    }
    
}
