//
//  LoginAuthenticationViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/21/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class LoginAuthenticationViewController: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    @IBAction func nextButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
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
