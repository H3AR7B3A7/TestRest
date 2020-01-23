//
//  LoginViewController.swift
//  TestRest
//
//  Created by mobapp12 on 23/01/2020.
//  Copyright © 2020 EhB. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passWordTF: UITextField!
    @IBOutlet weak var rememberSwitch: UISwitch!
    
    let settings = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(settings.bool(forKey: "pref_credentials")){
            userNameTF.text = settings.string(forKey: "pref_username")
            passWordTF.text = settings.string(forKey: "pref_password")
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(rememberSwitch.isOn){
            settings.set(rememberSwitch.isOn, forKey: "pref_credentials")
            settings.set(userNameTF.text,forKey: "pref_username")
            settings.set(passWordTF.text, forKey: "pref_password")
        }
    }
}
