//
//  MainWindowController.swift
//  SpeakLine
//
//  Created by ShadowFox on 4/19/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Cocoa

class MainWindowController: NSWindowController,NSSpeechSynthesizerDelegate,NSWindowDelegate,NSTableViewDataSource,NSTableViewDelegate {

    @IBOutlet weak var textField: NSTextField!
    @IBOutlet weak var speakButton: NSButton!
    @IBOutlet weak var stopButton: NSButton!
    @IBOutlet weak var tableView: NSTableView!
    
    let speechSynth = NSSpeechSynthesizer()
    let voices = NSSpeechSynthesizer.availableVoices()
    override func windowDidLoad() {
        super.windowDidLoad()

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
        stopButton.enabled = false
        speechSynth.delegate = self
        
        let defaultVoice = NSSpeechSynthesizer.defaultVoice()
        if let defaultRow = voices.indexOf(defaultVoice){
            let indices = NSIndexSet(index: defaultRow)
            tableView.selectRowIndexes(indices, byExtendingSelection: false)
            tableView.scrollRowToVisible(defaultRow)
        }
    }
    
    override var windowNibName: String?{
        return "MainWindowController"
    }
    
    @IBAction func speakIt(sender: NSButton){
        let string = textField.stringValue
        
        if string.isEmpty{
            print("string from \(textField) is empty")
        }else{
            speechSynth.startSpeakingString(string)
            stopButton.enabled = true
            speakButton.enabled = false
        }
    }
    
    @IBAction func stopIt(sender: NSButton){
        speechSynth.stopSpeaking()
        
        stopButton.enabled = false
        speakButton.enabled = true
    }
    
    func speechSynthesizer(sender: NSSpeechSynthesizer, didFinishSpeaking finishedSpeaking: Bool) {
        stopButton.enabled = false
        speakButton.enabled = true
    }
    
    func windowShouldClose(sender: AnyObject) -> Bool {
        return true
    }
    
    func voiceForIdentifier(identifier: String) -> String?{
        return NSSpeechSynthesizer.attributesForVoice(identifier)[NSVoiceName] as? String
    }
    
    func numberOfRowsInTableView(tableView: NSTableView) -> Int {
        return voices.count
    }
    
    func tableView(tableView: NSTableView, objectValueForTableColumn tableColumn: NSTableColumn?, row: Int) -> AnyObject? {
        let voice = voices[row]
        let voiceName = voiceForIdentifier(voice)
        return voiceName
    }
    
    func tableViewSelectionDidChange(notification: NSNotification) {
        let row = tableView.selectedRow
        if row == -1 {
            speechSynth.setVoice(nil)
            return
        }
        let voice = voices[row]
        speechSynth.setVoice(voice)
    }
}
