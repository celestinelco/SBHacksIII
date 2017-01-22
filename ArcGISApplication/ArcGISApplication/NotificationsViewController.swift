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
    let checked = UIImage(named: "checked")
    let unchecked = UIImage(named: "orangesq")
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var smsTextMessageButton: UIButton!
    @IBOutlet weak var pushNotificationsButton: UIButton!
    @IBOutlet weak var emailButton: UIButton!
    @IBOutlet weak var handsFreeAudioButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nNotificationsViewController.swift\n\n")
        initButtons()
    }
    
    func initButtons() {
        if appDel.userDefaults.bool(forKey: "smsTextMessage") {
            smsTextMessageButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "pushNotifications") {
            pushNotificationsButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "email") {
            emailButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "handsFreeAudio") {
            handsFreeAudioButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("alertSelectVC")
    }
    
    @IBAction func homeButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
    }
    
    @IBAction func smsTextMessageButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "smsTextMessage") {
            appDel.userDefaults.set(false, forKey: "smsTextMessage")
            smsTextMessageButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "smsTextMessage")
            smsTextMessageButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func pushNotificationsButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "pushNotifications") {
            appDel.userDefaults.set(false, forKey: "pushNotifications")
            pushNotificationsButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "pushNotifications")
            pushNotificationsButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "email") {
            appDel.userDefaults.set(false, forKey: "email")
            emailButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "email")
            emailButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func handsFreeAudioButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "handsFreeAudio") {
            appDel.userDefaults.set(false, forKey: "handsFreeAudio")
            handsFreeAudioButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "handsFreeAudio")
            handsFreeAudioButton.setBackgroundImage(checked, for: .normal)
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
