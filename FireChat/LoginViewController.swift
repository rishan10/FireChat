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
import JSQMessagesViewController

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBAction func onSubmit(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" {
            if segmentedControl.selectedSegmentIndex == 0 { //Login
                
                FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    if user != nil {
                        
                        self.performSegue(withIdentifier: "loginToNav", sender: self)
                    }else if let myError = error?.localizedDescription {
                        self.createAlert(title: "ERROR", message: myError)
                    }else{
                        self.createAlert(title: "ERROR", message: "There was an unknown error")
                    }
                })
            }else if segmentedControl.selectedSegmentIndex == 1 { //Signup
                
                FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                    
                    if user != nil {
                        self.performSegue(withIdentifier: "loginToNav", sender: self)
                    }else if let myError = error?.localizedDescription {
                        self.createAlert(title: "ERROR", message: myError)
                    }else{
                        self.createAlert(title: "ERROR", message: "There was an unknown error")
                    }

                    
                })
            }
            
        }
    }
    
    func createAlert (title:String, message:String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        //CREATING ON BUTTON
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            
        }))
        
        
        self.present(alert, animated: true, completion: nil)
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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        super.prepare(for: segue, sender: sender)
//    }
}

