//
//  AssociationShow.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class AssociationShow: UIViewController {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var identifier: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var birthdate: UILabel!
    @IBOutlet weak var location: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
        
        AssociationService.default.find(id: "5cedd001c37f050017590698") { (association) in
            self.name.text = association.name
            self.identifier.text = association.identifier
            self.email.text = association.email
            self.birthdate.text = self.dateToString(date: association.birthdate)
            self.location.text = association.location
        }
    }
    
    // Instance
    
    class func newInstance() ->
        AssociationShow {
            return AssociationShow()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "Mon association"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm" //Specify your format that you want
        return dateFormatter.string(from: date)
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
