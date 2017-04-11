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

class CPAlertVC: UIViewController {

    //MARK: - DECLARE
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var posButton: UIButton!
    @IBOutlet weak var negButton: UIButton!
    
    let backgroundColor: UIColor = .black
    let backgroundOpacity: CGFloat = 0.5
    let animateDuration: TimeInterval = 1.0
    
    let scaleX: CGFloat = 0.3
    let scaleY: CGFloat = 1.5
    let rotateRadian:CGFloat = 1.5 // 1 rad = 57 degrees
    
    private var negHandler: CPAlertActionHandler?
    private var posHandler: CPAlertActionHandler?
        
    //MARK: - LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertView.alpha = 0
        alertView.layer.cornerRadius = 4
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundOpacity)
        if negButton != nil{
            negButton.isHidden = true
        }
    }
    
    //MARK: - CONFIG
    
    class func show(title: String, message: String, animationType: CPAlertAnimationType = .scale) -> CPAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "CPAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "CPAlertVC") as! CPAlertVC
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        
        if let viewController = alertVC.getTopVC(){
            
            viewController.present(alertVC, animated: false, completion: {
                alertVC.startAnimated(type: animationType)
                alertVC.titleLabel.text = title
                alertVC.messageLabel.text = message
            })
            
        }
        
        return alertVC
        
    }
    
    func getTopVC(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController?{
        if let navigationController = controller as? UINavigationController{
            return getTopVC(controller: navigationController)
        }
        if let tabController = controller as? UITabBarController{
            if let selectedVC = tabController.selectedViewController{
                return getTopVC(controller: selectedVC)
            }
        }
        if let presentedVC = controller?.presentedViewController{
            return getTopVC(controller: presentedVC)
        }
        return controller
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
    
    func addAction(_ action: CPAlertAction){
        switch action.type{
        case .normal:
            posButton.setTitle(action.title, for: .normal)
            posHandler = action.handler
        case .cancel:
            guard negButton != nil else { return }
            negButton.isHidden = false
            negButton.setTitle(action.title, for: .normal)
            negHandler = action.handler
        }
    }
    
    //MARK: - ACTION
    
    @IBAction func tapPositiveButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            if let posHandler = self.posHandler{
                posHandler()
            }
        })
    }
    @IBAction func tapNegativeButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            if let negHandler = self.negHandler{
                negHandler()
            }
        })
    }
}
