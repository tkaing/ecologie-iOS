//
//  Members.swift
//  Ecologie
//
//  Created by Thierry Kg on 10/03/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class Members: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    public var members: [Member] = [
        Member(email: "a@live.fr", firstname: "aaa", lastname: "AAA", birthdate: Date(), phone: "+336123", location: "(1,1)", createdAt: Date()),
        Member(email: "b@live.fr", firstname: "bbb", lastname: "BBB", birthdate: Date(), phone: "+337123", location: "(2,2)", createdAt: Date())
    ]
    
    public var cellID = "cellID"

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        initNavigation()
        
        initTableView()
    }
    
    // Initialization
    
    func initNavigation() {
        
        // Title
        self.navigationItem.title = "Liste des organisateurs"
        
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
        
        let to = MemberForm()
            
        NavigationManager.default.redirectTo(from: self, to: to)
    }
    
    // Methods

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Styles
}

extension Members: UITableViewDelegate, UITableViewDataSource {
    
    // Count Cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.members.count
    }
    
    // Cell Content
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell? = self.tableView.dequeueReusableCell(withIdentifier: self.cellID)
        let member: Member = self.members[indexPath.row]
        cell?.textLabel?.text = member.email
        return cell!
    }
    
    // Cell Action Leading
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            let member: Member = self.members[indexPath.row]
            
            let to = MemberForm()
            to.member = member
            
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
            
            self.members.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            
            success(true)
        })
        
        deleteAction.image = #imageLiteral(resourceName: "garbage")
        deleteAction.backgroundColor = ColorManager.default.danger()
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    // On Select
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let member: Member = self.members[indexPath.row]
        
        let to = MemberForm()
        to.member = member
        to.readonly = true
        
        NavigationManager.default.redirectTo(from: self, to: to)
    }
}
