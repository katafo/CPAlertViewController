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
    
    //MARK: - CONFIG
    
    // Add image argument when show popup
    
    class func show(in viewController: UIViewController, title: String, message: String, animationType: CPAlertAnimationType = .scale, image: UIImage) -> CPAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "CustomAlertVC") as! CustomAlertVC
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        
        viewController.present(alertVC, animated: false, completion: {
            alertVC.imageView.image = image
            alertVC.startAnimated(type: animationType)
            alertVC.titleLabel.text = title
            alertVC.messageLabel.text = message
        })
        
        return alertVC
        
    }
    
}
