//
//  ViewController.swift
//  loginForm
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {

    
   
    @IBOutlet weak var forgetUsernameBtn: UIButton!
    
    @IBOutlet weak var forgetPasswordBtn: UIButton!
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
       guard let sender = sender as? UIButton else { return }
        
        if sender == forgetUsernameBtn
        {
            segue.destination.navigationItem.title = "Forget Username"
        }
        else if sender == forgetPasswordBtn
        {
            segue.destination.navigationItem.title = "Forget Password"
        }
        else{
            segue.destination.navigationItem.title = username.text
        }
    }
    @IBAction func forgetUserNameButton(_ sender: Any) {
        performSegue(withIdentifier: "loginsegue", sender: sender)
        
    
    }
    @IBAction func forgetPasswordButton(_ sender: Any) {
        
        performSegue(withIdentifier: "loginsegue", sender: sender)
    }
    
    
}

