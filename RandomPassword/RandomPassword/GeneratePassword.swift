//
//  GeneratePassword.swift
//  RandomPassword
//
//  Created by ShadowFox on 4/11/16.
//  Copyright © 2016 ShadowFox. All rights reserved.
//

import Foundation

private let characters = ("0123456789abcdefghijklmnopqrstuvwxyz"+"ABCDEFGHIJKLMNOPQRSTUVWXYZ").characters
func generateRandomString(length: Int) -> String {
    var string = ""
    for _ in 0..<length{
        string.append(generateRandomCharacter())
    }
    return string
}

func generateRandomCharacter() -> Character{
    let idx = Int(arc4random_uniform(UInt32(characters.count)))
    return characters[characters.startIndex.advancedBy(idx)]
}