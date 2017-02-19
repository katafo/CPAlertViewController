//
//  CPAlertVC.swift
//  CPAlertView
//
//  Created by Phong Cao on 2/18/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

enum CPAlertAnimationType{
    case scale
    case rotate
    case bounceUp
    case bounceDown
}

enum CPAlertType{
    case notice
    case confirm
}

class CPAlertVC: UIViewController {

    //MARK: - DECLARE
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var posButton: UIButton!
    @IBOutlet weak var negButton: UIButton!
    
    let backgroundOpacity: Float = 0.5
    let animateDuration: TimeInterval = 1.0
    
    let scaleX: CGFloat = 0.3
    let scaleY: CGFloat = 1.5
    let rotateRadian:CGFloat = 1.5 // 1 rad = 57 degrees
    
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.alpha = 0
        alertView.layer.cornerRadius = 4
        negButton.isHidden = true
        view.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: backgroundOpacity)
    }
    
    //MARK: - CONFIG
    
    class func show(in viewController: UIViewController, title: String, message: String, posTitle: String = "Got it!", negTitle: String = "Cancel", posAction: Selector? = nil, negAction: Selector? = nil,alertType: CPAlertType = .notice, animationType: CPAlertAnimationType = .scale) -> CPAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "CPAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "CPAlertVC") as! CPAlertVC
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        
        viewController.present(alertVC, animated: false, completion: {
            
            alertVC.startAnimated(type: animationType)
            alertVC.titleLabel.text = title
            alertVC.messageLabel.text = message
            
            alertVC.posButton.setTitle(posTitle, for: .normal)
            alertVC.negButton.setTitle(negTitle, for: .normal)
            
            if alertType == .notice{
                alertVC.negButton.isHidden = true
            }else{
                alertVC.negButton.isHidden = false
            }

            alertVC.configButtonAction(in: viewController, posAction: posAction, negAction: negAction)

        })
        
        return alertVC
        
    }

    func startAnimated(type: CPAlertAnimationType){
        
        alertView.alpha = 1
        switch type {
        case .rotate:
            alertView.transform = CGAffineTransform(rotationAngle: rotateRadian)
        case .bounceUp:
            let screenHeight = UIScreen.main.bounds.height/2 + alertView.frame.height/2
            alertView.transform = CGAffineTransform(translationX: 0, y: screenHeight)
        case .bounceDown:
            let screenHeight = -(UIScreen.main.bounds.height/2 + alertView.frame.height/2)
            alertView.transform = CGAffineTransform(translationX: 0, y: screenHeight)
        default:
            alertView.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
        }
        UIView.animate(withDuration: animateDuration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.alertView.transform = .identity
        }, completion: nil)
        
    }
    
    func configButtonAction(in viewController: UIViewController, posAction: Selector?, negAction: Selector?){
        
        if let posAction = posAction{
            posButton.addTarget(viewController, action: posAction, for: .touchUpInside)
        }else{
            posButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        }
        
        if let negAction = negAction{
            negButton.addTarget(viewController, action: negAction, for: .touchUpInside)
        }else{
            negButton.addTarget(self, action: #selector(dismiss(_:)), for: .touchUpInside)
        }
        
    }
    
    //MARK: - ACTION

    func dismiss(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }
    
}
