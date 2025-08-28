//
//  FirstViewController.swift
//  Practice_DataPassing
//
//  Created by Student on 11/08/25.
//

import UIKit


protocol DelegateDataPassing
{
    func passData(textField  : String? , label : String? , slider : Float)
}

class FirstViewController: UIViewController  , DelegateDataPassing {
    var textFieldData : String?
    var labelData : String?
    var sliderData : Float?
    func passData(textField: String? , label : String? , slider : Float) {
        firstTextField.text = textField
        firstLabel.text = label
        firstSlider.value = slider
        
        
    }
    @IBOutlet weak var firstLabel: UILabel!
    
    
    @IBOutlet weak var firstSlider: UISlider!
    
    
    @IBOutlet weak var firstTextField: UITextField!
    
    
    @IBSegueAction func passDataToSecondVC(_ coder: NSCoder) -> SecondViewController? {
        
        let labelData = firstLabel.text
        let sliderData = firstSlider.value
        let textFieldData = firstTextField.text
         let secondVC = SecondViewController(coder: coder, labelData: labelData, sliderData: sliderData, textFieldData: textFieldData)
        secondVC?.delegate = self
        
        return  secondVC
    }
    
    
//    @IBAction  func unwindToFirstVC( segue: UIStoryboardSegue) {
//        guard let  source = segue.source as? SecondViewController else {return}
//        
//        firstLabel.text = source.secondLabel.text
//        firstSlider.value = source.secondSlider.value
//        firstTextField.text = source.secondTextField.text
//    }
//    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    
  
    
    
    
    
    
    

}



