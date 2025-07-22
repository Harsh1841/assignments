//
//  ViewController.swift
//  Activity
//
//  Created by Student on 21/07/25.
//

import UIKit

class pinkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tabBarItem.badgeValue = "1"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
        tabBarItem.badgeValue = nil
    }


}

