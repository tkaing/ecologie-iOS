//
//  Navigation.swift
//  Ecologie
//
//  Created by DéjàLu on 12/07/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class Navigation: UIViewController {

    @IBOutlet var logo: UIImageView!
    @IBOutlet var subtitle: UIButton!
    @IBOutlet var showCourse: UIButton!
    @IBOutlet var listCourses: UIButton!
    @IBOutlet var listMembers: UIButton!
    @IBOutlet var logout: UIButton!
    
    public static var course: Course?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        applyStyle()
    }
    
    // Initialization
    
    // Events
    
    @IBAction func showCourse(_ sender: UIButton) {
        
        let to = CourseForm()
        
        to.course = Navigation.course
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    @IBAction func listCourses(_ sender: UIButton) {
        
        let to = Courses()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    @IBAction func listMembers(_ sender: UIButton) {
        
        let to = Members()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    @IBAction func logout(_ sender: UIButton) {
        
        let to = Authentication()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    // Objectif-C
    
    // Methods
    
    // Styles
    
    func applyStyle() {
        
        // Logo
        self.logo = UIImageView(image: #imageLiteral(resourceName: "feuille"))
        
        // Items
        self.styleItem(button: self.showCourse, bg: ColorManager.default.primary(0.6))
        self.styleItem(button: self.listCourses, bg: ColorManager.default.primary(0.8))
        self.styleItem(button: self.listMembers, bg: ColorManager.default.primary(1.0))
        self.styleItem(button: self.logout, bg: ColorManager.default.danger(1.0))
    }
    
    func styleItem(button: UIButton, bg: UIColor) {
        
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = bg
    }
}
