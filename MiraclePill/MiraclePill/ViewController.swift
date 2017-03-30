//
//  ViewController.swift
//  MiraclePill
//
//  Created by Tuan Pham on 3/28/17.
//  Copyright © 2017 Tuan Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    // Use protocols

    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerButton: UIButton!
    
    let states = ["Florida", "New Jersey", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // When choose the state is pressed, the state picker label will appear with the state name
    @IBAction func stateButtonPressed(_ sender: Any) {
        statePicker.isHidden = false
    }
    
    // Call functions of pickerView protocols -- check pickerView protocols
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        // return just 1 pickerView
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // return the number of elements in the pickerView based on the number of elements in states array
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // return the names of each row in pickerView match with the states in the array
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // When user selects a state from pickerView, the statePickerButton will change from "Choose your state" to the name of the state
        statePickerButton.setTitle(states[row], for: UIControlState.normal)
        // Hide the pickerView when the user selects a state from pickerView
        statePicker.isHidden = true
    }

}

