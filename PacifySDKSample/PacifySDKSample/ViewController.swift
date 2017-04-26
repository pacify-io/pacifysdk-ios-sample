//
//  ViewController.swift
//  PacifySDKSample
//
//  Created by Andrey Strib on 4/13/17.
//

import UIKit

import PacifySDK

class ViewController: UIViewController {
    
    @IBOutlet var apiKeyTextField: UITextField!
    @IBOutlet var tokenTextField: UITextField!
    @IBOutlet var couponTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.apiKeyTextField.text = "your_api_token"
        self.tokenTextField.text = "valid_1001_some_token"
        self.couponTextField.text = "1ZKTO9AH"
    }
    
    @IBAction func onLaunch() {
        let apiKey = self.apiKeyTextField.text ?? ""
        let token = self.tokenTextField.text ?? ""
        let coupon = self.couponTextField.text
        
        let userData = PacifyUserData(
            firstName: "Nick",
            lastName: "Bos", // optional, used for payment only
            email: "nick@matrix.com")
        
        let appearance = PacifyAppearance(
            backgroundColor: UIColor(red: 249.0 / 255, green: 249.0 / 255, blue: 249.0 / 255, alpha: 1),
            navigationBarTintColor: UIColor(red: 253.0 / 255, green: 217.0 / 255, blue: 123.0 / 255, alpha: 1),
            navigationBarTitleColor: UIColor.black.withAlphaComponent(0.8),
            buttonBackgroundColor: UIColor(red: 143.0 / 255, green: 98.0 / 255, blue: 146.0 / 255, alpha: 1),
            buttonTitleColor: UIColor.white,
            textColor: UIColor(red: 76.0 / 255, green: 0, blue: 82.0 / 255, alpha: 1),
            companyLogo: UIImage(named: "Logo"))
        
        let supportInfo = PacifySupportInfo(
            email: "support@company.com", //used on home screen as support email
            phone: "1234567890") // used on home screen as suppor email
        
        let settings = PacifySettings(
            appearance: appearance,
            environment: .testing,
            logLevel: .error,
            supportInfo: supportInfo,
            appTitle: "MyApp" //embedding application title, used in title of back button and in new user congratulation message
        )
        
        Pacify.call(apiKey: apiKey, userToken: token, coupon: coupon, userData: userData, settings: settings, delegate: self)
    }
}

extension ViewController: PacifyDelegate {
    func onError(message : String) {
        alert(message: message, title: "Error")
    }
    func onComplete() {
        
    }
}

extension ViewController {
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
