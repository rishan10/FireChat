//
//  LoginViewController.swift
//  FireChat
//
//  Created by Rishan Girish on 9/8/17.
//  Copyright © 2017 Rishan Girish. All rights reserved.
//

import Foundation
import Firebase
import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func onSubmit(_ sender: Any) {
        if emailTextField.text != "" || passwordTextField.text != "" {
            if segmentedControl.selectedSegmentIndex == 0 { //Login
                
                FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    if user != nil {
                        self.performSegue(withIdentifier: "loginToNav", sender: self)
                    }else if let myError = error?.localizedDescription {
                        print(myError)
                    }else{
                        print("ERROR")
                    }
                })
            }else if segmentedControl.selectedSegmentIndex == 1 { //Signup
                
                FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    
                    if user != nil {
                        self.performSegue(withIdentifier: "loginToNav", sender: self)
                    }else if let myError = error?.localizedDescription {
                        print(myError)
                    }else{
                        print("ERROR")
                    }

                    
                })
            }
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        passwordTextField.isSecureTextEntry = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

