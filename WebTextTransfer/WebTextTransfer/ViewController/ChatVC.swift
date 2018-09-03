//
//  ChatVC.swift
//  WebTextTransfer
//
//  Created by Viktor Siedov on 03.09.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatVC: UIViewController {
    
    private let currentUser: User
    
    init(currentUser: User) {
        self.currentUser = currentUser
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
    }
    
}

