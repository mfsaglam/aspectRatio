//
//  ViewController.swift
//  AspectRatio
//
//  Created by Fatih Sağlam on 16.10.2022.
//

import UIKit

class CalculateVC: UIViewController {
    
    var width: Float = 1
    var height: Float = 1
    
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
        if let widthString = sender.text {
            if widthString.count > 0 {
                self.width = widthString.floatValue
                calculateAndUpdateUI()
            }
        }
    }
    
    @IBAction func heightChanged(_ sender: UITextField) {
        if let heightString = sender.text {
            if heightString.count > 0 {
                self.height = heightString.floatValue
                calculateAndUpdateUI()
            }
        }
    }
    
    private func calculateAndUpdateUI() {
        diagonalLabel.text = (calculator.calculate(width: width, height: height, format: .diagonal))
        xLabel.text = (calculator.calculate(width: width, height: height, format: .oneBased))
        whLabel.text = (calculator.calculate(width: width, height: height, format: .widthAndHeightBased))
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
        
        diagonalLabel.text = "1"
        xLabel.text = "1:1"
        whLabel.text = "1:1"
    }
    
    private func configureUI() {
        resetViews()
        widthTextField.font = UIFont.systemFont(ofSize: 25)
        heightTextField.font = UIFont.systemFont(ofSize: 25)
        
    }
}

