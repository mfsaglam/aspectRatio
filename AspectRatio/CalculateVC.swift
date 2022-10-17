//
//  ViewController.swift
//  AspectRatio
//
//  Created by Fatih Sağlam on 16.10.2022.
//

import UIKit
import GoogleMobileAds

class CalculateVC: UIViewController {
    
    private let banner: GADBannerView = {
        let banner = GADBannerView()
        banner.adUnitID = "ca-app-pub-8442656527638773/2615423698"
        banner.load(GADRequest())
        banner.backgroundColor = .secondarySystemBackground
        return banner
    }()
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
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
        //TODO: start iap process
        let alert = UIAlertController(title: "Not ready", message: "This feature will be available soon.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
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
        
        banner.rootViewController = self
        view.addSubview(banner)
        banner.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            banner.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            banner.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            banner.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            banner.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}

