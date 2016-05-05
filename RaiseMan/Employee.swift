//
//  Employee.swift
//  RaiseMan
//
//  Created by ShadowFox on 4/24/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Foundation
class Employee: NSObject,NSCoding {
    var name: String? = "New Employee"
    var raise: Float = 0.05
    
    func validateRaise(raiseNumberPointer:AutoreleasingUnsafeMutablePointer<NSNumber?>,error outError:NSErrorPointer) -> Bool {
        let raiseNumber = raiseNumberPointer.memory
        if raiseNumber == nil{
            print("error")
            return false
        }
        return true
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        if let name = self.name{
            aCoder.encodeObject(name, forKey: "name")
        }
        aCoder.encodeFloat(raise, forKey: "raise")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObjectForKey("name") as? String
        raise = aDecoder.decodeFloatForKey("raise")
        super.init()
    }
    
    override init() {
        super.init()
    }
//    override func validateValue(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKey inKey: String) throws {
//        <#code#>
//    }
}