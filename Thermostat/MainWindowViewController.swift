//
//  MainWindowViewController.swift
//  Thermostat
//
//  Created by ShadowFox on 4/21/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

class MainWindowViewController: NSWindowController {
    
    private var privateTemperature = 68
    dynamic var temperature : Int{
        set{
            print("set temperature to \(newValue)")
            privateTemperature = newValue
        }
        get{
            print("get temperature")
            return privateTemperature
        }
    }
    
    dynamic var isOn = true
    
    override var windowNibName: String{
        return "MainWindowViewController"
    }
    

    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }
    
    override func setNilValueForKey(key: String) {
        switch key {
        case "temperature":
            temperature = 68
        default:
            super.setNilValueForKey(key)
        }
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
