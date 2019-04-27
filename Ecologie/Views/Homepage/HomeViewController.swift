//
//  HomeViewController.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
    }
    
    // Instance
    
    class func newInstance() ->
        HomeViewController {
            return HomeViewController()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "Que souhaitez-vous faire ?"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    // Events
    
    @IBAction func membersButton(_ sender: UIButton)
    {
        self.redirectToMembersVC()
    }
    
    @IBAction func memberButton(_ sender: UIButton)
    {
        self.redirectToMemberFormVC()
    }
    
    @IBAction func coursesButton(_ sender: UIButton)
    {
        self.redirectToCoursesVC()
    }
    
    @IBAction func courseButton(_ sender: UIButton)
    {
        self.redirectToCourseFormVC()
    }
    
    @IBAction func associationButton(_ sender: UIButton)
    {
        self.redirectToAssociationVC()
    }
    
    // Objectif-C
    
    @objc private func redirectToMembersVC()
    {
        let vc = MembersViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToMemberFormVC()
    {
        let vc = MemberFormViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToCoursesVC()
    {
        let vc = CoursesViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToCourseFormVC()
    {
        let vc = CourseFormViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToAssociationVC()
    {
        let vc = AssociationViewController.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
