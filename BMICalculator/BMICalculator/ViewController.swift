//
//  ViewController.swift
//  BMICalculator
//
//  Created by Student on 14/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var weight: UITextField!
    
    @IBOutlet weak var calculateBMI: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
  
    }
    
    
    @IBAction func bmi(_ sender: Any) {
        let weightString = weight.text ?? ""
        let heightString = height.text ?? ""
        
        let weightValue = Double(weightString) ?? 0
        let heightValue = Double(heightString) ?? 0
        
        let bmiValue = weightValue / (heightValue * heightValue)
        
        calculateBMI.text = String(bmiValue)
    }
    

}

