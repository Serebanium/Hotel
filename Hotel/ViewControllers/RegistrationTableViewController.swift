//
//  RegintrationTableViewController.swift
//  Hotel
//
//  Created by Сергей Иванов on 03/03/2019.
//  Copyright © 2019 topMob. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var checkInDateLabel: UILabel!
    @IBOutlet weak var checkOutDataLabel: UILabel!
    @IBOutlet weak var checkInDatePicker: UIDatePicker!
    @IBOutlet weak var checkOutDataPicker: UIDatePicker!
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfChildrensLabel: UILabel!
    @IBOutlet weak var numberOfAdultsSteper: UIStepper!
    @IBOutlet weak var numberOfChildrensSteper: UIStepper!
    
    let checkInLabelIndexPath = IndexPath(row: 0, section: 1)
    let checkInPickerIndexPath = IndexPath(row: 1, section: 1)
    let checkOutLabelIndexPath = IndexPath(row: 2, section: 1)
    let checkOutPickerIndexPath = IndexPath(row: 3, section: 1)
    
    var isCheckInPickerShow = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInPickerShow
        }
    }
    var isCheckOutPickerShow = false {
        didSet {
            checkOutDataPicker.isHidden = !isCheckOutPickerShow
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let midnightToday = Calendar.current.startOfDay(for: Date())
        checkInDatePicker.minimumDate = midnightToday
        checkInDatePicker.date = midnightToday
        
        updateDateViews()
        updateNumberOfGuests()
    }
    
    func updateDateViews() {
        
        checkOutDataPicker.minimumDate = checkInDatePicker.date.addingTimeInterval(24*60*60)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
        checkOutDataLabel.text = dateFormatter.string(from: checkOutDataPicker.date)
    }
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsSteper.value))"
        numberOfChildrensLabel.text = "\(Int(numberOfChildrensSteper.value))"
    }
    
    @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let emailAddress = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDataPicker.date
        let numberOfAdults = Int(numberOfAdultsSteper.value)
        let numberOfChildren = Int(numberOfChildrensSteper.value)
        
        let registration = Regictration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: emailAddress,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren
        )
        
        print(registration)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        updateDateViews()
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
   
    @IBAction func firstNameTextFieldEditing(_ sender: UITextField) {
        if firstNameTextField.text != "" &&
            lastNameTextField.text != "" &&
            emailTextField.text != ""
        {
            doneBarButton.isEnabled = true
        } else {
            doneBarButton.isEnabled = false
        }
    }
    
    
}

extension RegistrationTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath {
        case checkInLabelIndexPath:
            isCheckInPickerShow.toggle()
            isCheckOutPickerShow = false
        case checkOutLabelIndexPath:
            isCheckOutPickerShow.toggle()
            isCheckInPickerShow = false
        default:
            return
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath {
        case checkInPickerIndexPath:
            return isCheckInPickerShow ? 216 : 0
        case checkOutPickerIndexPath:
            return isCheckOutPickerShow ? 216: 0
        default:
            return 44
        }
        
    }
}
