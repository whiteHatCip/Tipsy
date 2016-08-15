//
//  ViewController.swift
//  Tipsy
//
//  Created by Fabio Cipriani on 14/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import UIKit

class TipsyVC: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet weak var tipPercentLbl: UILabel!
    @IBOutlet weak var tipPercentSlider: UISlider!
    @IBOutlet weak var billAmountTxt: UITextField!
    @IBOutlet weak var tipAmountLbl: UILabel!
    @IBOutlet weak var totalAmountLbl: UILabel!
    @IBOutlet weak var splitSlider: UISlider!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var splitAmount: UILabel!
    
    
    // MARK: @Properties
    var tipCalc = TipCalc(billAmount: 0.0, tipPercent: 0.0)
    
    // MARK: Initialize Views
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tipPercentLbl.text = "Tip \(Int(tipPercentSlider.value*100))%"
        splitLbl.text = "SPLIT \(Int(splitSlider.value))"
    }
    
    
    // MARK: @IBActions
    @IBAction func billAmountChanging(_ sender: AnyObject) {
        calcTip()
        updateUI()
    }
    
    @IBAction func tipPercentSlides(_ sender: AnyObject) {
        tipPercentLbl.text = "Tip \(Int(tipCalc.tipPercent*100))%"
        calcTip()
        updateUI()
    }
    
    @IBAction func splitSlides(_ sender: AnyObject) {
        splitLbl.text = "SPLIT \(Int(splitSlider.value))"
        calcSplit()
        updateUI()
    }
    
    // MARK: Functions
    func calcTip() {
        tipCalc.tipPercent = Double(tipPercentSlider.value)
        tipCalc.billAmount = ((billAmountTxt.text)! as NSString).doubleValue
        tipCalc.calculateTip()
    }
    
    func calcSplit() {
        tipCalc.splitNumber = Int(splitSlider.value)
        tipCalc.calculateSplit()
        
    }
    
    func updateUI() {
        tipAmountLbl.text = String(format: "$ %0.2f", tipCalc.tipAmount)
        totalAmountLbl.text = String(format: "$ %0.2f", tipCalc.totalAmount)
        splitAmount.text = String(format: "$ %0.2f", tipCalc.splitAmount)
    }
}

