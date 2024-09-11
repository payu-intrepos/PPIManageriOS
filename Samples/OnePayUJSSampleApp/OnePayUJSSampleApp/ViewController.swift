//
//  ViewController.swift
//  OnePayUJSSampleApp
//
//  Created by Shubham Garg on 29/07/24.
//

import UIKit
import OnePayUJSKit

class ViewController: UIViewController {
    @IBOutlet weak var keyTextField: UITextField!
    @IBOutlet weak var saltTextField: UITextField!
    @IBOutlet weak var rurlTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var environmentTextField: UITextField!
    @IBOutlet weak var txnIDTextField: UITextField!
    @IBOutlet weak var urnTextField: UITextField!
    @IBOutlet weak var walletIdentifierTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urnTextField.text = "10002575"
        phoneTextField.text = "8437123405"
        setTxnID()
    }

    @IBAction func openCards(_ sender: Any) {
        OnePayUJSSDK.showCards(parentVC: self, params: getParams(), delegate: self)
    }
    
    
    func getParams() -> OnePayUJSParams {
        return OnePayUJSParams(merchantKey: keyTextField.text ?? "", referenceId: txnIDTextField.text ?? "", environment: environmentTextField.text == "0" ? .production : .test, mobileNumber: phoneTextField.text ?? "", walletUrn: urnTextField.text, walletIdentifier: walletIdentifierTextField.text)
    }
    
    func setTxnID() {
        txnIDTextField.text = "payu\(Int(Date().timeIntervalSince1970))"
    }

}

extension ViewController: OnePayUJSSDKDelegate {
    func onCancel() {
        Helper.showAlert(message: "User Cancel", title: "", vc: self)
        setTxnID()
    }
    
    func onError(code: Int, message: String) {
        print(message)
        Helper.showAlert(message: message, title: "", vc: self)
        setTxnID()
    }
    
    func generateHash(for param: [String : String], onCompletion: @escaping OnePayUJSKit.OnePayUJSHashCompletion) {
        let commandName = param["hashName"] ?? ""
        let hashStringWithoutSalt = param["hashString"] ?? ""
        // get hash for "commandName" from server
        // get hash for "hashStringWithoutSalt" from server
        
        // After fetching hash set its value in below variable "hashValue"
        let hashValue = "<SHA-512 Hash>"
        onCompletion([commandName : hashValue])
    }
    
}
