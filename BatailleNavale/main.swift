 //
//  main.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

 
 

 
 /* func isShipEntirelyStriked(ship: Bateau, gameBoard: [CasePosition: CaseState]) -> Bool {
        return false
 }
 
 func isGameEnded(ships: [Bateau]) -> Bool {
    return false
 }*/
 
 var plateau = Plateau(nbRowColumn: 5)
 plateau.initGameBoard()
 plateau.addShip(casePosition: CasePosition(row: 1, col: "B"), shipLength: 2, isVertical: false)
 plateau.addShip(casePosition: CasePosition(row: 3, col: "A"), shipLength: 2, isVertical: false)
 plateau.addShip(casePosition: CasePosition(row: 2, col: "D"), shipLength: 3, isVertical: true)
 plateau.addShip(casePosition: CasePosition(row: 1, col: "B"), shipLength: 2, isVertical: false)
 
 for row in (0..<5){
    for col in (0..<5){
        let column = Character(UnicodeScalar(65 + col)!)
        let casePosition: CasePosition = CasePosition(row: row, col: column)
        if plateau.shot(casePosition: casePosition) {
            print("Toucher!")
        } else {
            print("Plouf!")
        }
    }
 }
 
 plateau.displayBoard()
