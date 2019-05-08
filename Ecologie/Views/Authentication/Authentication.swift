//
//  Authentication.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class Authentication: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "S'authentifier"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    // Events
    
    @IBAction func loggedButton(_ sender: UIButton)
    {
        self.redirectToHomeVC()
    }
    
    @IBAction func registerButton(_ sender: UIButton)
    {
        self.redirectToAssoFormVC()
    }
    
    // Objectif-C
    
    @objc private func redirectToHomeVC()
    {
        let homeVC = Home.newInstance()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @objc private func redirectToAssoFormVC()
    {
        let assoVC = AssociationForm.newInstance()
        self.navigationController?.pushViewController(assoVC, animated: true)
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
