//
//  Bateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

enum Answer {
    case touched
    case flowed
    case missed
}

struct Bateau {
    var cases: [CasePosition]
    var striked: Int
    
    init() {
        cases = []
        striked = 0
    }
    
    func length() -> Int {
        return cases.count
    }
    
    func isAt(casePosition: CasePosition) -> Bool {
        return cases.contains(casePosition);
    }
    
    mutating func isStriked(casePosition: CasePosition) -> Answer {
        var result = Answer.missed
        if (isAt(casePosition: casePosition)) {
            striked += 1
            result = Answer.touched
            if(isSunk()){
                result = Answer.flowed
            }
        }
        return result
    }
    
    func isSunk() -> Bool {
        return cases.count == striked
    }
}
