//
//  ViewController.swift
//  AspectRatio
//
//  Created by Fatih Sağlam on 16.10.2022.
//

import UIKit

class CalculateVC: UIViewController {
    
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
            print(width)
        }
    }
    
    @IBAction func heightChanged(_ sender: UITextField) {
        if let height = sender.text {
            print(height)
        }
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
        xLabel.text = "x:1"
        whLabel.text = "w:h"
    }
    
    private func configureUI() {
        resetViews()
    }
}

