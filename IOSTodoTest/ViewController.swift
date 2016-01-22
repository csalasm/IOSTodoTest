//
//  ViewController.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginTextFied: UITextField!
    @IBOutlet weak var passwordTextFied: UITextField!
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
    
 
    
    @IBAction func loginButton(sender: UIButton) {
        
        let loginText = loginTextFied.text
        let passwordText = passwordTextFied.text
        if loginText == "user" && passwordText == "00" {
            
            loadActivityIndicatorView.startAnimating()
            
            
        }else{
            
            showSimpleAlert()
       
            
        }
        
        
        
    }
  // MARK: Configuration
    
    func configureSecureTextField (){
        passwordTextFied.secureTextEntry=true;
        passwordTextFied.returnKeyType = .Done
        passwordTextFied.clearButtonMode = .Always
    }
    func configureActivityIndicatorView (){
        loadActivityIndicatorView.stopAnimating()
        loadActivityIndicatorView.hidesWhenStopped = true
    }
    
    func showSimpleAlert() {
        let title = NSLocalizedString("A Short Title is Best", comment: "")
        let message = NSLocalizedString("A message should be a short, complete sentence.", comment: "")
        let cancelButtonTitle = NSLocalizedString("OK", comment: "")
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
        
        // Create the action.
        let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
            NSLog("The simple alert's cancel action occured.")
        }
        // Add the action.
        alertController.addAction(cancelAction)
        
        presentViewController(alertController, animated: true, completion: nil)
    }
}

