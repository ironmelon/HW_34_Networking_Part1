//
//  Post.swift
//  HW_34_Networking_Part1
//
//  Created by Oleg Dynnikov on 1/27/19.
//  Copyright © 2019 Oleg Dynnikov. All rights reserved.
//

import Foundation

struct Post {
    let userId: Int
    let completed: Int
    let id: Int
    let title: String
}

extension Post {
    init?(jsonDict: [String: Any]) {
        guard let userId = jsonDict["userId"] as? Int else { return nil }
        self.userId = userId
        guard let completed = jsonDict["completed"] as? Int else { return nil }
        self.completed = completed
        guard let id = jsonDict["id"] as? Int else { return nil }
        self.id = id
        guard let title = jsonDict["title"] as? String else { return nil }
        self.title = title
    }
} 
