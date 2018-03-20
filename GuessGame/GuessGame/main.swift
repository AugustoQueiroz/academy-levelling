//
//  main.swift
//  GuessGame
//
//  Created by Turma Manhã on 2/22/18.
//  Copyright © 2018 Turma Manhã. All rights reserved.
//

print(">> ", terminator: "")
var input = readLine()

if let numerostr = input {
    if let numero = Int(numerostr) {
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        
        GuessLoop: for _ in 1...3 {
            print(">> ", terminator: "")
            input = readLine()
            
            if let palpitestr = input {
                if let palpite = Int(palpitestr) {
                    if palpite == numero {
                        print("Você acertou!")
                        break GuessLoop
                    } else if palpite > numero {
                        print("Mais pra esquerda.")
                    } else {
                        print("Mais pra direita.")
                    }
                }
            }
        }
        
        print("O número era \(numero).")
    }
}
