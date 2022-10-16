//
//  ViewController.swift
//  AspectRatio
//
//  Created by Fatih Sağlam on 16.10.2022.
//

import UIKit

class CalculateVC: UIViewController {
    
    var width: Float?
    var height: Float?
    
    var calculator = AspectRatioCalculator()
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var diagonalLabel: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var whLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func widthChanged(_ sender: UITextField) {
        if let width = sender.text {
            self.width = width.floatValue
            calculateAndUpdateUI()
        }
    }
    
    @IBAction func heightChanged(_ sender: UITextField) {
        if let height = sender.text {
            self.height = height.floatValue
            calculateAndUpdateUI()
        }
    }
    
    private func calculateAndUpdateUI() {
        diagonalLabel.text = (calculator.calculate(width: self.width, height: self.height, format: .diagonal))
        xLabel.text = (calculator.calculate(width: self.width, height: self.height, format: .oneBased))
        whLabel.text = (calculator.calculate(width: self.width, height: self.height, format: .widthAndHeightBased))
    }
    
    @IBAction func resetTapped(_ sender: UIButton) {
        resetViews()
    }
    
    @IBAction func removeAdsTapped(_ sender: Any) {
        //start iap process
    }
    
    private func resetViews() {
        widthTextField.text = ""
        heightTextField.text = ""
        
        diagonalLabel.text = "0"
        xLabel.text = "0:1"
        whLabel.text = "0:0"
    }
    
    private func configureUI() {
        resetViews()
        widthTextField.font = UIFont.systemFont(ofSize: 25)
        heightTextField.font = UIFont.systemFont(ofSize: 25)
        
    }
}

