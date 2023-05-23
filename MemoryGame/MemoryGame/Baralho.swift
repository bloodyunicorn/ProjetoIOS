//
//  Baralho.swift
//  MemoryGame
//
//  Created by Joana Elisa on 20/05/2023.
//
import Foundation

class Baralho {
    
    func getCarta() -> [Carta] {
 
        var geraValores = [Int]()
      
        var baralho = [Carta]()
        
        while geraValores.count < 6 {
            
          
            let valAleatorio = arc4random_uniform(6) + 1
            //confirma o valor e que este não foi repetido
            if geraValores.contains(Int(valAleatorio)) == false {
                
                //guarda o valor na variavel geraValores
                geraValores.append(Int(valAleatorio))

                let carta1 = Carta()
                carta1.nomeImagem = "carta\(valAleatorio)"
                
                baralho.append(carta1)
                
                let carta2 = Carta()
                carta2.nomeImagem = "carta\(valAleatorio)"
                baralho.append(carta2)
              
            } 
            
        }
        //baralha os valores
        
        for i in 0...baralho.count-1{
            // encontra um index
            let valAleatorio = Int (arc4random_uniform(UInt32(baralho.count)))
            
            // troca cartas
            let armazTemp = baralho[i]
            baralho[i] = baralho[valAleatorio]
            baralho[valAleatorio] = armazTemp
        }
      
        return baralho
    }
}
