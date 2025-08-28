//
//  SecondViewController.swift
//  Practice_DataPassing
//
//  Created by Student on 11/08/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    var delegate : DelegateDataPassing?
    
    @IBOutlet weak var secondLabel: UILabel!
    
    
    @IBOutlet weak var secondSlider: UISlider!
    
    @IBOutlet weak var secondTextField: UITextField!
    
    
    var labelData : String?
    var sliderData : Float?
    var textFieldData : String?
    
    
    init?(coder : NSCoder ,labelData : String? , sliderData : Float? , textFieldData : String?)
    {
        self.labelData = labelData
        self.sliderData = sliderData
        self.textFieldData = textFieldData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let labelData , let sliderData , let textFieldData
        {
            updateUI(labelData: labelData, sliderData: sliderData, textFieldData: textFieldData)
        }
        
        
        
        func updateUI(labelData : String , sliderData : Float , textFieldData : String)
        {
            secondLabel.text = labelData
            
            secondSlider.value = sliderData
            secondTextField.text = textFieldData
            
        }
      
        
       
       
       
        
        
        
    }
    func passDataToFirstVC()
    {
        delegate?.passData(textField: secondTextField.text, label: secondLabel.text, slider: secondSlider.value)
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        passDataToFirstVC()
        dismiss(animated: true)
    }
}
