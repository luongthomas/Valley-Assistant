//
//  Array.swift
//  Valley Assistant
//
//  Created by Thomas Luong on 10/9/19.
//  Copyright © 2019 Lithogen. All rights reserved.
//

import Foundation

extension Array {
    var printArray: String  {
        var str = ""
        for element in self {
            str += "\(element) ".capitalized
        }
        return str
    }
}
