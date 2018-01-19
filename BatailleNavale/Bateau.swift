//
//  Bateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

struct Bateau {
    let cases: [CasePosition]
    let striked: Bool = false
    
    func length() -> Int {
        return cases.count
    }
    
    func isAt(casePosition: CasePosition) -> Bool {
        return cases.contains(casePosition);
    }
}
