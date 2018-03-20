//
//  main.swift
//  TriviaCastor
//
//  Created by Turma Manhã on 21/02/18.
//  Copyright © 2018 Turma Manhã. All rights reserved.
//

// Declaração das Perguntas

struct Pergunta {
    var enunciado:String
    var resposta:String
    var mensagemDeAcerto:String
    var mensagemDeErro:String
    var pontuacao:Int
}

let perguntas = [
    Pergunta(enunciado: "Qual a capital da Croácia?", resposta: "Zagreb", mensagemDeAcerto: "Nice", mensagemDeErro: "Namoralzinha? Errasse essa?", pontuacao: 1),
    Pergunta(enunciado: "Em que ano Swift 1.0 tornou-se disponível?", resposta: "2014", mensagemDeAcerto: "Boa! Parece até que sabe das coisas", mensagemDeErro: "Comassim vei, qual seu problema?", pontuacao: 1),
    Pergunta(enunciado: "Qual o nome do segundo álbum do Vampire Weekend?", resposta: "Contra", mensagemDeAcerto: "Coisas boas para você", mensagemDeErro: "LOL", pontuacao: 1),
    Pergunta(enunciado: "Em que país houve a primeira aparição do símbolo do Bluetooth?", resposta: "Dinamarca", mensagemDeAcerto: "Continua assim que vai longe. Ou não.", mensagemDeErro: "Passei minha vida toda sem fumar, mas essa resposta me deu câncer.", pontuacao: 1),
    Pergunta(enunciado: "Qual projeto foi iniciado primeiro: iPhone ou iPad?", resposta: "iPad", mensagemDeAcerto: "*slow clapping*", mensagemDeErro: "hahahahahahahahaha", pontuacao: 1),
    Pergunta(enunciado: "Longbottom é uma localidade em que série de livros?", resposta: "O Senhor dos Anéis", mensagemDeAcerto: "Pelo menos você sabe ler.", mensagemDeErro: "Eu não me surpeenderia se você falasse que nunca pegou num livro.", pontuacao: 1),
    Pergunta(enunciado: "Qual o nome da poção usada para fazer ossos crescerem no mundo de Harry Potter?", resposta: "Skele-Gro", mensagemDeAcerto: "Que seus ossos nunca se quebrem.", mensagemDeErro: "Espero que você sofra a dor de 206 ossos sendo criados da noite pro dia.", pontuacao: 1),
    Pergunta(enunciado: "Qual foi o filme animado feito completamente em computador?", resposta: "Toy Story", mensagemDeAcerto: "Parabéns, você é quase tão inteligente quanto o Andy do primeiro filme.", mensagemDeErro: "O Andy teria lhe deixado para trás por querer.", pontuacao: 1),
    Pergunta(enunciado: "Em que frequência tenta se comunicar a baleia mais solitária do mundo?", resposta: "52Hz", mensagemDeAcerto: "Quem sabe você não devia fazer companhia à ela no fundo do mar.", mensagemDeErro: "É triste que uma criatura como ela viva só, enquanto uma criatura como você pode estar aqui me pentelhando.", pontuacao: 1)
]


// Mostrando perguntas e lendo as respostas
var input:String?
var pontos = 0

for pergunta in perguntas {
    print(pergunta.enunciado)
    
    input = readLine()
    
    if let palpite = input, palpite == pergunta.resposta {
        print(pergunta.mensagemDeAcerto)
        pontos += pergunta.pontuacao
    } else {
        print(pergunta.mensagemDeErro)
        pontos -= pergunta.pontuacao
    }
}

print("Você fez \(pontos) pontos.")

if pontos > 5 {
    print("Parece que você não é tão burro assim...")
} else {
    print("Tá, foi divertido. Agora jogando sério.")
}
