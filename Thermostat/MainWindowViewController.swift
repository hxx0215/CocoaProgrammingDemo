//
//  MainWindowViewController.swift
//  Thermostat
//
//  Created by ShadowFox on 4/21/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

class MainWindowViewController: NSWindowController {
    
    dynamic var temperature = 68
    
    override var windowNibName: String{
        return "MainWindowViewController"
    }
    

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    @IBAction func makeWarmer(sender: NSButton) {
//        willChangeValueForKey("temperature")
        temperature += 1
//        didChangeValueForKey("temperature")
    }
    @IBAction func makeCooler(sender: NSButton) {
//        willChangeValueForKey("temperature")
        temperature -= 1
//        didChangeValueForKey("temperature")
    }
}
