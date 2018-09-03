//
//  NetworkManager.swift
//  WebTextTransfer
//
//  Created by Viktor Siedov on 02.09.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import Foundation
import Firebase

class NetworkManager{
    
    static let shared = NetworkManager(baseURL: URL(fileURLWithPath: "pathToBaseURL"));
    
    public typealias AuthServiceCallback = ((AuthDataResult?, Error?) -> Void)
    let baseURL: URL
    
    private init(baseURL: URL) {
        ///save base URL
        self.baseURL = baseURL
        ///configurate connection
        FirebaseApp.configure()
    }
    
    public func signIn(completeHandler:AuthServiceCallback?){
        Auth.auth().signInAnonymously { (authData, error) in
            completeHandler!(authData, error)
        }
    }
    
    public func sendMessage(content:String) {
        
    }
}

