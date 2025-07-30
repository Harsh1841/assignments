//
//  ViewController.swift
//  loginPractice
//
//  Created by Student on 30/07/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgetUsernameTextField: UIButton!
    @IBOutlet weak var forgetPasswordTedxtField: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else { return }
        
        if  sender == forgetUsernameTextField {
            segue.destination.navigationItem.title = "Forget Username"
        }
        else if sender == forgetPasswordTedxtField {
            segue.destination.title = "Forget Password"
        }
        else{
            
            if  usernameTextField.text == "harsh" && passwordTextField.text == "1234" {
                segue.destination.title = "Welcome \(usernameTextField.text!)"
            }
            else {
                segue.destination.title = "username must not be empty"
            }
        }
    }
    
    
    @IBAction func forgetusername(_ sender: Any) {
        performSegue(withIdentifier: "greySegue", sender: sender)
    }
    
    @IBAction func forgetpassword(_ sender: Any) {
        performSegue(withIdentifier: "greySegue", sender: sender)
    }
    
}

