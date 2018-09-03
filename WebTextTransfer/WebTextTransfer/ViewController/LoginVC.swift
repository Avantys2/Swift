//
//  LoginVC.swift
//  WebTextTransfer
//
//  Created by Viktor Siedov on 02.09.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

/**
 * In future LoginVC can use for login (Google, Facebook etc)
 * Now this LoginVC sign in the user anonymously
 */

import UIKit

class LoginVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        actionSignIn()
    }
    
    
    // MARK: - Actions
    func actionSignIn(){
        NetworkManager.shared.signIn { (authData, error) in
            if let user = authData?.user {
                print(user.providerID)
                /// go to new controller, better to do it in Router
                self.view?.window?.rootViewController = ChatVC()
            } else {
                print("Error with registration : \(error?.localizedDescription ?? "No error")")
                return
            }
        }
    }
}
