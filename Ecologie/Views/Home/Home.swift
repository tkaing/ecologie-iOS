//
//  Home.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class Home: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()

        initNavigation()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Homepage"
        
        // Left Button
        let leftButton = NavigationManager.default.button(view: self)
        leftButton.addTarget(self, action: #selector(panel), for: .touchUpInside)
    }
    
    // Events
    
    // Objectif-C
    
    @objc func panel() {
        
        // ### Show Menu ###
        let view: UIViewController = SideMenuManager.default.menuLeftNavigationController!
        present(view, animated: true, completion: nil)
    }
    
    // Methods

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Styles
}
