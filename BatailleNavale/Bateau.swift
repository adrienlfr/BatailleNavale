//
//  Bateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

struct Bateau {
    var cases: [CasePosition]
    var sunk: Bool
    var striked: Int
    
    init() {
        cases = []
        sunk = false
        striked = 0
    }
    
    func length() -> Int {
        return cases.count
    }
    
    func isAt(casePosition: CasePosition) -> Bool {
        return cases.contains(casePosition);
    }
    
    mutating func isStriked(casePosition: CasePosition) -> Bool {
        let result = isAt(casePosition: casePosition)
        if (result) {
            striked += 1
            sunk = isSunk()
        }
        return result
    }
    
    func isSunk() -> Bool {
        return cases.count == striked
    }
}
