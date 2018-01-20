//
//  Plateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

extension Character {
    var asciiValue: Int {
        get {
            let s = String(self).unicodeScalars
            return Int(s[s.startIndex].value)
        }
    }
}

enum CaseState {
    case white
    case red
    case blank
}

enum Action {
    case isShot
    case isSunk
    case isAt
}

class Plateau{
    
    var nbRowColumn: Int
    var gameBoard: [CasePosition: CaseState]
    var ships: [Bateau]
    var lastCasePosition: CasePosition?
    
    init(nbRowColumn: Int) {
        self.nbRowColumn = nbRowColumn
        gameBoard = [:]
        ships = []
        lastCasePosition = nil
        nbShipsSunk = 0
    }
    
    func initGameBoard(){
        for row in (0..<nbRowColumn){
            for col in (0..<nbRowColumn){
                let column = Character(UnicodeScalar(65 + col)!)
                let casePosition = CasePosition(row: row, col: column)
                gameBoard.updateValue(CaseState.blank, forKey: casePosition)
            }
        }
    }
    
    func addShip(casePosition: CasePosition, shipLength: Int, isVertical: Bool) -> Bool {
        var onShip = false
        var i = 0
        var ship = Bateau()
        
        while(!onShip && i < shipLength){
            let position: CasePosition
            
            if (isVertical) {
                let row = casePosition.row + i
                position = CasePosition(row: row, col: casePosition.column)
            } else {
                let letter = Character(String(casePosition.column)).asciiValue + i
                let column = Character(UnicodeScalar(letter)!)
                position = CasePosition(row: casePosition.row, col: column)
            }
            
            onShip = findShipAtCase(casePosition: position, action: Action.isAt)
            if !onShip {
                ship.cases.append(position)
            }
            i += 1
        }
        
        if (!onShip) {
            ships.append(ship)
        }
        
        return onShip
    }
    
    func findShipAtCase(casePosition: CasePosition, action: Action) -> Bool {
        var result: Bool = false
        var i = 0
        while(!result && i < ships.count){
            if(!ships[i].isSunk()) {
                switch action {
                case Action.isShot :
                    lastCasePosition = casePosition
                    result = ships[i].isStriked(casePosition: casePosition)
                case Action.isAt :
                    result = ships[i].isAt(casePosition: casePosition)
                case Action.isSunk :
                    result = ships[i].isSunk()
                }
            }
            i += 1
        }
        return result
    }
    
    func displayBoard() {
        for col in (0...nbRowColumn){
            if (col > 0) {
                print(Character(UnicodeScalar(64 + col)!), terminator: " ")
            } else {
                print("  ", terminator: " ")
            }
        }
        for row in (0..<nbRowColumn){
            print("\n", row + 1, terminator: " ")
            for col in (0..<nbRowColumn){
                let column = Character(UnicodeScalar(65 + col)!)
                let casePosition: CasePosition = CasePosition(row: row, col: column)
                let state: CaseState = gameBoard[casePosition]!
                
                switch state{
                case CaseState.white:
                    print("O", terminator: " ")
                case CaseState.red:
                    print("X", terminator: " ")
                case CaseState.blank:
                    print(" ", terminator: " ")
                }
            }
        }
        print()
    }
    
}
