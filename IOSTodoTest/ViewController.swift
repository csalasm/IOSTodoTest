//
//  ViewController.swift
//  IOSTodoTest
//
//  Created by Carlos Salas on 22/1/16.
//  Copyright © 2016 EQUIPO INFTEL. All rights reserved.
//

import UIKit

// A delay function
func delay(seconds seconds: Double, completion:()->()) {
    let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
    
    dispatch_after(popTime, dispatch_get_main_queue()) {
        completion()
    }
}

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loadActivityIndicatorView: UIActivityIndicatorView!
    
    var user: String?
    var password: String?
    
    @IBOutlet weak var buttonInicio: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSecureTextField()
        configureActivityIndicatorView()
        // Do any additional setup after loading the view, typically from a nib.
        
        buttonInicio.layer.cornerRadius = 10
        
        //buttonInicio.layer.borderColor
        
        buttonInicio.layer.masksToBounds = true

    }

    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        imageLabel.center.x  -= view.bounds.width
        userTextField.center.x -= view.bounds.width
        passwordTextField.center.x -= view.bounds.width
        
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
        password = passwordTextField.text
        loadActivityIndicatorView.startAnimating()
        
        loadActivityIndicatorView.startAnimating()
        if (loginText != "" && password != "") {
            let usuarioActions = UsuarioActions()
                usuarioActions.userAuth(loginText!) { (usuario: Usuario) -> Void in
                dispatch_async(dispatch_get_main_queue(), {
                    if usuario.dni != loginText || usuario.password != self.password {
                        print("USUARIO/CONTRASEÑA INCORRECTA")
                        self.showSimpleAlert()
                    }
                    else {
                        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
                        appDelegate.usuario = usuario
                        //let preguntaAction = PreguntaActions()
                        let testAction = TestActions()
                        testAction.testAuth(usuario.dni) { (arrayTest: [Test]) -> Void in
                            dispatch_async(dispatch_get_main_queue(), {
                                appDelegate.arrayTest = arrayTest
                                
                                
                                // Despues de cargar los tests, cambiamos de ventana
                                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                                let vcTest = storyboard.instantiateViewControllerWithIdentifier("TestList")
                                self.presentViewController(vcTest, animated: true, completion: nil)
                                
                            })
                        }
                        
                        
                    }
                    })
            
        }
        }
        else {
          showSimpleAlert()
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animateWithDuration(0.5, animations: {
            self.imageLabel.center.x += self.view.bounds.width
        })
        
        UIView.animateWithDuration(0.5, delay: 0.3, options: [], animations: {
            self.userTextField.center.x += self.view.bounds.width
            }, completion: nil)
        
        UIView.animateWithDuration(0.5, delay: 0.4,
            options: [], animations: {
                self.passwordTextField.center.x += self.view.bounds.width
            }, completion: nil)
    }
    @IBAction func menu(sender: AnyObject) {
        (tabBarController as! TabBarController).sidebar.showInViewController(self, animated: true)
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

