//
//  secondViewController.swift
//  eventDraft
//
//  Created by Student on 12/08/25.
//

import UIKit

class secondViewController: UIViewController {
    var titleData: String?
    var dateData : String?
    var locationData : String?
    var attendeeData : String?
    var delegate : dataPassing?
    
    init?(coder: NSCoder, titleData: String?, dateData: String?, locationData: String?, attendeeData: String?) {
        self.titleData = titleData
        self.dateData = dateData
        self.locationData = locationData
        self.attendeeData = attendeeData
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    @IBOutlet weak var secondTitleTextField: UITextField!
    
    @IBOutlet weak var secondDateTextField: UITextField!
    
    
    @IBOutlet weak var secondLocationTextField: UITextField!
    
    @IBOutlet weak var secondAttendeTextField: UITextField!
    
    
    
    
    func updateUI()
    {
        secondTitleTextField.text = titleData
        secondDateTextField.text = dateData
        secondLocationTextField.text = locationData
        secondAttendeTextField.text = attendeeData
    }
    

    
    
    
    func dataPassingToFirstVC()
    {
        delegate?.dataPassinginFirstVC(titleData: secondTitleTextField.text, dateDate: secondDateTextField.text, locationData: secondLocationTextField.text, attendeData: secondAttendeTextField.text)
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        dataPassingToFirstVC()
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
}
