//
//  LoginAuthenticationViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/21/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class LoginAuthenticationViewController: UIViewController, UITextFieldDelegate {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nLoginAuthenticationViewController.swift\n\n")
        emailTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.returnKeyType = .done
        phoneTextField.returnKeyType = .done
    }
    
    @IBAction func emailTextField(_ sender: UITextField) {
        appDel.userDefaults.set(emailTextField.text, forKey: "emailInfo")
        appDel.userDefaults.set(true, forKey: "emailInfoInitialized")
    }
    
    @IBAction func phoneTextField(_ sender: UITextField) {
        appDel.userDefaults.set(phoneTextField.text, forKey: "phoneInfo")
        appDel.userDefaults.set(true, forKey: "phoneInfoInitialized")
    }
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        if emailTextField.hasText && phoneTextField.hasText {
            navigateToAuthenticatedViewController("mainMapVC")
        }
    }
    
    /**
     Navigates storyboard to view controller with specified String name.
     - Parameter controllerName: <String> name of controller storyboard will navigate to.
     */
    func navigateToAuthenticatedViewController(_ controllerName: String){
        if let loggedInVC = storyboard?.instantiateViewController(withIdentifier: controllerName) {
            DispatchQueue.main.async { () -> Void in
                self.navigationController?.isNavigationBarHidden = true
                self.navigationController?.pushViewController(loggedInVC, animated: true)
            }
        }
    }
    
}
