//
//  AssociationForm.swift
//  Ecologie
//
//  Created by DéjàLu on 14/07/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class AssociationForm: UIViewController {
    
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var identifierInput: UITextField!
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var phoneInput: UITextField!
    @IBOutlet var locationInput: UITextField!
    @IBOutlet var foundationInput: UIDatePicker!
    
    @IBOutlet var submit: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initNavigation()
        
        applyStyle()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Enregistrer mon association"
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
    
    func applyStyle() {
        
        // Submit Button
        self.styleSubmit(button: self.submit)
    }
    
    func styleSubmit(button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorManager.default.info()
    }
}
