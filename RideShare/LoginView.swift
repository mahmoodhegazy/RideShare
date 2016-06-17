//
//  LoginView.swift
//  RideShare
//
//  Created by Amr Guzlan on 2016-06-17.
//  Copyright © 2016 Amro Gazlan. All rights reserved.
//

import UIKit
@IBDesignable
class LoginView: UIView {
    @IBInspectable
    var loginViewBackgroundColor : UIColor = UIColor(red: CGFloat(0.988), green: CGFloat(0.329), blue: CGFloat(0.298), alpha: CGFloat(1.00)) {didSet{
        self.backgroundColor = loginViewBackgroundColor;
        setNeedsDisplay()}}
    
}
