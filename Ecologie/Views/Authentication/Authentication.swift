//
//  Authentication.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class Authentication: UIViewController {

    @IBOutlet var logo: UIImageView!
    
    @IBOutlet var loginInput: UITextField!
    @IBOutlet var codeInput: UITextField!
    
    @IBOutlet var connect: UIButton!
    @IBOutlet var register: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initNavigation()
        
        applyStyle()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Authentification"
    }
    
    // Events
    
    @IBAction func connect(_ sender: UIButton) {
        
        let to = AssociationShow()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    @IBAction func register(_ sender: UIButton) {
        
        let to = AssociationForm()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
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
        
        // Logo
        self.styleImageView(view: self.logo)
        
        // Connect Button
        self.styleConnect(button: self.connect)
        
        // Register Button
        self.styleRegister(button: self.register)
    }
    
    func styleImageView(view: UIImageView) {
        
        view.image = #imageLiteral(resourceName: "feuille")
    }
    
    func styleConnect(button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorManager.default.primary()
    }
    
    func styleRegister(button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorManager.default.info()
    }
}
