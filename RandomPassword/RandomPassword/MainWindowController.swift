//
//  MainWindowController.swift
//  RandomPassword
//
//  Created by ShadowFox on 4/10/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {

    @IBOutlet weak var textField: NSTextField!
    
    override var windowNibName: String?{
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        print("window loaded from NIB named\(windowNibName)")

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    @IBAction func generatePassword(sender: AnyObject) {
        let length = 8
        let password = generateRandomString(length)
        textField.stringValue = password
    }
    
}
