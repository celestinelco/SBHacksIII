//
//  AlertSelectViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/21/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class AlertSelectViewController: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var ambulanceSwitch: UISwitch!
    @IBOutlet weak var policeSwitch: UISwitch!
    @IBOutlet weak var amberAlert: UISwitch!
    @IBOutlet weak var naturalDisastersSwitch: UISwitch!
    
    @IBAction func backButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("notificationsVC")
    }
    
    @IBAction func ambulanceSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func policeSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func amberAlertSwitch(_ sender: UISwitch) {
    }
    
    @IBAction func naturalDisastersSwitch(_ sender: UISwitch) {
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
