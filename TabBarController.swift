//
//  TabBarController.swift
//  IOSTodoTest
//
//  Created by INFTEL 22 on 25/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var sidebar: FrostedSidebar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        tabBar.hidden = true
        
        
        moreNavigationController.navigationBar.hidden = true
        
        sidebar = FrostedSidebar(itemImages: [
            UIImage(named: "hacer_test")!,
            UIImage(named: "resultados")!,
            UIImage(named: "cerrar_sesion")!,
            ],
            colors: [
                UIColor(red: 240/255, green: 159/255, blue: 254/255, alpha: 1),
                UIColor(red: 255/255, green: 137/255, blue: 167/255, alpha: 1),
                UIColor(red: 126/255, green: 242/255, blue: 195/255, alpha: 1),
            ],
            selectionStyle: .Single)
        sidebar.actionForIndex = [
            0: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 0})
            },
            
            
            1: {
                
                self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 1})
},
            2: {self.sidebar.dismissAnimated(true, completion: { finished in self.selectedIndex = 2})
                let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                appDelegate.usuario = nil
                appDelegate.arrayTest = nil
                appDelegate.currentTest = nil
                
            },
        ]
    }
    
}
