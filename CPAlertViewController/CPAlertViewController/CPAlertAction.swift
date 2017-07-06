//
//  CPAlertAction.swift
//  CPAlertViewController
//
//  Created by Phong Cao on 2/21/17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

enum CPAlertActionType{
    case normal
    case cancel
}

typealias CPAlertActionHandler = () -> Void

class CPAlertAction{
    
    let title: String
    let type: CPAlertActionType
    let handler: CPAlertActionHandler?
    
    init(title: String, type: CPAlertActionType, handler: CPAlertActionHandler?){
        self.title = title
        self.type = type
        self.handler = handler
    }
    
}
