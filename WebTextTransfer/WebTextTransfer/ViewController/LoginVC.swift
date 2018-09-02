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
import FirebaseAuth

class LoginVC: UIViewController {

    
    // MARK: - Helpers
    
    private func signIn() {
//        guard let name = displayNameField.text, !name.isEmpty else {
//            showMissingNameAlert()
//            return
//        }
        
//        displayNameField.resignFirstResponder()
        
//        AppSettings.displayName = name
        Auth.auth().signInAnonymously(completion: nil)
    }
}
