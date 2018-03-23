//
//  LoginVC.swift
//  Smack
//
//  Created by Ryan Flores on 3/13/18.
//  Copyright © 2018 Ryan Flores. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func closedBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func createAccountBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
