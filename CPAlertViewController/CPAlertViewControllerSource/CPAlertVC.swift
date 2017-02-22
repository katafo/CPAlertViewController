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
        negButton.isHidden = true
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundOpacity)
    }
    
    //MARK: - CONFIG
    
    class func show(in viewController: UIViewController, title: String, message: String, animationType: CPAlertAnimationType = .scale) -> CPAlertVC{
        
        let alertStoryboard = UIStoryboard(name: "CPAlert", bundle: nil)
        let alertVC = alertStoryboard.instantiateViewController(withIdentifier: "CPAlertVC") as! CPAlertVC
        
        alertVC.modalTransitionStyle = .crossDissolve
        alertVC.modalPresentationStyle = .overCurrentContext
        
        viewController.present(alertVC, animated: false, completion: {
            
            alertVC.startAnimated(type: animationType)
            alertVC.titleLabel.text = title
            alertVC.messageLabel.text = message
        
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
    
    func addAction(_ action: CPAlertAction){
        switch action.type{
        case .normal:
            posButton.setTitle(action.title, for: .normal)
            posHandler = action.handler
        case .cancel:
            negButton.isHidden = false
            negButton.setTitle(action.title, for: .normal)
            negHandler = action.handler
        }
    }
    
    //MARK: - ACTION
    
    @IBAction func tapPositiveButton(_ sender: Any) {
        if let posHandler = posHandler{
            posHandler()
        }
        dismiss(animated: true, completion: nil)
    }
    @IBAction func tapNegativeButton(_ sender: Any) {
        if let negHandler = negHandler{
            negHandler()
        }
        dismiss(animated: true, completion: nil)

    }
}
