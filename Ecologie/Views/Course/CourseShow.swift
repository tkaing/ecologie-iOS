//
//  CourseShow.swift
//  Ecologie
//
//  Created by Mohamed dennoun on 04/05/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class CourseShow: UIViewController {
    
    public var course: Course!

    override func viewDidLoad() {
     
        super.viewDidLoad()

        initNavigation()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Mon parcours"
        
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
    
    // Styles
}
