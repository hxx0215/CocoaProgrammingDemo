//
//  AppDelegate.swift
//  CarLot
//
//  Created by ShadowFox on 5/7/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {


    func delay(seconds: NSTimeInterval, closure: ()->()) {
        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(seconds * Double(NSEC_PER_SEC)))
        dispatch_after(time, dispatch_get_main_queue()) {
            print("🕑")
            closure()
        }
    }
    
    func demo3() {
        var value = 42
        print("before closure: \(value)")
        delay(1) { [copyVal = value]in
            print("inside closure: \(copyVal)")
        }
        value = 1337
        print("after closure: \(value)")
    }

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        demo3()
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

