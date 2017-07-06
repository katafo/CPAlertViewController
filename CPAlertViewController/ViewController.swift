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
        alertVC = CPAlertVC.create().config(title: "Normal Alert", message: "Normal alert will have only one button.")
        alertVC.show(into: self)
    }

    @IBAction func openAlertWithAction(_ sender: Any) {
        alertVC = CPAlertVC.create().config(title: "Action Alert", message: "You can add your action to two buttons below. By default: Cancel button will dismiss alert.")
        alertVC.addAction(CPAlertAction(title: "OK", type: .normal, handler: {
            print("Tapped OK button")
        }))
        alertVC.addAction(CPAlertAction(title: "CANCEL", type: .cancel, handler: {
            print("Tapped Cancel button")
        }))
        alertVC.show(into: self)
    }
    
    @IBAction func openCustomStyleAlert(_ sender: Any) {
        let customAlertVC = CustomAlertVC.create().config(title: "Success", message: "Have a nice day !") as! CustomAlertVC
        customAlertVC.showCheckImage(true) // True: show ic_check, False: show ic_music
        customAlertVC.show(into: self)
    }

    @IBAction func openAlertWithRotateAnimation(_ sender: Any) {
        alertVC = CPAlertVC.create().config(title: "Rotate Animation", message: "Rotate ~90 degrees = 1.5 rad (1 rad = 57 degrees), you can change it in CPAlertVC.swift.", animationType: .rotate)
        alertVC.show(into: self)
    }
    @IBAction func openAlertWithBounceUpAnimation(_ sender: Any) {
        alertVC = CPAlertVC.create().config(title: "Bounce Up Animation", message: "Animating alert from bottom view to top view", animationType: .bounceUp)
        alertVC.springWithDamping = 0.75
        alertVC.animateDuration = 0.5
        alertVC.show(into: self)
    }
    @IBAction func openAlertWithBounceDownAniamtion(_ sender: Any) {
        alertVC = CPAlertVC.create().config(title: "Bounce Down Animation", message: "Animating alert from top view to bottom view", animationType: .bounceDown)
        alertVC.show(into: self)
    }
    
}

