//
//  launchViewController.swift
//  ArcGISApplication
//
//  Created by Celestine Co on 1/22/17.
//  Copyright © 2017 Celestine. All rights reserved.
//

import Foundation
import UIKit

class launchViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        let layer = CAGradientLayer()
        layer.frame = self.view.frame
        layer.colors = [UIColor.white.cgColor, UIColor(red: 150.0/255.0, green: 219.0/255.0, blue: 237.0/255.0, alpha: 1)]
        view.layer.addSublayer(layer)
    }
    
}
