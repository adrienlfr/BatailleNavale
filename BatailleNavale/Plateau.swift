//
//  Plateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

enum CaseState {
    case blank
    case white
    case red
}

struct Plateau{
    let gameBoard: [CasePosition: CaseState = CaseState.blank;]
    
    
    func displayBoard() {
        let column: [Character] = ["A", "B", "C", "D", "E"]
        for row in (0..<5){
            for col in column{
                let casePosition: CasePosition = CasePosition(row: row, col: col)
                let state: CaseState = gameBoard[casePosition]
                switch state{
                case CaseState.white:
                    print("")
                case CaseState.red:
                    print()
                case CaseState.blank:
                    print()
                }
            }
        }
    }
}
