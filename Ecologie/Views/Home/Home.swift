//
//  Home.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class Home: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
        
        // Test ObjectMapper
        testObjectMapper()
        // Test Model Course
        testCourse()
        // Test Model Membre
        testMembre()
    }
    
    // Instance
    
    class func newInstance() ->
        Home {
            return Home()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "Que souhaitez-vous faire ?"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    // testObjectMapper
    func testObjectMapper()
    {
        let jsonObject: [String: Any] = [
            "identifier"    : "identiteTest",
            "name"          : "AssoTest",
            "phone"         : "0978654321",
            "email"         : "association@mail.fr",
            "location"      : "Quelquepart",
            "createdAt"     : ""
        ]
        
        print(jsonObject)
    }
    
    func testCourse()
    {
        let jsonObject: [String: Any] = [
            "startOn"    : "courseTest",
            "endOn"      : "AssoTest",
            "theme"      : "0978654321",
            "email"      : "association@mail.fr",
            "location"   : "Quelquepart",
            "createdAt"  : ""
        ]
        
        print(jsonObject)
    }
    
    
    func testMembre()
    {
        let jsonObject: [String: Any] = [
            "identifier"    : "identiteTest",
            "firstname"     : "kipa",
            "lastname"     : "tchu",
            "phone"         : "0978654321",
            "email"         : "association@mail.fr",
            "location"      : "Quelquepart",
            "createdAt"     : ""
        ]
        
        print(jsonObject)
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
        let vc = Members.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToMemberFormVC()
    {
        let vc = MemberForm.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToCoursesVC()
    {
        let vc = Courses.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToCourseFormVC()
    {
        let vc = CourseForm.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func redirectToAssociationVC()
    {
        let vc = AssociationShow.newInstance()
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
