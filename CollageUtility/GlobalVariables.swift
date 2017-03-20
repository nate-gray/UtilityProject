//
//  GlobalVariables.swift
//  CollageUtility
//
//  Created by Gray, Nathan on 3/19/17.
//  Copyright © 2017 Gray, Nathan. All rights reserved.
//

import UIKit

class GlobalVariables {
    
    
    var canvasChanged = false
    var previousCanvasColor: UIColor!
    var newCanvasColor: UIColor!
    
    //MARK: TEST
    class var sharedManager: GlobalVariables {
        
        struct Static {
            
            static let instance = GlobalVariables()
            
        }
        
        return Static.instance
        
    }
    
}
