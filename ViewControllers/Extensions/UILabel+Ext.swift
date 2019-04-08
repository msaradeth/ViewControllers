//
//  UILabel+Ext.swift
//  WheelsCodingChallenge
//
//  Created by Mike Saradeth on 4/3/19.
//  Copyright © 2019 Mike Saradeth. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func circle() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.layer.masksToBounds = true
    }
}
