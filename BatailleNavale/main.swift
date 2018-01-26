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
 
 var plateau = Plateau(columns: "A", "B", "C", "D", "E")
 plateau.initGameBoard()
 _ = plateau.addShip(casePosition: CasePosition(row: 1, col: "B"), shipLength: 2, cardinalPoint: CardinalPoint.east)
 _ = plateau.addShip(casePosition: CasePosition(row: 3, col: "A"), shipLength: 2, cardinalPoint: CardinalPoint.south)
 _ = plateau.addShip(casePosition: CasePosition(row: 4, col: "D"), shipLength: 3, cardinalPoint: CardinalPoint.west)
 _ = plateau.addShip(casePosition: CasePosition(row: 1, col: "B"), shipLength: 2, cardinalPoint: CardinalPoint.east)
 
 for row in (0..<5){
    for col in (0..<5){
        let column = Character(UnicodeScalar(65 + col)!)
        let casePosition: CasePosition = CasePosition(row: row, col: column)
    }
 }
 
 plateau.displayBoard()
