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
        testmodel()
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
    

    
    // testmodel
    func testmodel()
    {
        let jsonObject: [String: Any] = [
            "email": "association@mail.fr",
            "name": "AssoTest",
            "identifier": "identiteTest",
            "phone": "0978654321",
            "location": "Quelquepart",
            "createdAt": "" ]
        
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
        let vc = Association.newInstance()
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
