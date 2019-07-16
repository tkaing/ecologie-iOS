//
//  CourseForm.swift
//  Ecologie
//
//  Created by DéjàLu on 16/07/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class CourseForm: UIViewController {
    
    @IBOutlet var typeInput: UISegmentedControl!
    @IBOutlet var nameInput: UITextField!
    @IBOutlet var startPlaceInput: UITextField!
    @IBOutlet var startDatetimeInput: UIDatePicker!
    @IBOutlet var endPlaceInput: UITextField!
    @IBOutlet var endDatetimeInput: UIDatePicker!
    @IBOutlet var submit: UIButton!
    
    let types: [String] = [
        "Tout", "Déchet", "Mégot"
    ]
    
    public var course: Course?
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
        
        if let c = self.course {
            
            // Control Data
            guard let t = self.types.firstIndex(of: c.theme)
                else {
                    print("Ce type de parcours est introuvable.")
                    return
            }
            
            // Set Data
            self.typeInput.selectedSegmentIndex = t
            self.nameInput.text = c.theme
            self.startPlaceInput.text = c.location
            self.startDatetimeInput.date = c.startOn
            self.endPlaceInput.text = c.location
            self.endDatetimeInput.date = c.endOn
            self.submit.setTitle("Modifier", for: .normal)
            
            // Disable Widgets
            if self.readonly {
                
                for (k, _) in self.types.enumerated() {
                    let state: Bool = k == t
                    self.typeInput.setEnabled(state, forSegmentAt: k)
                }
                self.nameInput.isUserInteractionEnabled = false
                self.startPlaceInput.isUserInteractionEnabled = false
                self.startDatetimeInput.isUserInteractionEnabled = false
                self.endPlaceInput.isUserInteractionEnabled = false
                self.endDatetimeInput.isUserInteractionEnabled = false
                self.submit.isHidden = true
            }
        }
    }
    
    func initTitle() -> String {
        
        if self.course != nil {
            
            if self.readonly {
                
                return "Détails du parcours"
            }
            return "Modifier un parcours"
        }
        return "Créer un parcours"
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

extension CourseForm {
    
    func isEditing() -> Bool {
        
        return self.course != nil && self.readonly == false
    }
}
