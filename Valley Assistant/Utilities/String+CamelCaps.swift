//
//  String+CamelCaps.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 9/24/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

extension String {

    var camelCaps: String {
        var newString: String = ""

        let upperCase = CharacterSet.uppercaseLetters
        for scalar in self.unicodeScalars {
            if upperCase.contains(scalar) {
                newString.append(" ")
            }
            let character = Character(scalar)
            newString.append(character)
        }

        return newString
    }
}
