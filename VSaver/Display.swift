//
//  Display.swift
//  VSaver
//
//  Created by Jarek Pendowski on 16/10/2017.
//  Copyright © 2017 Jaroslaw Pendowski. All rights reserved.
//

import Foundation

class Display: Equatable, Hashable {
    let displayID: String
    let name: String
    var shouldDisplay: Bool
    
    var hashValue: Int {
        return displayID.hashValue
    }
    
    init(displayID: String, name: String, shouldDisplay: Bool) {
        self.displayID = displayID
        self.name = name
        self.shouldDisplay = shouldDisplay
    }
    
    init?(fromJSON json: [String: Any]) {
        guard let displayID = json["id"] as? String,
            let name = json["name"] as? String,
            let shouldDisplay = json["display"] as? Bool
            else {
                return nil
        }
        self.displayID = displayID
        self.name = name
        self.shouldDisplay = shouldDisplay
    }
    
    func toJSON() -> [String: Any] {
        return [
            "id": displayID,
            "name": name,
            "display": shouldDisplay
        ]
    }
    
    static func ==(l: Display, r: Display) -> Bool {
        return l.displayID == r.displayID
    }
}