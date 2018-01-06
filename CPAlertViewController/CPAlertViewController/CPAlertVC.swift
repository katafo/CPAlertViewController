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
    
    var backgroundColor: UIColor = .black
    var backgroundOpacity: CGFloat = 0.5
    var animateDuration: TimeInterval = 1.0
    
    var scaleX: CGFloat = 0.3
    var scaleY: CGFloat = 1.5
    var rotateRadian:CGFloat = 1.5 // 1 rad = 57 degrees
    
    var springWithDamping: CGFloat = 0.7
    var delay: TimeInterval = 0
    
    var titleMessage: String = ""
    var message: String = ""
    var animationType: CPAlertAnimationType = .scale
    
    var cornerRadius: CGFloat = 4
    var alpha: CGFloat = 0
    
    private var negativeAction: CPAlertAction?
    private var positiveAction: CPAlertAction?
    
    //MARK: - LIFECYCLE
    
    convenience init(title: String, message: String, animationType: CPAlertAnimationType = .scale) {
        
        self.init()
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationStyle = .overCurrentContext
        self.titleMessage = title
        self.message = message
        self.animationType = animationType
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        alertView.alpha = alpha
        alertView.layer.cornerRadius = cornerRadius
        
        view.backgroundColor = backgroundColor.withAlphaComponent(backgroundOpacity)
        setupButton()
        setupUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimating(type: self.animationType)
    }
    
    //MARK: - CONFIG
    
    func show(into viewController: UIViewController?) {
        
        guard let viewController = viewController else { return }
        viewController.present(self, animated: false, completion: nil)
        
    }
    
    private func setupUI() {
        
        if titleLabel != nil {
            titleLabel.text = titleMessage
        }
        
        if messageLabel != nil {
            messageLabel.text = message
        }
        
    }
    
    private func setupButton() {
        
        if let posAction = self.positiveAction {
            self.posButton.setTitle(posAction.title, for: .normal)
        }
        
        if negButton != nil {
            negButton.isHidden = true
        }
        
        if let negAction = self.negativeAction {
            self.negButton.isHidden = false
            self.negButton.setTitle(negAction.title, for: .normal)
        }
        
    }
    
    private func startAnimating(type: CPAlertAnimationType) {
        
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
        UIView.animate(withDuration: animateDuration, delay: delay, usingSpringWithDamping: springWithDamping, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            self.alertView.transform = .identity
        }, completion: nil)
        
    }
    
    func addAction(_ action: CPAlertAction) {
        switch action.type{
        case .normal:
            positiveAction = action
        case .cancel:
            negativeAction = action
        }
    }
    
    //MARK: - ACTION
    
    @IBAction func tapPositiveButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            if let posHandler = self.positiveAction?.handler{
                posHandler()
            }
        })
    }
    @IBAction func tapNegativeButton(_ sender: Any) {
        dismiss(animated: true, completion: {
            if let negHandler = self.negativeAction?.handler{
                negHandler()
            }
        })
    }
}

