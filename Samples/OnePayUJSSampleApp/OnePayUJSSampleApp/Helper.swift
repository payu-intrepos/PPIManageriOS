//
//  Helper.swift
//  OnePayUJSKit
//
//  Created by Shubham Garg on 04/08/24.
//
import CommonCrypto
import Foundation
import UIKit

class Helper {
    
    static func showAlert(message: String, title: String, vc: UIViewController?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel))
        vc?.present(alert, animated: true)
    }
    
}
 
struct HMAC {
    
    static func sha512Hex(string: String) -> String {
       // Create SHA 512 hash locally for testing
    }
}
