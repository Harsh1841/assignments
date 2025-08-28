//
//  prepareUnwindVC2.swift
//  underStandingMultipleWaystoPassDataFrontAndBack
//
//  Created by Student on 08/08/25.
//

import UIKit

class prepareUnwindVC2: UIViewController {

  
    
    @IBOutlet weak var secondTextView: UITextField!
    
    var dataFromFirstVC: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let dataFromFirstVC = dataFromFirstVC {
            navigationItem.title = dataFromFirstVC
        }
    }
    

}
