//
//  BoardVM.swift
//  TTT
//
//  Created by Dani on 2026. 11. 12..
//

import Foundation

@Observable final class BoardVM {
    
    let size = 3
    let requiredPlacements = 3
    // future update
    
    var boardMatrix: [[Int]] = []
    var placements = 0
    
    var gameON = false
    var currentPlayer = 1
    var playerWins = [-1: 0, 1: 0]
    
    func resetGame() {
        if !gameON {
            boardMatrix = Array(repeating: Array(repeating: 0, count: size), count: size)
            placements = 0
            currentPlayer = 1
        }
    }
    
    func place(x: Int, y: Int) {
        if boardMatrix[x][y] == 0 && gameON {
            boardMatrix[x][y] = currentPlayer
            if checkBoard() {
                gameON = false
                playerWins[currentPlayer]! += 1
                return
            }
            currentPlayer *= -1
        }
    }
    
    func checkBoard() -> Bool {
        
        placements += 1
        
        if placements == size * size {
            return true
        }
        
        var placementsInCRow = 0
        var placementsInCols = Array(repeating: 0, count: size)
        var placementsInDiags = Array(repeating: 0, count: 2)
        
        for row in boardMatrix.indices {
            for col in boardMatrix[row].indices {
                
                let current = boardMatrix[row][col]
                
                placementsInCRow += current
                if abs(placementsInCRow) == requiredPlacements {
                    return true
                }
                
                placementsInCols[col] += current
                
                if col == row {
                    placementsInDiags[0] += current
                    if abs(placementsInDiags[0]) == requiredPlacements {
                        return true
                    }
                }
                
                if col + row == size - 1 {
                    placementsInDiags[1] += current
                    if abs(placementsInDiags[1]) == requiredPlacements {
                        return true
                    }
                }
                
            }
            
            for placement in placementsInCols {
                if abs(placement) == requiredPlacements {
                    return true
                }
            }
            
            placementsInCRow = 0
        }
        
        return false
    }
    
    init() {
        resetGame()
    }
}
