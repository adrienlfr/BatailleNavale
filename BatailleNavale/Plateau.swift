//
//  Plateau.swift
//  BatailleNavale
//
//  Created by Adrien LEFAURE on 19/01/2018.
//  Copyright © 2018 Adrien LEFAURE. All rights reserved.
//

import Foundation

enum CaseState {
    case white
    case red
    case blank
}

enum Action {
    case shot
    case isAt
}

enum CardinalPoint {
    case north
    case south
    case east
    case west
}

extension Optional {
    func lett(_ lambda: (_ value: Wrapped) -> Void) {
        switch self {
        case .some(let value):
            lambda(value)
        case .none:
            break
        }
    }
}

class Plateau{
    var columns: [Character]// = "ABCDEFGH".map( { return $0 })
    var nbRow: Int
    var gameBoard: [CasePosition: CaseState]
    var ships: [Bateau]
    var lastCasePosition: CasePosition?
    var nbShipsSunk: Int
    var allPositionsByLine: [CasePosition] {
        var positions = [CasePosition]()
        for row in (0..<columns.count){
            for col in (0..<nbRow){
                let column = columns[col]
                let casePosition = CasePosition(row: row, col: column)
                positions.append(casePosition)
            }
        }
        return positions
    }
    
    init(columns: Character...) {
        self.columns = columns
        self.nbRow = columns.count
        gameBoard = [:]
        ships = []
        lastCasePosition = nil
        nbShipsSunk = 0
    }
    
    func initGameBoard(){
        allPositionsByLine.forEach { position in
            gameBoard.updateValue(CaseState.blank, forKey: position)
        }
    }
    
    func addShip(casePosition: CasePosition, shipLength: Int, cardinalPoint: CardinalPoint) -> Bool {
        var onShip = false
        var i = 0
        var ship = Bateau()
        
        while(!onShip && i < shipLength){
            let position: CasePosition
            
            if let nextPosition = casePosition.positionAt(cardinalPoint) {
                position = nextPosition
            }
            
            
            onShip = findShipAtCase(casePosition: position, action: Action.isAt) == Answer.touched
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
    
    
    
    func findShipAtCase(casePosition: CasePosition, action: Action) -> Answer {
        var result: Answer = Answer.missed
        var i = 0
        while(result != Answer.missed && i < ships.count){
            if(!ships[i].isSunk()) {
                switch action {
                case .shot :
                    lastCasePosition = casePosition
                    result = ships[i].isStriked(casePosition: casePosition)
                case .isAt :
                    let isAt = ships[i].isAt(casePosition: casePosition)
                    if (isAt) {
                        result = Answer.touched
                    }
                }
            }
            i += 1
        }
        return result
    }
    
    func displayBoard() {
        for col in (0...columns.count){
            if (col > 0) {
                print(columns[col-1], terminator: " ")
            } else {
                print("  ", terminator: " ")
            }
        }
        for row in (0..<nbRow){
            print("\n", row + 1, terminator: " ")
            for col in (0..<columns.count){
                let casePosition: CasePosition = CasePosition(row: row, col: columns[col])
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
