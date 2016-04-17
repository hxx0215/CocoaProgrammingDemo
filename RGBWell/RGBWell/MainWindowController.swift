//
//  MainWindowController.swift
//  RGBWell
//
//  Created by ShadowFox on 4/13/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController {
    
    @IBOutlet weak var colorWell: NSColorWell!
    
    var r = 0.0
    var g = 0.0
    var b = 0.0
    let a = 1.0
    
    override var windowNibName: String?{
        return "MainWindowController"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        updateColor()
    }
    
    @IBAction func adjustRed(sender: NSSlider){
        print("R slider's value is \(sender.floatValue)")
        r = sender.doubleValue
        updateColor()
    }
    
    @IBAction func adjustBlue(sender: NSSlider){
        print("B slider's value is \(sender.floatValue)")
        b = sender.doubleValue
        updateColor()
    }
    
    @IBAction func adjustGreen(sender: NSSlider){
        print("G slider's value is \(sender.floatValue)")
        g = sender.doubleValue
        updateColor()
    }
    
    func updateColor(){
        let color = NSColor(calibratedRed: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
        colorWell.color = color
    }
}