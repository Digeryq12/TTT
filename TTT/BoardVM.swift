//
//  BoardVM.swift
//  TTT
//
//  Created by Dani on 2026. 11. 12..
//

import Foundation

@Observable final class BoardVM {

    let size = 3 // future update
    
    var boardMatrix: [[Int]] = []
    
    var gameON = false
    var currentPlayer = 1
    
    func resetGame() {
        if !gameON {
            boardMatrix = Array(repeating: Array(repeating: 0, count: size), count: size)
            currentPlayer = 1
        }
    }
    
    func place(x: Int, y: Int) {
        if boardMatrix[x][y] == 0 && gameON {
            boardMatrix[x][y] = currentPlayer
            checkBoard()
            currentPlayer *= -1
        }
    }
    
    func checkBoard() {
        
    }
    
    init() {
        resetGame()
    }
}
