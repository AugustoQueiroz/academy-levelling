//
//  main.swift
//  Exercicios
//
//  Created by Turma Manhã on 23/02/18.
//  Copyright © 2018 Turma Manhã. All rights reserved.
//

import Foundation

/* Minhas definições de Operadores */
infix operator *: MultiplicationPrecedence
func *(left: String, right: Int) -> String {
    var novaString = ""
    
    var i = 0
    while i < right {
        novaString += left
        
        i += 1
    }
    
    return novaString
}

infix operator **: MultiplicationPrecedence
func **(left: Decimal, right: Int) -> Decimal {
    return pow(left, right)
}

postfix operator ++
postfix func ++(left: inout Int) -> Int {
    left += 1
    return left
}

postfix operator --
postfix func --(left: inout Int) -> Int {
    left -= 1
    return left
}

// Definição do Struct Ponto, que será usado em alguns exercícios
struct Ponto:Forma {
    var x:Double
    var y:Double
    
    func area() -> Double {
        return 0
    }
    
    func distancia(para outro: Ponto) -> Double {
        return sqrt((self.x-outro.x)*(self.x-outro.x) + (self.y-outro.y)*(self.y-outro.y))
    }
    
    func igual(a outra: Forma) -> Bool {
        if outra is Ponto {
            let p = outra as! Ponto
            return self.x == p.x && self.y == p.y
        } else {
            return false
        }
    }
    
    func inclui(ponto: Ponto) -> Bool {
        return false
    }
    
    mutating func mover(x: Double, y: Double) {
        self.x += x
        self.y += y
    }
}

// Definição do protocolo usado para os exercícios da sessão 12
protocol Forma {
    func area() -> Double
    func igual(a outra: Forma) -> Bool
    func inclui(ponto: Ponto) -> Bool
    mutating func mover(x: Double, y: Double)
}

print(">>", terminator: " ")
var input = readLine()

