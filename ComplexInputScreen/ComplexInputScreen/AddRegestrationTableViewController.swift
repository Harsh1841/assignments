import UIKit

class AddRegestrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    func selectRoomTypeTableViewController(_ controller: SelectRoomTypeTableViewController, didSelect roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
    var roomType : RoomType?
    
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDateLabel: UILabel!
    
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    @IBOutlet var roomTypeLabel: UILabel!
    
    
    @IBOutlet weak var numberOfNights: UILabel!
    
    
    @IBOutlet weak var dateFromAndTo: UILabel!
    
    @IBOutlet weak var totalRoomTypeCost: UILabel!
    
    
    @IBOutlet weak var roomTypeDetails: UILabel!
    
    @IBOutlet weak var wifiCost: UILabel!
    
    @IBOutlet weak var isWifi: UILabel!
    
    @IBOutlet weak var Total: UILabel!
    
    
    
    
    
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        
    }
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeTVC = SelectRoomTypeTableViewController(coder: coder)
        
        selectRoomTypeTVC?.delegate = self
        
        selectRoomTypeTVC?.roomType = self.roomType
        
        return selectRoomTypeTVC
        
    }
    
    
    @IBAction func cancilButtonSegue() {
        dismiss(animated: true ,completion: nil )
    }
    
    
    
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section: 1)
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set initial dates and minimum dates
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        checkOutDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        checkOutDatePicker.date = checkOutDatePicker.minimumDate!
        
        checkInDatePicker.isHidden = true
        checkOutDatePicker.isHidden = true
        
        updateDateViews()
        updateNumberOfGuests()
        updateRoomType()
        
        
        
        
    
    }
    func updateRoomType()
    {
        if let roomType = roomType
        {
            roomTypeLabel.text = "\(roomType.name)"
        }
        else
        {
            roomTypeLabel.text = "No Room Selected"
        }
        
        updateChargesFunc()
    }
    
    func updateDateViews() {
        // Update labels with formatted dates
        checkInDateLabel.text = checkInDatePicker.date.formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date.formatted(date: .abbreviated, time: .omitted)
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        if sender == checkInDatePicker {
            // When check-in changes, update minimum for check-out to be at least 1 day after
            let nextDay = Calendar.current.date(byAdding: .day, value: 1, to: checkInDatePicker.date)!
            checkOutDatePicker.minimumDate = nextDay
            
            // If current check-out date is earlier than min, update it
            if checkOutDatePicker.date < nextDay {
                checkOutDatePicker.date = nextDay
            }
        }
        updateDateViews()
        updateChargesFunc()
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        
        let hasWifi = wifiSwitch.isOn
        let roomChoice : String = roomTypeLabel.text ?? ""
        print("DONE TAPPED")
        print("firstName: \(firstName)")
        print("lastName: \(lastName)")
        print("email: \(email)")
        print("checkInDate: \(checkInDate)")
        print("checkOutDate: \(checkOutDate)")
        print("numberOfAdults: \(numberOfAdults)")
        print("numberOfChildren: \(numberOfChildren)")
        print("wifi : \(hasWifi)")
        print("roomType : \(roomChoice)")
        
       
        
    }
    
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == checkInDateLabelCellIndexPath &&
            isCheckOutDatePickerVisible == false {
            // Check-in label selected, check-out picker is notvisible, toggle check-in picker
            isCheckInDatePickerVisible.toggle()
        } else if indexPath == checkOutDateLabelCellIndexPath &&
                    isCheckInDatePickerVisible == false {
            // Check-out label selected, check-in picker is notvisible, toggle check-out picker
            isCheckOutDatePickerVisible.toggle()
        } else if indexPath == checkInDateLabelCellIndexPath ||
                    indexPath == checkOutDateLabelCellIndexPath {
            // Either label was selected, previous conditions failedmeaning at least one picker is visible, toggle both
            isCheckInDatePickerVisible.toggle()
            isCheckOutDatePickerVisible.toggle()
        } else {
            return
            }
    tableView.beginUpdates ()
    tableView.endUpdates ()
}


    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where !isCheckInDatePickerVisible:
            return 0
        case checkOutDatePickerCellIndexPath where !isCheckOutDatePickerVisible:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView,
                            estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath, checkOutDatePickerCellIndexPath:
            return 216
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    func updateNumberOfGuests () {
        numberOfAdultsLabel.text =
        "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text =
        "\(Int(numberOfChildrenStepper.value))"
    }
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
    }
    
    var regestration : Regestration?
    {
        guard let roomType = roomType else { return nil }
        let firstName = firstNameTextField.text ?? ""
        let lastname = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Regestration(firstname: firstName, lastname: lastname, emailAddress: email, checkInDate: checkInDate, checkOutDate: checkOutDate, numberOfAdults: numberOfAdults, numberOfChildren: numberOfChildren, wifi: hasWifi, roomType: roomType)
        
        

    }
    
    func updateChargesFunc()
    {
        let calender =  Calendar.current
        let startDate = calender.startOfDay(for: checkInDatePicker.date)
        let endDate = calender.startOfDay(for: checkOutDatePicker.date)
        let numberOfNightsComponents = calender.dateComponents([.day], from: startDate, to: endDate)
        numberOfNights.text = "\(numberOfNightsComponents.day ?? 0)"
        dateFromAndTo.text = "\(checkInDateLabel.text!) - \(checkOutDateLabel.text!)"
        roomTypeDetails.text = "\(roomTypeLabel.text!) - \(roomType?.price ?? -1)"
        let nights = numberOfNightsComponents.day ?? 0
        wifiCost.text = "\(Float(nights) * 10)$"
        isWifi.text = "\(wifiSwitch.isOn ?  "Yes" : "No")"
        totalRoomTypeCost.text = "\((roomType?.price ?? -1) * nights)"
        Total.text = "\(roomType?.price ?? -1) * \(nights) + \(Float(nights) * 10)"
        
    }

    
    
    
}
