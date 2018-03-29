//
//  UserAvatar.swift
//  Smack
//
//  Created by Ryan Flores on 3/19/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import UIKit


class UserAvatar: UIImageView {

        override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
}
