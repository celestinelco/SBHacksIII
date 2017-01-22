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
    let checked = UIImage(named: "checked")
    let unchecked = UIImage(named: "orangesq")
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var ambulancesButton: UIButton!
    @IBOutlet weak var policeActivityButton: UIButton!
    @IBOutlet weak var fireTrucksButton: UIButton!
    @IBOutlet weak var naturalDisastersButton: UIButton!
    
    override func viewDidLoad() {
        print("\n\nAlertSelectViewController.swift\n\n")
        initButtons()
    }
    
    func initButtons() {
        if appDel.userDefaults.bool(forKey: "ambulances") {
            ambulancesButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "policeActivity") {
            policeActivityButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "fireTrucks") {
            fireTrucksButton.setBackgroundImage(checked, for: .normal)
        }
        
        if appDel.userDefaults.bool(forKey: "naturalDisasters") {
            naturalDisastersButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("notificationsVC")
    }

    @IBAction func homeButton(_ sender: UIButton) {
        navigateToAuthenticatedViewController("mainMapVC")
    }
    
    @IBAction func ambulancesButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "ambulances") {
            appDel.userDefaults.set(false, forKey: "ambulances")
            ambulancesButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "ambulances")
            ambulancesButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func policeActivityButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "policeActivity") {
            appDel.userDefaults.set(false, forKey: "policeActivity")
            policeActivityButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "policeActivity")
            policeActivityButton.setBackgroundImage(checked, for: .normal)
        }
    }
    
    @IBAction func fireTrucksButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "fireTrucks") {
            appDel.userDefaults.set(false, forKey: "fireTrucks")
            fireTrucksButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "fireTrucks")
            fireTrucksButton.setBackgroundImage(checked, for: .normal)
        }
    }

    @IBAction func naturalDisastersButton(_ sender: UIButton) {
        if appDel.userDefaults.bool(forKey: "naturalDisasters") {
            appDel.userDefaults.set(false, forKey: "naturalDisasters")
            naturalDisastersButton.setBackgroundImage(unchecked, for: .normal)
        } else {
            appDel.userDefaults.set(true, forKey: "naturalDisasters")
            naturalDisastersButton.setBackgroundImage(checked, for: .normal)
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
