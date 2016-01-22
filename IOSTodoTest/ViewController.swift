//
//  ViewController.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadActivityIndicatorView: UIActivityIndicatorView!
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSecureTextField()
        configureActivityIndicatorView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: Actions
    
    func initLoginView(){
        self.userTextField.text = ""
        self.passwordTextField.text = ""
        self.loadActivityIndicatorView.stopAnimating()
    }
    
    @IBAction func loginButton(sender: UIButton) {
        
        let loginText = userTextField.text
        let passwordText = passwordTextField.text
        loadActivityIndicatorView.startAnimating()
        if loginText == "user" && passwordText == "00" {//usuario y contraseña correctas
            
            
            
            
        }else{//usuario y contraseña incorrectas
            
            showSimpleAlert()
       
            
        }
        
        
        
    }
  // MARK: Configuration
    
    func configureSecureTextField (){
        passwordTextField.secureTextEntry = true;
        passwordTextField.returnKeyType = .Done
        passwordTextField.clearButtonMode = .Always
    }
    func configureActivityIndicatorView (){
        loadActivityIndicatorView.stopAnimating()
        loadActivityIndicatorView.hidesWhenStopped = true
    }
    
    func showSimpleAlert() {
        let title = NSLocalizedString("Fallo al iniciar sesion", comment: "")
        let message = NSLocalizedString("Intentelo de nuevo", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
            self.initLoginView()
            
        }
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

