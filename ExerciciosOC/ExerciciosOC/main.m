//
//  main.m
//  ExerciciosOC
//
//  Created by Turma Manhã on 08/03/18.
//  Copyright © 2018 Turma Manhã. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 TODO:
    1. Adicionar check para ver se os inputs lidos são válidos.
 
 */

NSString* readline() {
    fflush(stdin);
    
    int size = 1;
    char *str = (char*)malloc(sizeof(char));
    char c;
    
    int count = 0;
    while (scanf("%c", &c) && c != '\n') {
        str[count] = c;
        
        count++;
        if (count == size) {
            size *= 2;
            str = (char*)realloc(str, size*sizeof(char));
        }
    }
    
    if (count < size) {
        str = (char*)realloc(str, size*sizeof(char));
    }
    
    return [NSString stringWithUTF8String:str];
}

// Eu não sei pq isso precisa existir. Descobrir.
typedef void (^CaseBlock)();

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Escolha um exercício: ");
        NSString* input = readline();
        
        NSDictionary* d = @{
                            @"4.2":
                                ^{
                                    printf("Exercício 4.2\n");
                                    
                                    NSInteger numero;
                                    
                                    do {
                                        printf("Um número entre 100 e 999: ");
                                        NSString* input = readline();
                                        
                                        numero = [input integerValue];
                                    } while (numero < 100 || numero > 999);
                                    
                                    printf("%ld é divisível por 3? %s\n", (long)numero, [(numero%3 == 0) ? @"Sim" : @"Não" UTF8String]);
                                },
                            
                            @"4.3":
                                ^{
                                    printf("Exercício 4.3\n");
                                    
                                    printf("Primeiro Número: ");
                                    NSString* input = readline();
                                    NSInteger numero1 = [input integerValue];
                                    
                                    printf("Segundo Número: ");
                                    input = readline();
                                    NSInteger numero2 = [input integerValue];
                                    
                                    printf("Terceiro Número: ");
                                    input = readline();
                                    NSInteger numero3 = [input integerValue];
                                    
                                    NSInteger max = MAX(numero1, MAX(numero2, numero3));
                                    NSInteger min = MIN(numero1, MIN(numero2, numero3));
                                    
                                    printf("%ld, %ld, %ld\n", min, numero1 + numero2 + numero3 - min - max, max);
                                },
                            
                            @"4.4":
                                ^{
                                    printf("Exercício 4.4\n");
                                    
                                    NSString* input;
                                    
                                    NSString* operacao;
                                    double A, B, C = 0, M = 0;
                                    
                                    while (true) {
                                        printf("Operador: ");
                                        operacao = readline();
                                        
                                        if ([operacao isEqual: @"+"]) {
                                            printf("A = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                A = M;
                                            } else {
                                                A = [input doubleValue];
                                            }
                                            
                                            printf("B = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                B = M;
                                            } else {
                                                B = [input doubleValue];
                                            }
                                            
                                            C = A + B;
                                            printf("%f + %f = %f\n", A, B, C);
                                        } else if ([operacao isEqual: @"-"]) {
                                            printf("A = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                A = M;
                                            } else {
                                                A = [input doubleValue];
                                            }
                                            
                                            printf("B = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                B = M;
                                            } else {
                                                B = [input doubleValue];
                                            }
                                            
                                            C = A - B;
                                            printf("%f - %f = %f\n", A, B, C);
                                        } else if ([operacao isEqual: @"*"]) {
                                            printf("A = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                A = M;
                                            } else {
                                                A = [input doubleValue];
                                            }
                                            
                                            printf("B = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                B = M;
                                            } else {
                                                B = [input doubleValue];
                                            }
                                            
                                            C = A * B;
                                            printf("%f * %f = %f\n", A, B, C);
                                        } else if ([operacao isEqual: @"/"]) {
                                            printf("A = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                A = M;
                                            } else {
                                                A = [input doubleValue];
                                            }
                                            
                                            printf("B = ");
                                            input = readline();
                                            if ([input isEqual: @"M"] || [input isEqual: @"m"]) {
                                                B = M;
                                            } else {
                                                B = [input doubleValue];
                                            }
                                            
                                            C = A / B;
                                            printf("%f / %f = %f\n", A, B, C);
                                        } else if ([operacao isEqual: @"M"]) {
                                            M = C;
                                        } else {
                                            printf("Fechando a calculadora: Operador Inválido Recebido\n");
                                            break;
                                        }
                                    }
                                },
                            @"5.1":
                                ^{
                                    printf("Exercício 5.1\n");
                                    
                                    NSString* input;
                                    
                                    printf("Primeiro Número Secreto: ");
                                    input = readline();
                                    NSInteger numeroSecreto1 = [input integerValue];
                                    
                                    printf("Segundo Número Secreto: ");
                                    input = readline();
                                    NSInteger numeroSecreto2 = [input integerValue];
                                    
                                    printf("\n\n\n\n\n\n\n\n\n\n");
                                    
                                    NSInteger palpite;
                                    bool acertouNumeroSecreto1 = false;
                                    bool acertouNumeroSecreto2 = false;
                                    
                                    do {
                                        printf("Palpite: ");
                                        input = readline();
                                        palpite = [input integerValue];
                                        
                                        if (palpite == numeroSecreto1) {
                                            printf("Acertou o primeiro número.\n");
                                            acertouNumeroSecreto1 = true;
                                        } else if (palpite == numeroSecreto2) {
                                            printf("Acertou o segundo número.\n");
                                            acertouNumeroSecreto2 = true;
                                        } else if (palpite < numeroSecreto1 && palpite < numeroSecreto2) {
                                            printf("Mais pra direita.\n");
                                        } else if (palpite > numeroSecreto1 && palpite > numeroSecreto2) {
                                            printf("Mais pra esquerda.\n");
                                        } else {
                                            printf("Mais pra direita... Ou mais pra esquerda. Você que decide.\n");
                                        }
                                    } while (!(acertouNumeroSecreto1 && acertouNumeroSecreto2));
                                },
                            @"6.1":
                                ^{
                                    printf("Exercício 6.1\n");
                                    
                                    NSInteger numero = 1;
                                    
                                    while (numero <= 100) {
                                        if (numero % 3 == 0 && numero % 5 == 0) {
                                            printf("FizzBuzz\n");
                                        } else if (numero % 3 == 0) {
                                            printf("Fizz\n");
                                        } else if (numero % 5 == 0) {
                                            printf("Buzz\n");
                                        } else {
                                            printf("%ld\n", numero);
                                        }
                                        
                                        numero += 1;
                                    }
                                },
                            
                            @"6.2":
                                ^{
                                    printf("Exercício 6.2\n");
                                    
                                    NSString* input;
                                    NSInteger numero;
                                    NSInteger soma = 0;
                                    
                                    do {
                                        printf(">> ");
                                        input = readline();
                                        numero = [input integerValue];
                                        
                                        soma += numero;
                                    } while (numero != 0);
                                },
                            
                            @"6.3":
                                ^{
                                    printf("Exercício 6.3\n");
                                    
                                    NSString* input;
                                    NSInteger numero;
                                    NSInteger fatorial = 1;
                                    
                                    printf(">> ");
                                    input = readline();
                                    numero = [input integerValue];
                                    
                                    for (int i = 2; i <= numero; i++) {
                                        fatorial *= i;
                                    }
                                    
                                    printf("%ld! = %ld\n", numero, fatorial);
                                },
                            
                            @"6.4":
                                ^{
                                    printf("Exercício 6.4\n");
                                    
                                    NSString* input;
                                    NSInteger numero, soma = 0;
                                    
                                    printf(">> ");
                                    input = readline();
                                    numero = [input integerValue];
                                    
                                    while (numero > 0) {
                                        soma += numero % 10;
                                        numero /= 10;
                                    }
                                    
                                    printf("Resultado: %ld\n", soma);
                                }
                            };
        
        ((CaseBlock)d[input])();
    }
    return 0;
}
