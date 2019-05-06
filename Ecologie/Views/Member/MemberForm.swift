//
//  MemberForm.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class MemberForm: UIViewController {

    @IBOutlet weak var name: UITextField!
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
