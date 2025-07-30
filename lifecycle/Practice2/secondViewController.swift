//
//  secondViewController.swift
//  Practice2
//
//  Created by Student on 22/07/25.
//

import UIKit

class secondViewController: UIViewController {

   override func viewDidLoad() {
        super.viewDidLoad()
       print("second view is loaded")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("second view will appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("second view will disapper")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("first view did appear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("second view did disappear")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    

}
