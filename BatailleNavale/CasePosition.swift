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
    
    func positionAt(_ cardinalPoint: CardinalPoint) -> CasePosition? {
        var nextPosition: CasePosition? = nil
        
        switch cardinalPoint {
        case .north:
            let row = self.row - 1
            nextPosition = CasePosition(row: row, col: self.column)
        case .south:
            let row = self.row + 1
            nextPosition = CasePosition(row: row, col: self.column)
        case .east:
            let letter = columns.index(of: self.column)
            
            
            letter.lett { letter in
                let column = columns[letter + 1]
                nextPosition = CasePosition(row: casePosition.row, col: column)
            }
        case .west:
            let letter = columns.index(of: self.column)
            letter.lett { letter in
                let column = columns[letter - 1]
                nextPosition = CasePosition(row: casePosition.row, col: column)
            }
        }
        
        return nextPosition
    }
}
