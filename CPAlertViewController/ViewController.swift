//
//  ViewController.swift
//  CPAlertViewController
//
//  Created by Phong Cao on 2/19/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alertVC: CPAlertVC!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openNormalAlert(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Normal Alert", message: "Normal alert will have only one button.")
    }

    @IBAction func openAlertWithAction(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Action Alert", message: "You can add your action to two buttons below. By default: Cancel button will dismiss alert.", posTitle: "OK", negTitle: "CANCEL", posAction: #selector(tapOkAction), negAction: #selector(tapCancelAction), alertType: .confirm)
    }
    
    @IBAction func openAlertWithScaleAnimation(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Scale Animation", message: "This is default aniamtion of CPAlertViewController", animationType: .scale)
    }
    @IBAction func openAlertWithRotateAnimation(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Rotate Animation", message: "Rotate ~90 degrees = 1.5 rad (1 rad = 57 degrees), you can change it in CPAlertVC.swift.", animationType: .rotate)
    }
    @IBAction func openAlertWithBounceUpAnimation(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Boucne Up Animation", message: "Animating alert from bottom view to top view", animationType: .bounceUp)
    }
    @IBAction func openAlertWithBounceDownAniamtion(_ sender: Any) {
        alertVC = CPAlertVC.show(in: self, title: "Boucne Down Animation", message: "Animating alert from top view to bottom view", animationType: .bounceDown)
    }
    
    //MARK: - ALERT ACTION
    
    func tapOkAction(){
        print("Tapped ok button !")
        alertVC.dismiss(animated: true, completion: nil)
    }
    
    func tapCancelAction(){
        print("Tapped cancel button !")
        alertVC.dismiss(animated: true, completion: nil)
    }
    
}

