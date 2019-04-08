//
//  Int+Ext.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation

extension Int {
    func stringValue() -> String {
        return String(self)
    }
    
    func formatWithCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}
