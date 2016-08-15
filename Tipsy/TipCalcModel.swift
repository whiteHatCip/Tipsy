//
//  TipCalcModel.swift
//  Tipsy
//
//  Created by Fabio Cipriani on 15/08/16.
//  Copyright © 2016 Fabio Cipriani. All rights reserved.
//

import Foundation

class TipCalc {
    
    private var _billAmount = 0.0
    private var _tipPercent = 0.0
    private var _tipAmount = 0.0
    private var _totalAmount = 0.0
    private var _splitNumber = 1
    private var _splitAmount = 0.0
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var tipAmount: Double {
        return _tipAmount
    }
    
    var totalAmount: Double {
        return _totalAmount
    }
    
    var splitNumber: Int {
        get {
            return _splitNumber
        } set {
            _splitNumber = newValue
        }
    }
    
    var splitAmount: Double {
        get {
            return _splitAmount
        } set {
            _splitAmount = newValue
        }
    }
    
    init(billAmount: Double, tipPercent: Double) {
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitAmount = totalAmount / Double(splitNumber)
    }
    
    func calculateTip() {
        _tipAmount = tipPercent * billAmount
        _totalAmount = billAmount + tipAmount
    }
    
    func calculateSplit() {
        _splitAmount = totalAmount / Double(splitNumber)
    }
}
