//
//  NavigationManager.swift
//  Ecologie
//
//  Created by DéjàLu on 13/07/2019.
//  Copyright © 2019 Dt. All rights reserved.
//

import UIKit
import SideMenu

class NavigationManager {
    
    public static let `default` = NavigationManager()
    
    public func button(view: UIViewController) -> UIButton {
        
        // ### Item ###
        let item = view.navigationItem
        
        // ### Frame ###
        let frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        
        // ### Background ###
        let background = UIImageView(frame: frame)
        background.image = #imageLiteral(resourceName: "menu")
        
        // ### Left Button ###
        let button = UIButton(frame: frame)
        button.addSubview(background)
        
        // ### Navigation Item ###
        item.leftBarButtonItem = UIBarButtonItem(customView: button)

        return button
    }
    
    public func redirectTo(from: UIViewController, to: UIViewController) {
        
        from.navigationController?.pushViewController(to, animated: true)
    }
}
