//
//  LoadingAlert.swift
//  IOSTodoTest
//
//  Created by INFTEL 23 on 27/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import Foundation
import UIKit

class LoadingAlert{
    
    //MARK: Properties
    
    var alert: UIAlertView = UIAlertView(title: "Cargando", message: "Por favor, espere...", delegate: nil, cancelButtonTitle: nil)
    
    
    var loadingIndicator: UIActivityIndicatorView = UIActivityIndicatorView(frame: CGRectMake(50, 10, 37, 37)) as UIActivityIndicatorView
    
    init (point: CGPoint){
        loadingIndicator.center = point
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        loadingIndicator.startAnimating();
    }
    
    
    func show(){
        alert.setValue(loadingIndicator, forKey: "accessoryView")
        loadingIndicator.startAnimating()
        
        alert.show();
        
    }
    func hide(){
        self.alert.dismissWithClickedButtonIndex(-1, animated: true)
    }
    
}
