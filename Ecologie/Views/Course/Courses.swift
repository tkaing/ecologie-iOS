//
//  Courses.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class Courses: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    public var courses: [Course] = [
        Course(id: "xfg1", startOn: Date(), endOn: Date(), theme: "Mégot", location: "(1,1)", createdAt: Date()),
        Course(id: "xec2", startOn: Date(), endOn: Date(), theme: "Tout", location: "(2,2)", createdAt: Date())
    ]
    
    public var cellID = "cellID"
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        initNavigation()
        
        initTableView()
        
        //loadAllCourses()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Liste de parcours"
        
        // Left Button
        let leftButton = NavigationManager.default.button(view: self)
        leftButton.addTarget(self, action: #selector(panel), for: .touchUpInside)
        
        // Right Button
        let rightButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    func initTableView() {
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: self.cellID)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // Events
    
    // Objectif-C
    
    @objc func panel() {
        
        // ### Show Menu ###
        let view: UIViewController = SideMenuManager.default.menuLeftNavigationController!
        present(view, animated: true, completion: nil)
    }
    
    @objc func add() {
        
        let to = CourseForm()
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    // Methods
    
    func loadAllCourses() -> Void {
        
        CourseService.default.findAll { (items) in
            
            self.courses = items
            
            guard let first = self.courses.first else {
                return
            }
            
            print(first)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Styles
}

extension Courses: UITableViewDelegate, UITableViewDataSource {
    
    // Count Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courses.count
    }
    
    // Cell Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: self.cellID)
        let date: Date = self.courses[indexPath.row].createdAt
        cell?.textLabel?.text = DateManager.default.toString(date: date)
        return cell!
    }
    
    // Cell Action Leading
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            
            let course: Course = self.courses[indexPath.row]
            
            let to = CourseForm()
            to.course = course
            
            NavigationManager.default.redirectTo(from: self, to: to)
            
            success(true)
        })
        
        editAction.image = #imageLiteral(resourceName: "edit")
        editAction.backgroundColor = ColorManager.default.warning()
        
        return UISwipeActionsConfiguration(actions: [editAction])
        
    }
    
    // Cell Action Trailing
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .normal, title: "", handler: { (ac: UIContextualAction, view: UIView, success: (Bool) -> Void) in
            
            self.courses.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            success(true)
        })
        
        deleteAction.image = #imageLiteral(resourceName: "garbage")
        deleteAction.backgroundColor = ColorManager.default.danger()
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // On Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let course: Course = self.courses[indexPath.row]
        
        let to = CourseForm()
        to.course = course
        to.readonly = true
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
}
