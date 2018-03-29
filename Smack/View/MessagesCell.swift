//
//  MessagesCell.swift
//  Smack
//
//  Created by Ryan Flores on 3/29/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import UIKit

class MessagesCell: UITableViewCell {

 

    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var timeStampLbl: UILabel!
    @IBOutlet weak var messageBodyLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(message: Messages) {
        messageBodyLbl.text = message.messageBody
        userNameLbl.text = message.userName
        userImg.image = UIImage(named: message.userAvatar)
        userImg.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }

}
