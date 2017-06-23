//
//  CreateUsernameViewController.swift
//  Makesgram
//
//  Created by Lily Li on 6/22/17.
//  Copyright © 2017 Lily Li. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        guard let firUser = Auth.auth().currentUser,
        let username = usernameTextField.text,
            !username.isEmpty else {return}
        
        UserService.create(firUser, username: username) { (user) in
            guard let user = user else { return }
            
            User.setCurrent(user, writeToUserDefaults: true)
            
            let initialViewController = UIStoryboard.initialViewController(for: .main)
            self.view.window?.rootViewController = initialViewController
            self.view.window?.makeKeyAndVisible()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.clipsToBounds = true
        print("createuserview just loaded")
        // Do any additional setup after loading the view.
    }
}
