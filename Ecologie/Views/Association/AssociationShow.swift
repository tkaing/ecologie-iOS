//
//  AssociationShow.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class AssociationShow: UIViewController {
    
    // Logo
    @IBOutlet var logo: UIImageView!
    
    // Button
    @IBOutlet var update: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initNavigation()
        
        applyStyle()
        
        /*AssociationService.default.find(id: "5cedd001c37f050017590698") { (association) in
            self.name.text = association.name
            self.identifier.text = association.identifier
            self.email.text = association.email
            self.birthdate.text = DateManager.default.toString(date: association.birthdate)
            self.location.text = association.location
        }*/
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Mon association"
        
        // Left Button
        let leftButton = NavigationManager.default.button(view: self)
        leftButton.addTarget(self, action: #selector(panel), for: .touchUpInside)
    }
    
    // Events
    
    @IBAction func emailInput(_ sender: UITextField) {
    }
    
    @IBAction func phoneInput(_ sender: UITextField) {
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
    }
    
    // Styles
    
    func applyStyle() {
        
        // Logo
        self.styleImageView(view: self.logo)
        
        // Update Button
        self.styleUpdate(button: self.update)
    }
    
    func styleImageView(view: UIImageView) {
        
        view.image = #imageLiteral(resourceName: "feuille")
    }
    
    func styleUpdate(button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorManager.default.primary()
    }
}
