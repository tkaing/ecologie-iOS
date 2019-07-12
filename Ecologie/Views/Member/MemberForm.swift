//
//  MemberForm.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class MemberForm: UIViewController {

    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var location: UITextField!
    @IBOutlet weak var birthdate: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
    }
    
    // Instance
    
    class func newInstance() ->
        MemberForm {
            return MemberForm()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "Ajouter un membre"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func validateUser(_ sender: UIButton) {
        
        guard let firstname = firstname.text else {
            print("firstname is nil")
            return
        }
        guard let lastname = lastname.text else {
            print("lastname is nil")
            return
        }
        guard let phone = phone.text else {
            print("phone is nil")
            return
        }
        guard let location = location.text else {
            print("location is nil")
            return
        }
       
        let user = Member(email: "mailtest@mail.fr", firstname: firstname, lastname: lastname, birthdate: birthdate.date, phone: phone, location: location, createdAt: Date())
        UserService.default.create(member: user) { (status) in
            print(status)
        }
        self.redirectToHomeVC()
    }
    
    // Objectif-C
    
    @objc private func redirectToHomeVC()
    {
        let vc = Home.newInstance()
        self.navigationController?.pushViewController(vc, animated: true)
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
