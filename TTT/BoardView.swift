//
//  ContentView.swift
//  TTT
//
//  Created by Dani on 2026. 11. 12..
//

import SwiftUI

struct BoardView: View {
    @State private var vm = BoardVM()
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .leading) {
                Text("X wins: \(vm.playerWins[1] ?? 0) | O wins: \(vm.playerWins[-1] ?? 0)")
                    .font(.title2)
                
                Text("Current player: \(vm.currentPlayer == 1 ? "X" : "O")")
                    .font(.title2)
                
                VStack {
                    // the two ForEach loops give warnings - future fix
                    ForEach(0..<vm.size) { row in
                        HStack {
                            ForEach(0..<vm.size) { col in
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 20)
                                        .frame(width: 100, height: 100)
                                        .foregroundStyle(.blue)
                                        .onTapGesture {
                                            vm.place(x: row, y: col)
                                        }
                                    
                                    Text(vm.boardMatrix[row][col] == 0 ? "" : (vm.boardMatrix[row][col] > 0 ? "X" : "O"))
                                        .foregroundStyle(.white)
                                        .font(.largeTitle)
                                        .scaleEffect(1.2)
                                        .bold()
                                }
                                .padding(5)
                            }
                        }
                    }
                }
                .padding(.vertical, 50)
                
                Button {
                    vm.resetGame()
                    vm.gameON.toggle()
                } label: {
                    Label(vm.gameON ? "Stop" : "Start", systemImage: vm.gameON ? "stop.fill" : "play.fill")
                }
                .buttonStyle(.bordered)
                .controlSize(.large)
                .tint(vm.gameON ? .red : .green)
            }
            .navigationTitle("TicTacToe")
        }
    }
}

#Preview {
    BoardView()
}
