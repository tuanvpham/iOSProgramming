//
//  ViewController.swift
//  Buggy
//
//  Created by Tuan Pham on 3/6/17.
//  Copyright © 2017 Tuan Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("Called buttonTapped(_:)")
        //Log sender
        print("sender: \(sender)")
        //Log the control state - check the which UIButton or Switch is on
        //print("Is control on? \(sender.isOn)")
        
        print("Method: \(#function) in file: \(#file) line: \(#line) called.")
        //#file: the name of the file where the expression appears
        //#line: the line number the expression appears on
        //#column: the column number the expression begins in
        //#function: the name of the declaration the expression appears in
    }
}

