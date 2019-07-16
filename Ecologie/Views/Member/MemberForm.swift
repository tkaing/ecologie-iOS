//
//  MemberForm.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class MemberForm: UIViewController {
    
    @IBOutlet var emailInput: UITextField!
    @IBOutlet var submit: UIButton!
    
    public var member: Member?
    public var readonly: Bool = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initNavigation()
        
        initWidget()
        
        applyStyle()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = self.initTitle()
    }
    
    func initWidget() {
        
        if let o = self.member {
            
            // Set Data
            self.emailInput.text = o.email
            self.submit.setTitle("Modifier", for: .normal)
            
            // Disable Widgets
            if self.readonly {
                
                self.emailInput.isUserInteractionEnabled = false
                self.submit.isHidden = true
            }
        }
    }
    
    func initTitle() -> String {
        
        if self.member != nil {
            
            if self.readonly {
                
                return "@-mail de l'organisateur"
            }
            return "Modifier un organisateur"
        }
        return "Ajouter un organisateur"
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
    
    // Submission
    
    func onSubmit() {
        
        // code...
    }
    
    // Styles
    
    func applyStyle() {
        
        // Submit Button
        self.styleSubmit(button: self.submit)
    }
    
    func styleSubmit(button: UIButton) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = ColorManager.default.primary()
    }
}

extension MemberForm {
    
    func isEditing() -> Bool {
        
        return self.member != nil && self.readonly == false
    }
}
