//
//  CasePosition.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation



struct CasePosition: Hashable {
    static func ==(lhs: CasePosition, rhs: CasePosition) -> Bool {
        return lhs.row == rhs.row && lhs.column == rhs.column;
    }

    var hashValue: Int {
        return 0;
    }
    let row: Int // 0..<10
    let column: Character // A,B...
    
    init(row: Int, col: Character){
        self.row = row
        self.column = col
    }
}
