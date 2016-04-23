//
//  AppDelegate.swift
//  Thermostat
//
//  Created by ShadowFox on 4/21/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var mainWindowViewController : MainWindowViewController?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        let mainWindowViewController = MainWindowViewController()
        mainWindowViewController.showWindow(self)
        self.mainWindowViewController = mainWindowViewController
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }


}

