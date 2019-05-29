//
//  Courses.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit

class Courses: UIViewController {
    
    var courses: [Course]!
    var increment: Int = 0
    
    @IBOutlet var endLabel: UILabel!
    @IBOutlet var startLabel: UILabel!
    @IBOutlet var themeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        initNavigation()
        
        // Load All Courses
        loadAllCourses()
    }
    
    // Instance
    
    class func newInstance() ->
        Courses {
            return Courses()
    }
    
    // Initialization
    
    func initNavigation()
    {
        // *** Title ***
        self.navigationItem.title = "Tous les parcours"
        
        // *** Back button ***
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target:nil, action:nil)
    }
    
    func loadAllCourses() -> Void {
        
        CourseService.default.findAll { (items) in
            
            self.courses = items
            
            guard let first = self.courses.first else {
                return
            }
            
            self.showCourse(course: first)
        }
    }
    
    func showCourse(course: Course) -> Void {
        
        self.themeLabel.text = "Thème: " + course.theme
        self.startLabel.text = "Débute le " + self.dateToString(date: course.startOn)
        self.endLabel.text = "Finit le " + self.dateToString(date: course.endOn)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        
        if (self.courses.indices.contains(increment - 1)) {
            
            increment -= 1
            let item = self.courses[increment]
            self.showCourse(course: item)
        }
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if (self.courses.indices.contains(increment + 1)) {
            
            increment += 1
            let item = self.courses[increment]
            self.showCourse(course: item)
        }
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
    
    public func dateToString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
        dateFormatter.locale = NSLocale.current
        dateFormatter.dateFormat = "yyyy-MM-dd à HH:mm" //Specify your format that you want
        return dateFormatter.string(from: date)
    }

}
