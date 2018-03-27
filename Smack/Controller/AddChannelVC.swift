//
//  AddChannelVC.swift
//  Smack
//
//  Created by Ryan Flores on 3/27/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import UIKit

class AddChannelVC: UIViewController {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var channelName: UITextField!
    
    @IBOutlet weak var channelDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
    
    func setupView() {
        let closeTouch = UITapGestureRecognizer(target: self, action: #selector(AddChannelVC.closeTap(_:)))
        bgView.addGestureRecognizer(closeTouch)
        
        channelName.attributedPlaceholder = NSAttributedString(string: "name", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
        channelDescription.attributedPlaceholder = NSAttributedString(string: "description", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceHolder])
    }
    
    @objc func closeTap(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }


    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createChannelBtnPressed(_ sender: Any) {
    }
    
}
