//
//  Employee.swift
//  RaiseMan
//
//  Created by ShadowFox on 4/24/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Foundation
class Employee: NSObject {
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
//    override func validateValue(ioValue: AutoreleasingUnsafeMutablePointer<AnyObject?>, forKey inKey: String) throws {
//        <#code#>
//    }
}