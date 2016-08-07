//
//  sataPost.swift
//  sataSwift
//
//  Created by Sunny Thakkar on 6/08/2016.
//  Copyright © 2016 Sunny Thakkar. All rights reserved.
//

import UIKit
import Parse

class sataPost: NSObject {
    
    
    //To Save parse object
    
    func save(parseObject:PFObject)->Void
    {
    
        parseObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
        
        print("Object has been saved.")}
        
    }
    
    
}
