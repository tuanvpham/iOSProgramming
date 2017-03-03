//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Tuan Pham on 3/1/17.
//  Copyright © 2017 Tuan Pham. All rights reserved.
//

import UIKit
class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    //It is optional (fahrenheit value) because User might be not have typed in a number
    //didSet: function updateCelsiusLabel will be called to change the Celsius Label whenever fahrenheit value changed
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    //Computer Celsius value based on Fahrenheit
    //Whether there is a Fahrenheit value, it will convert to Celsius value or nil if not
    //Convert Fahrenheit to Celsius using framework not by formulas
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    //When user input fahrenheit value, it will convert to double and store as Fahrenheit value
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    //When user taps on the background, the keyboard will be dismissed
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    //Celsius Label will be updated when the app launched instead of value of "100"
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
        updateCelsiusLabel()
    }
    
    //Use NumberFormatter to customize the display of a number
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    //The application will reject the second decimal separator that user enters
    @objc(textField:shouldChangeCharactersInRange:replacementString:) func textField(_ textField: UITextField,
                                                                                     shouldChangeCharactersIn range: NSRange,
                                                                                     replacementString string: String) -> Bool {
        let existingTextHasDecimalSeperator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeperator = string.range(of: ".")
        
        if existingTextHasDecimalSeperator != nil, replacementTextHasDecimalSeperator != nil {
            return false
        } else {
            return true
        }
    }
    
}
