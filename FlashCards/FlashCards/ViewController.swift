//
//  ViewController.swift
//  FlashCards
//
//  Created by rave on 11/8/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func createUserButton(_ sender: Any) {
        let email = emailTextField.text
        let password = passwordTextField.text
        if( email != "" && password != "") // , let password = passwordTextField.text
        {
            
            Auth.auth().createUser(withEmail: email!, password: password!, completion: { [weak self] authResult, error in
                guard self != nil else {
                    print("CREATE USER FAILED")
                    return
                    
                }
                print("AUTH RESULT:\(authResult)")
            })
            
        }
        else
        {
            print("CREATE USER FAILED")
            return
        }
        
    }
    
    @IBAction func useAsGuestButton(_ sender: Any) {
    }
    
    @IBAction func signInButton(_ sender: Any) {
        
        guard let email = emailTextField.text, let password = passwordTextField.text
        else
        {
            fatalError()
        }
        
        if(email != "" && password != "")
        {
            
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard self != nil else {
                    print("AUTH FAILED")
                    return
                }
                
                if error != nil {
                    switch error!._code {
                    case 17008:
                        print("INVALID EMAIL FORMAT")
                        break
                    case 17009:
                        print("WRONG PASSWORD")
                        break
                    case 17011:
                        print("USER EMAIL NOT FOUND.")
                    default:
                        print("LOGIN ERROR")
                        break
                    }
                            print("ERROR \(error!._code)")
                            return
                        }
                print("AUTH RESULT:\(authResult)")
            }
        }
        else
        {
            let alert = UIAlertController(title: "Email or password empty", message: "Please fix error.", preferredStyle: .alert)
                
            let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                       
                       // Code in this block will trigger when OK button tapped.
                       print("Ok button tapped");
                       
                   }
                   alert.addAction(OKAction)
            
            
            self.present(alert, animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let  handle = Auth.auth().addStateDidChangeListener { auth, user in
            print ("AUTH: \(auth)")
            
            print("USER:\(String(describing: user))")
        }
        
        print("HANDLE: \(handle)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
        
        
    }
    
}

