//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPcButton: UIButton!
    @IBOutlet weak var tenPcButton: UIButton!
    @IBOutlet weak var twentyPcButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 1.1
    var total = 0.0
    var split = 2.0
    var per = ""

    @IBAction func tipChanged(_ sender: UIButton) {
        
        if sender.accessibilityLabel == zeroPcButton.accessibilityLabel{
            
            zeroPcButton.isSelected = true
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = false
            
            tip = 0.0
            per = "0%"
            
        } else if sender.accessibilityLabel == tenPcButton.accessibilityLabel{
            
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = true
            twentyPcButton.isSelected = false
            
            tip = 1.1
            per = "10%"
            
        } else if sender.accessibilityLabel == twentyPcButton.accessibilityLabel{
            
            zeroPcButton.isSelected = false
            tenPcButton.isSelected = false
            twentyPcButton.isSelected = true
            
            tip = 1.2
            per = "20%"
            
        }
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        split = sender.value
        
        splitNumberLabel.text = String(format: "%.0f", split)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = Double(billTextField.text!) ?? 0.0
        total = (bill * tip) / split
        
        print(bill)
        print(tip)
        print(split)
        
        self.performSegue(withIdentifier: "result", sender: self)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "result"{
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tip = self.per
            destinationVC.numberOfPeople = self.split
            destinationVC.total = self.total
            
        }
    }
    
    

}

