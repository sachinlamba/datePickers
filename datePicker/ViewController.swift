//
//  ViewController.swift
//  datePicker
//
//  Created by Sachin Lamba on 01/08/16.
//  Copyright © 2016 LambaG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstLabelForDate: UILabel!
    @IBOutlet weak var textFieldDate: UITextField!
    @IBOutlet weak var datePickerDetails: UITextView!
    
    @IBAction func datePickerValueChanged(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
          dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
          dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        firstLabelForDate.text = dateFormatter.stringFromDate(sender.date)
        //print(firstLabelForDate.text)
        
        let month = firstLabelForDate.text?.componentsSeparatedByString(" ")[0]
        let date = firstLabelForDate.text?.componentsSeparatedByString(" ")[1].componentsSeparatedByString(",")[0]
        let year = firstLabelForDate.text?.componentsSeparatedByString(", ")[1]
        let timeHr = firstLabelForDate.text?.componentsSeparatedByString(" ")[3].componentsSeparatedByString(":")[0]
        let timeMin = firstLabelForDate.text?.componentsSeparatedByString(" ")[3].componentsSeparatedByString(":")[1]
        let timeSecond = firstLabelForDate.text?.componentsSeparatedByString(" ")[3].componentsSeparatedByString(":")[2]
        
        datePickerDetails.text = "Date: \(date) Month: \(month) Year: \(year) Hr: \(timeHr) Minutes: \(timeMin) Sec: \(timeSecond)"
        datePickerDetails.userInteractionEnabled = false
    }

    @IBAction func textFieldDatePicker(sender: UITextField) {
        let datePickerView: UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
        toolBar.barStyle = UIBarStyle.Default
        toolBar.backgroundColor = UIColor.greenColor()
        toolBar.items = [UIBarButtonItem(title: "Done", style: .Done, target: self, action: #selector(doneButton))]
        
       // datePickerView.inputAccessoryView = toolBar
        textFieldDate.inputAccessoryView = toolBar
        datePickerView.addTarget(self, action: #selector(datePickerChanged), forControlEvents: .ValueChanged)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerDetails.text = ""

    }
    
    func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        textFieldDate.text = dateFormatter.stringFromDate(sender.date)
        
    }

    func doneButton() {
        textFieldDate.resignFirstResponder()
    }
}