if let mode = input {
    switch mode {
    case "4.1":
        print("Exercício 4.1")
        
    case "4.2":
        print("Exercício 4.2")
        
        print("Um número entre 100 e 999:", terminator: " ")
        input = readLine()
        
        if let numeroOpt = input, let numero = Int(numeroOpt) {
            if numero >= 100 && numero <= 999 {
                print("\(numero) é divisível por 3? \((numero%3 == 0) ? "sim": "não")")
            }
        }
        
    case "4.3":
        print("Exercício 4.3")
        
        print("Primeiro número:", terminator: " ")
        let numero1 = Int(readLine()!)!
        
        print("Segundo número:", terminator: " ")
        let numero2 = Int(readLine()!)!
        
        print("Terceiro número:", terminator: " ")
        let numero3 = Int(readLine()!)!
        
        let maior = max(numero1, numero2, numero3)
        let menor = min(numero1, numero2, numero3)
        
        print("\(menor), \(numero1 + numero2 + numero3 - maior - menor), \(maior)")
        
    case "4.4", "4.5", "4.6":
        print("Exercício 4.4 / 4.5 / 4.6")
        
        let operadores: Set = ["+", "-", "*", "/", "M"]
        var operacao:String = "M"
        var A: Double = 0
        var B: Double = 0
        var C: Double = 0
        var M: Double = 0
        
        while true {
            print("Operador:", terminator: " ")
            input = readLine()
            
            if let operador = input {
                if !operadores.contains(operador) {
                    print("Fechando a calculadora: Operador Inválido Recebido")
                    break
                }
                
                operacao = operador
            }
            
            if operacao != "M" {
                print("A =", terminator: " ")
                input = readLine()
                
                if let numeroOpt = input {
                    if let numero = Double(numeroOpt) {
                        A = numero
                    } else {
                        if numeroOpt == "M" || numeroOpt == "m" {
                            A = M
                        } else {
                            print("Fechando a calculadora: Operando Inválido Recebido")
                            break
                        }
                    }
                }
                
                print("B =", terminator: " ")
                input = readLine()
                
                if let numeroOpt = input {
                    if let numero = Double(numeroOpt) {
                        B = numero
                    } else {
                        if numeroOpt == "M" || numeroOpt == "m" {
                            B = M
                        } else {
                            print("Fechando a calculadora: Operando Inválido Recebido")
                            break
                        }
                    }
                }
            }
            
            switch operacao {
            case "+":
                C = A + B
                print("\(A) \(operacao) \(B) = \(C)")
            case "-":
                C = A - B
                print("\(A) \(operacao) \(B) = \(C)")
            case "*":
                C = A * B
                print("\(A) \(operacao) \(B) = \(C)")
            case "/":
                C = A / B
                print("\(A) \(operacao) \(B) = \(C)")
            case "M":
                M = C
            default:
                print("Fechando a calculadora")
                break
            }
        }
        
    case "5.1":
        print("Exercício 5.1")
        
        print("Primeiro Número Secreto:", terminator: " ")
        let numeroSecreto1 = Int(readLine()!)!
        
        print("Segundo Número Secreto:", terminator: " ")
        let numeroSecreto2 = Int(readLine()!)!
        
        print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
        
        var palpite: Int
        var acertouNumeroSecreto1 = false
        var acertouNumeroSecreto2 = false
        
        repeat {
            palpite = Int(readLine()!)!
            
            if palpite == numeroSecreto1 {
                print("Acertou o primeiro número.")
                acertouNumeroSecreto1 = true
            } else if palpite == numeroSecreto2 {
                print("Acertou o segundo número.")
                acertouNumeroSecreto2 = true
            } else if palpite < numeroSecreto1 && palpite < numeroSecreto2 {
                print("Mais pra direita.")
            } else if palpite > numeroSecreto1 && palpite > numeroSecreto2 {
                print("Mais pra esquerda.")
            } else {
                print("Mais pra direita... Ou mais pra esquerda. Você que decide.")
            }
        } while !(acertouNumeroSecreto1 && acertouNumeroSecreto2)
        
    case "6.1":
        print("Exercício 6.1")
        
        var numero = 1
        
        while numero <= 100 {
            if numero % 3 == 0 && numero % 5 == 0 {
                print("FizzBuzz")
            } else if numero % 3 == 0 {
                print("Fizz")
            } else if numero % 5 == 0 {
                print("Buzz")
            } else {
                print(numero)
            }
            
            numero += 1
        }
        
    case "6.2":
        print("Exercício 6.2")
        
        var input:String?
        var numero = 1.0
        var soma = 0.0
        
        repeat {
            input = readLine()
            
            if let i = input, let n = Double(i) {
                numero = n
                soma += numero
            } else {
                print("Por favor, entre um número válido!")
            }
        } while numero != 0
        
        print("Resultado: \(soma)")
        
    case "6.3":
        print("Exercício 6.3")
        
        var input:String?
        var numero = 1
        var fatorial = 1
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                break
            }
        } while true
        
        var i = 1
        while i <= numero {
            fatorial *= i
            i += 1
        }
        
        print("\(numero)! = \(fatorial)")
        
    case "6.4":
        print("Exercício 6.4")
        
        var input:String?
        var numero = 1
        var soma = 0
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        while numero > 0 {
            soma += numero % 10
            numero /= 10
        }
        
        print("Resultado: \(soma)")
        
    case "6.5":
        print("Exercício 6.5")
        
        var input:String?
        var numero = 1
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var primo = true
        var i = 2
        
        while primo && i < numero/2 {
            if numero % i == 0 {
                primo = false
            }
            i += 1
        }
        
        if primo {
            print("\(numero) é primo")
        } else {
            print("\(numero) é divisível por \(i-1)")
        }
        
    case "6.9":
        print("Exercício 6.9")
        
        var input:String?
        var numero = 1
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var i = 1
        
        while i < numero {
            if i*i*i == numero {
                print("A raíz cúbica de \(numero) é \(i).")
                break
            }
            
            i += 1
        }
        
        if i == numero {
            print("\(numero) não tem raíz inteira.")
        }
        
    case "6.10":
        print("Exercício 6.10")
        
        var input:String?
        var numero = 1
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var fibn2 = 1
        var fibn1 = 1
        var fibn:Int = 0
        var i = 0
        
        while i < numero {
            fibn = fibn1 + fibn2
            fibn2 = fibn1
            fibn1 = fibn
            
            i += 1
        }
        
        print("f(\(numero)) = \(fibn)")
        
    case "6.11":
        print("Exercício 6.11")
        
        var input:String?
        var numero = 1
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var i = 2
        
        print("Primos entre 2 e \(numero):", terminator: " ")
        while i < numero {
            var j = 2
            var primo = true
            while j < i {
                if i % j == 0 {
                    primo = false
                }
                j += 1
            }
            
            if primo {
                print(i, terminator: " ")
            }
            i += 1
        }
        
        print()
        
    case "6.12":
        print("Exercício 6.12")
        
        var input:String?
        var numero = 0
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var primo = true
        var i = 2
        
        while i < numero {
            if numero % i == 0 && primo {
                print("Não é primo. É divisível por:", terminator: " ")
                primo = false
                print(i, terminator: " ")
            } else if numero % i == 0 {
                print(i, terminator: " ")
            }
            
            i += 1
        }
        print()
        
    case "6.13":
        print("Exercício 6.13")
        
        var input:String?
        var numero = 0
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var i = 1
        var media:Double = 0
        
        while i <= numero {
            media += Double(i)
            media /= 2
            
            print("Média de 1 a \(i) = \(media)")
            
            i += 1
        }
        
    case "6.14":
        print("Exercício 6.14")
        
        var input:String?
        var numero = 0
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var i = 1
        while i < numero {
            var j = 0
            
            while j < 6 {
                if Decimal(i)**j == Decimal(numero) {
                    print("\(i)**\(j) = \(numero)")
                }
                
                j += 1
            }
            
            i += 1
        }
        
    case "6.15":
        print("Exercício 6.15")
        
        var input:String?
        var numeroSecreto = 0
        var inputValido = false
        
        repeat {
            print("Número Secreto >>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i), n >= 1 && n <= 200 {
                numeroSecreto = n
                inputValido = true
            } else {
                print("O número secreto deve ser um número válido entre 1 e 200.")
            }
        } while !inputValido
        
        var n = 10
        while n-- > 0 {
            print()
        }
        
        let palpitesValidos:Set = [1, 3, 6, 12, 25, 50, 100]
        var S = 0
        var contador = 0
        
        repeat {
            print("Palpite >>", terminator: " ")
            input = readLine()
            
            if let i = input, let palpite = Int(i), palpitesValidos.contains(palpite) {
                if S < numeroSecreto {
                    S += palpite
                } else {
                    S -= palpite
                }
                contador += 1
            } else {
                print("Palpite deve ser um número das seguintes opções: 100, 50, 25, 12, 6, 3, 1")
            }
        } while S != numeroSecreto
        
        print("Foram necessários \(contador) palpites para acertar.")
        
    case "6.16":
        print("Exercício 6.16")
        
        var input:String?
        var numero = 0
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var i = 1
        while i <= numero {
            print(i, terminator: ": ")
            
            var j = 1
            while j <= 10 {
                print(i*j, terminator: " ")
                
                j += 1
            }
            
            print()
            i += 1
        }
        
    case "6.17":
        print("Exercício 6.17")
        
        var input:String?
        var R = 5
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                R = n
                inputValido = true
            }
        } while !inputValido
        
        let e = R - 1
        
        var i = 0
        while i < 2*R+3 {
            var j = 0
            while j < 2*R + 3 {
                let distance = (R+2-i)*(R+2-i) + (R+1-j)*(R+1-j)
                if R*R-e <= distance && distance <= R*R+e {
                    print("**", terminator: "")
                } else {
                    print("  ", terminator: "")
                }
                
                j += 1
            }
            print()
            
            i += 1
        }
        print()
        
    case "7.1":
        print("Exercício 7.1")
        
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        var soma = 0
        
        var i = 0
        while i < array.count {
            soma += array[i]
            
            i += 1
        }
        
        print(soma)
        
    case "7.2":
        print("Exercício 7.2")
        
        let array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        var max = array[0]
        
        var i = 0
        while i < array.count {
            if array[i] > max {
                max = array[i]
            }
            
            i += 1
        }
        
        print(/*array.*/max/*()!*/)
        
    case "7.3":
        print("Exercício 7.3")
        
        let array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let array2 = [10, 11, 12, 13, 14, 15, 16, 17, 18, 19]
        var array3:[Int] = []
        
        var i = 0
        while i < array1.count {
            if array1[i] % 2 != 0 {
                array3.append(array1[i])
            }
            
            i += 1
        }
        
        i = 0
        while i < array2.count {
            if array2[i] % 2 != 0 {
                array3.append(array2[i])
            }
            
            i += 1
        }
        
        print(array3)
        
    case "7.4":
        print("Exercício 7.4")
        
        var array = [2.5, 6, 27.3, 25, 8.7]
        
        var i = 0
        while i < array.count {
            if array[i].truncatingRemainder(dividingBy: 1) != 0 {
                array.remove(at: i)
                i -= 1
            }
            
            i += 1
        }
        
        print(array)
        
    case "7.5":
        print("Exercício 7.5")
        
        var A1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        var A2 = [2, 4, 6, 8]
        var A3:[Int] = []
        
        var i = 0
        while i < A1.count {
            var j = 0
            while j < A2.count {
                if A1[i] == A2[j] {
                    break
                }
                
                j += 1
            }
            
            if j == A2.count {
                A3.append(A1[i])
            }
            
            i += 1
        }
        
        print(A3)
        
    case "7.6":
        print("Exercício 7.6")
        print("Código no TriviaCastor")
        
    case "7.7":
        print("Exercício 7.7")
        
        var input:String?
        var array:[Double]  = []
        var continuar = true
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Double(i) {
                array.append(n)
            } else if let i = input, i == "" {
                continuar = false
            }
        } while continuar
        
        var media = 0.0
        
        var i = 0
        while i < array.count {
            media += array[i]
            
            i += 1
        }
        
        media /= Double(array.count)
        
        print(media)
        
    case "7.8":
        print("Exercício 7.8")
        
        var input:String?
        var numero = 5
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var primos:[Int] = []
        
        var i = 2
        while i < numero {
            var j = 2
            var primo = true
            while j < i {
                if i % j == 0 {
                    primo = false
                }
                j += 1
            }
            
            if primo {
                primos.append(i)
            }
            
            i += 1
        }
        
        i = 0
        while i < primos.count - 1 {
            print(primos[i], terminator: ", ")
            
            i += 1
        }
        
        print(primos[i])
        
    case "7.9":
        print("Exercício 7.9")
        
        var input:String?
        var numero = 5
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input, let n = Int(i) {
                numero = n
                inputValido = true
            }
        } while !inputValido
        
        var fatoriais:[Int] = [1]
        
        var i = 1
        while i <= numero {
            fatoriais.append(i)
            
            var j = 2
            while j < i {
                fatoriais[i] *= j
                
                j += 1
            }
            
            i += 1
        }
        
        i = 0
        while i < fatoriais.count - 1 {
            print(fatoriais[i], terminator: ", ")
            
            i += 1
        }
        
        print(fatoriais[i])
        
    case "7.10":
        print("Exercício 7.10")
        
        var input:String?
        var palavraSecreta = ""
        var inputValido = false
        
        repeat {
            print(">>", terminator: " ")
            input = readLine()
            
            if let i = input {
                palavraSecreta = i
                inputValido = true
            }
        } while !inputValido
        
        let skip = 10
        
        var i = 0
        while i < skip {
            print()
            
            i += 1
        }
        
        
        var palavraRevelada = "_" * palavraSecreta.count
        print(palavraRevelada)
        
        var palpite = "a"
        var palpites:Set<String> = []
        
        var guesses = 5
        
        while guesses > 0 {
            inputValido = false
            repeat {
                print(">>", terminator: " ")
                input = readLine()
                
                if let i = input {
                    palpite = i
                    palpites.insert(palpite)
                    inputValido = true
                }
            } while !inputValido
            
            if palavraSecreta.contains(Character(palpite)) {
                var j = 0
                while j < palavraSecreta.count {
                    if palavraSecreta[palavraSecreta.index(palavraSecreta.startIndex, offsetBy: j)] == Character(palpite) {
                        palavraRevelada.remove(at: palavraRevelada.index(palavraRevelada.startIndex, offsetBy: j))
                        palavraRevelada.insert(Character(palpite), at: palavraRevelada.index(palavraRevelada.startIndex, offsetBy: j))
                    }
                    
                    j += 1
                }
            } else {
                print("Nope.")
                guesses -= 1
            }
            
            print(palavraRevelada)
            print(palpites)
            print("Erros restantes: \(guesses)")
            
            if palavraRevelada == palavraSecreta {
                print("Você ganhou.")
                break
            }
        }
        
    case "8.1":
        print("Exercício 8.1")
        
        let numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        
        var soma = 0
        
        for numero in numeros {
            soma += numero*numero
        }
        
        print(soma)
        
    case "8.2":
        print("Exercício 8.2")
        print("No TriviaCastor")
        
    case "8.3":
        print("Exercício 8.3")
        
        struct Cadastro {
            var alunos:[String:Aluno]
            
            mutating func gravar(aluno: Aluno) {
                self.alunos[aluno.CPF] = aluno
            }
            
            func possuiAlunoCom(CPF: String) -> Bool {
                if let _ = alunos[CPF] {
                    return true
                } else {
                    return false
                }
            }
            
            mutating func removerAlunoCom(CPF: String) {
                self.alunos.removeValue(forKey: CPF)
            }
            
            mutating func adicionar(disciplina: Disciplina, em aluno: String) {
                if let _ = self.alunos[aluno] {
                    self.alunos[aluno]!.disciplinasCursadas.append(disciplina)
                }
            }
            
            func verificarSe(aluno cpf: String, cursou codDisciplina: String) -> Bool {
                if let aluno = self.alunos[cpf] {
                    for disciplina in aluno.disciplinasCursadas {
                        if disciplina.codigo == codDisciplina {
                            return true
                        }
                    }
                }
                
                return false
            }
        }
        
        struct Aluno {
            var CPF:String
            var nome:String
            var disciplinasCursadas:[Disciplina]
        }
        
        struct Disciplina {
            var codigo:String
            var nome:String
            var semestre:String
        }
        
        var cadastro = Cadastro(alunos: [:])
        
        cadastro.gravar(aluno: Aluno(CPF: "12345678", nome: "João José Maria", disciplinasCursadas: []))
        cadastro.adicionar(disciplina: Disciplina(codigo: "IF685", nome: "Gerenciamento de Dados e Informação", semestre: "2018.1"), em: "12345678")
        
        print(cadastro.verificarSe(aluno: "12345678", cursou: "IF685"))
        
    case "9.1", "9.2":
        print("Exercício 9.1/9.2")
        
        func square(_ x: Int) -> Int {
            return x*x
        }
        
        func somaDosQuadrados(x: Int, y: Int) -> Int {
            return square(x) + square(y)
        }
        
    case "9.3":
        print("Exercício 9.3")
        
        func sqrt(_ N: Double) -> Double {
            var r = N/2
            let margem = 0.0001
            
            while (r*r < N - margem) || (r*r > N + margem) {
                r = (r + N/r)/2
            }
            
            return r
        }
        
        print(sqrt(100))
        
    case "9.4":
        print("Exercício 9.4")
        
        /*
         Function exp_by_squaring_iterative(x, n)
         if n < 0 then
         x := 1 / x;
         n := -n;
         if n = 0 then return 1
         y := 1;
         while n > 1 do
         if n is even then
         x := x * x;
         n := n / 2;
         else
         y := x * y;
         x := x * x;
         n := (n – 1) / 2;
         return x * y
         */
        
        func elevar(_ a: Int, a b: Int) -> Int {
            var x = a
            var n = b
            
            if n < 0 {
                x = 1/x
                n = -n
            }
            
            if n == 0 {
                return 1
            }
            
            var y = 1
            while n > 1 {
                if n % 2 == 0 {
                    x = x*x
                    n = n/2
                } else {
                    y = x*y
                    x = x*x
                    n = (n-1)/2
                }
            }
            
            return x*y
        }
        
        print(elevar(5, a: 4))
        
    case "9.5":
        print("Exercício 9.5")
        
        func somaMatrizes(_ A: [[Int]], e B: [[Int]]) -> [[Int]]? {
            guard !A.isEmpty && !B.isEmpty && A.count == B.count && A[0].count == B[0].count else {
                // Não é possível somar as matrizes
                return nil
            }
            
            var C = A
            
            var i = 0
            for linha in B {
                var j = 0
                for item in linha {
                    C[i][j] += item
                    
                    j += 1
                }
                
                i += 1
            }
            
            return C
        }
        
        print(somaMatrizes([[1, 2], [3, 4]], e: [[5, 6], [7, 8]])!)
        
    case "9.6":
        print("Exercício 9.6")
        
        func multiplicaMatrizes(_ A: [[Int]], e B: [[Int]]) -> [[Int]]? {
            guard !A.isEmpty && !B.isEmpty && A[0].count == B.count else {
                // Não é possível multiplicar as matrizes
                return nil
            }
            
            let M = A.count
            let K = A[0].count
            let N = B[0].count
            
            var C = Array(repeating: Array(repeating: 0, count: N), count: M) // Cria uma matriz de tamanho MxN com 0s
            
            var i = 0
            while i < M {
                var j = 0
                while j < N {
                    var k = 0
                    while k < K {
                        C[i][j] += A[i][k]*B[k][j]
                        
                        k += 1
                    }
                    
                    j += 1
                }
                
                i += 1
            }
            
            return C
        }
        
        print(multiplicaMatrizes([[1, 2], [3, 4]], e: [[5, 6, 7], [8, 9, 10]])!)
        
    case "9.7":
        print("Exercício 9.7")
        
        func sort(A: [Double]) -> [Double] { // Quicksort Iterativo em Swift
            func checkIfSorted(_ A: [Double]) -> Bool {
                guard A.count > 0 else { // Um array vazio está ordenado
                    return true
                }
                
                var last = A[0]
                
                for item in A {
                    if item < last {
                        return false
                    }
                    
                    last = item
                }
                
                return true
            }
            
            func partition(_ A: inout [Double], _ lo: Int, _ hi: Int) -> Int {
                let pivot = A[hi]
                
                var i = lo - 1
                var j = lo
                while j < hi {
                    if A[j] < pivot {
                        i = i+1
                        
                        let tmp = A[i]
                        A[i] = A[j]
                        A[j] = tmp
                    }
                    
                    j += 1
                }
                
                let tmp = A[i+1]
                A[i+1] = A[hi]
                A[hi] = tmp
                
                return i+1
            }
            
            guard checkIfSorted(A) else {
                return A
            }
            
            var B = A
            
            var queue:[Int] = [0, A.count-1]
            
            while queue.count > 0 {
                let lo = queue.removeFirst()
                let hi = queue.removeFirst()
                
                let p = partition(&B, lo, hi)
                
                if p > lo {
                    queue.append(lo)
                    queue.append(p - 1)
                }
                
                if p < hi {
                    queue.append(p+1)
                    queue.append(hi)
                }
            }
            
            return B
        }
        
        print(sort(A: [1.0, 4.0, 2.0, 7.0, 3.0, 8.0, 9.0, 0.0, 6.0, 5.0]))
        
    case "10.1":
        print("Exercício 10.1")
        
        struct Retangulo {
            var altura:Double
            var largura:Double
            var centro:Ponto
            var area:Double{ return self.altura * self.largura }
            
            func comparar(com r2: Retangulo) -> Bool {
                // É igual se todas as informações forem iguais
                return (self.centro.igual(a: r2.centro) && self.altura == r2.altura && self.largura == r2.largura)
            }
            
            func distancia(para p: Ponto) -> Decimal {
                var distancia:Decimal = 0
                
                if self.centro.x-self.largura/2 <= p.x && p.x <= self.centro.x+self.largura/2 {
                    // Ponto está diretamente abaixo ou acima do retângulo, a distância é a distância de y do ponto para a lateral mais próxima (distância em y do centro, menos a distância do centro para a lateral)
                    distancia = pow(pow(Decimal(self.centro.y-p.y+self.altura/2), 2), 1/2)
                } else if self.centro.y-self.altura/2 <= p.y && p.y <= self.centro.y+self.altura/2 {
                    // Ponto está diretamente à esquerda ou à direita do retângulo, a distância é a distância de x do ponto para a lateral mais próxima (distância em x do centro, menos a distância do centro para a lateral)
                    distancia = pow(pow(Decimal(self.centro.x-p.x+self.largura/2), 2), 1/2)
                } else {
                    // Ponto está em uma das diagonais em relação ao retângulo, a distância é a distância para a quina mais próxima
                    distancia = pow(pow(Decimal(self.centro.x-p.x+self.largura/2), 2) + pow(Decimal(self.centro.y-p.y+self.altura/2), 2), 1/2)
                }
                
                return distancia
            }
        }
        
    case "10.2":
        print("Exercício 10.2")
        
        struct Pokemon {
            var nome:String
            var tipo:(String, String?)
            let totalHP:Int
            var currHP:Int
            var ataques:[Ataque]
            
            func temTipoEmComum(com p: Pokemon) -> Bool {
                if self.tipo.0 == p.tipo.0 {
                    return true
                } else if let t = self.tipo.1, t == p.tipo.0 {
                    return true
                } else if let t = p.tipo.1, self.tipo.0 == t {
                    return true
                } else if let t1 = self.tipo.1, let t2 = self.tipo.1, t1 == t2 {
                    return true
                }
                
                return false
            }
            
            func tem(ataque: Ataque) -> Bool {
                for a in self.ataques {
                    if ataque.nome == a.nome && ataque.dano == a.dano {
                        return true
                    }
                }
                
                return false
            }
            
            func ataca(_ p: inout Pokemon, com ataque: Ataque) {
                guard self.tem(ataque: ataque) else {
                    return
                }
                
                p.currHP -= ataque.dano
            }
        }
        
        struct Ataque {
            var nome:String
            var dano:Int
        }
        
        var pikachu = Pokemon(nome: "Pikachu", tipo: ("Elétrico", nil), totalHP: 130, currHP: 130, ataques: [
                Ataque(nome: "Cauda de Ferro", dano: 30),
                Ataque(nome: "Faísca Excessiva", dano: 50)
            ])
        
        var groudon = Pokemon(nome: "Groudon", tipo: ("Lutador", nil), totalHP: 180, currHP: 180, ataques: [
                Ataque(nome: "Garra Dilacerante", dano: 30),
                Ataque(nome: "Laceração Massiva", dano: 130)
            ])
        
        print(pikachu.temTipoEmComum(com: groudon))
        
        groudon.ataca(&pikachu, com: groudon.ataques[1])
        
        print(pikachu.currHP)
        
    case "12.1", "12.2", "12.3":
        print("Exercício 12.1/12.2/12.3")
        
        struct Retangulo:Forma {
            var altura:Double
            var largura:Double
            var centro: Ponto
            
            func area() -> Double {
                return altura*largura
            }
            
            func igual(a outra: Forma) -> Bool {
                if outra is Retangulo {
                    let ret = outra as! Retangulo
                    return self.altura == ret.altura && self.largura == ret.largura && self.centro.igual(a: ret.centro)
                } else {
                    return false
                }
            }
            
            func inclui(ponto: Ponto) -> Bool {
                return abs(self.centro.x-ponto.x) < self.largura/2 && abs(self.centro.y-ponto.y) < self.altura/2
            }
            
            mutating func mover(x: Double, y: Double) {
                self.centro.x += x
                self.centro.y += y
            }
        }
        
        struct Circulo:Forma {
            var raio:Double
            var centro:Ponto
            
            func area() -> Double {
                return raio*raio*Double.pi
            }
            
            func igual(a outra: Forma) -> Bool {
                if outra is Circulo {
                    let c = outra as! Circulo
                    return self.raio == c.raio && self.centro.igual(a: c.centro)
                } else {
                    return false
                }
            }
            
            func inclui(ponto: Ponto) -> Bool {
                return centro.distancia(para: ponto) < raio
            }
            
            mutating func mover(x: Double, y: Double) {
                self.centro.x += x
                self.centro.y += y
            }
        }
        
    default:
        print("Não existe o exercício com o código requisitado.")
    }
}
