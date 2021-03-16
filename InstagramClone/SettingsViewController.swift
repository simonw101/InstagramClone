//
//  SettingsViewController.swift
//  InstagramClone
//
//  Created by Simon Wilson on 15/03/2021.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func logoutClicked(_ sender: Any) {
        
        do {
            
            try Auth.auth().signOut()
            
            self.performSegue(withIdentifier: "toViewController", sender: nil)
            
        } catch {
            
            print("unable to sign out")
            
        }
        
    }
}
