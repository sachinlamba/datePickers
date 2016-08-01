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
    
    @IBAction func datePickerValueChanged(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
          dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        firstLabelForDate.text = dateFormatter.stringFromDate(sender.date)
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
    
    func datePickerChanged(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        
        textFieldDate.text = dateFormatter.stringFromDate(sender.date)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func doneButton() {
        textFieldDate.resignFirstResponder()
    }
}

