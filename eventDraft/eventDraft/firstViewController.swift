//
//  firstViewController.swift
//  eventDraft
//
//  Created by Student on 12/08/25.
//

import UIKit


protocol dataPassing
{
    func dataPassinginFirstVC(titleData : String? , dateDate : String? , locationData : String? , attendeData : String?)
}


class firstViewController: UIViewController , dataPassing{

    
    
    
    var titleData: String?
    var dateData : String?
    var locationData : String?
    var attendeeData : String?
    
    
    func dataPassinginFirstVC(titleData: String?, dateDate: String?, locationData: String?, attendeData: String?) {
        self.titleData = titleData
        self.dateData = dateDate
        self.attendeeData = attendeData
        self.locationData = locationData
        updateUI()
    }
    
    
  
    
    @IBOutlet weak var firstTitleLabel: UILabel!
    
    
    @IBOutlet weak var firstDateLabel: UILabel!
    
    
    @IBOutlet weak var firstLocationLabel: UILabel!
    
    @IBOutlet weak var firstAttendeLabel: UILabel!
    
    @IBSegueAction func showEditScene(_ coder: NSCoder) -> secondViewController? {
        let secondVC: secondViewController? = secondViewController(coder: coder, titleData: titleData, dateData: dateData, locationData: locationData, attendeeData: attendeeData)
        secondVC?.delegate = self
        return secondVC
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleData = firstTitleLabel.text
        dateData = firstDateLabel.text
        locationData = firstLocationLabel.text
        attendeeData = firstAttendeLabel.text
    }
    

    

//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let navigationController = segue.destination as? UINavigationController,
//            let secondVC = navigationController.topViewController as? secondViewController{
//            secondVC.titleData = firstTitleLabel.text
//            secondVC.dateData = firstDateLabel.text
//            secondVC.locationData = firstLocationLabel.text
//            secondVC.attendeeData = firstAttendeLabel.text
//        }
//    }

    func updateUI()
    {
        firstDateLabel.text = dateData
        firstTitleLabel.text = titleData
        firstAttendeLabel.text = attendeeData
        firstLocationLabel.text = locationData
    }
}
