//
//  Group.swift
//  WebTextTransfer
//
//  Created by Viktor Siedov on 03.09.2018.
//  Copyright © 2018 Viktor Siedov. All rights reserved.
//

import Foundation

struct Group {
    
    let id: String?
    let name: String
    
    init(name: String) {
        id = nil
        self.name = name
    }
    
    init?(document: QueryDocumentSnapshot) {
        let data = document.data()
        
        guard let name = data["name"] as? String else {
            return nil
        }
        
        id = document.documentID
        self.name = name
    }
    
}

extension Group: DatabaseRepresentation {
    
    var representation: [String : Any] {
        var rep = ["name": name]
        
        if let id = id {
            rep["id"] = id
        }
        
        return rep
    }
    
}

extension Group: Comparable {
    
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func < (lhs: Group, rhs: Group) -> Bool {
        return lhs.name < rhs.name
    }
    
}
