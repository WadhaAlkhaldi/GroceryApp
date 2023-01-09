//
//  LoginViewController.swift
//  GroceryApp
//
//  Created by Wadha Alkhaldi on 16/06/1444 AH.
//

import UIKit
import FirebaseAuth
import Firebase
class LoginViewController: UIViewController {

   

        @IBOutlet weak var email: UITextField!

        @IBOutlet weak var pass: UITextField!
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
        }

        @IBAction func login(_ sender: Any) {
            self.performSegue(withIdentifier: "Nextt", sender: self)
            print("Log")
            guard let email = email.text else { return }
            guard let password = pass.text else { return }
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
                guard self != nil else { return }
                if(error != nil) {
                    print("Error, check username and password")
                    //print(error)
                    
                    return
                }
            }}
        
        @IBAction func signup(_ sender: Any) {
            self.performSegue(withIdentifier: "Nextt", sender: self)
            print("sign")
            guard let email = email.text else { return }
            guard let password = pass.text else { return }
            
            Auth.auth().createUser(withEmail: email, password: password) { [weak self] user, error in
                guard self != nil else { return }
                if(error != nil) {
                    print("Error, check username and password")
                    //print(error)
                    return
                }
            }
        }
    }

