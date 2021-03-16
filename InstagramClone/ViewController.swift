//
//  ViewController.swift
//  InstagramClone
//
//  Created by Simon Wilson on 15/03/2021.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toFeedVC", sender: nil)
        
        if emailTextField.text != "" && passwordTextField.text != nil {
            
            Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (data, error) in
        
                if error != nil {
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "None")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
            }
            
        } else {
            
            makeAlert(title: "Error", message: "username and password cannot be blank")
            
        }
        
    }
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (data, error) in
                
                if error != nil {
                    
                    self.makeAlert(title: "Error", message: error?.localizedDescription ?? "None")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                    
                }
                
            }
            
        } else {
            
            makeAlert(title: "Error", message: "Username/password cannot be blank")
            
        }
            
            
        }
    
    func makeAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(okButton)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

    
