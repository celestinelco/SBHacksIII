//
//  NotificationsViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/21/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class NotificationsViewController: UIViewController {
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var smsTextMessageButton: UIButton!
    @IBOutlet weak var pushNotificationsButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var handsFreeAudioButton: UIButton!
    
    @IBAction func backButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("alertSelectVC")
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
    }
    
    @IBAction func smsTextMessageButton(_ sender: UIButton) {
    }
    
    @IBAction func pushNotificationsButton(_ sender: UIButton) {
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
    }
    
    @IBAction func handsFreeAudioButton(_ sender: UIButton) {
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
