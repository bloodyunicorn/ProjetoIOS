//
//  MovimentoCartas.swift
//  MemoryGame
//
//  Created by Joana Elisa on 19/05/2023.
//

import UIKit

class MovimentoCartas: UICollectionViewCell{
    
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var capa: UIImageView!
    
    var carta: Carta?
    
    func setImagem(_ carta:Carta){
        
        self.carta = carta
        
        if carta.combina == true{
            
            //deixa a imagem invisivel
            capa.alpha = 0
            imagem.alpha = 0
            
            return
            
        } else {
            //deixa a imagem visivel
             capa.alpha = 1
            imagem.alpha = 1
        }
        
        
        imagem.image = UIImage(named: carta.nomeImagem)
        
 
        if carta.vira == true {
            
            UIView.transition(from: capa, to: imagem, duration: 0, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
            
        } else{
         
            UIView.transition(from: imagem, to: capa, duration: 0, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
            
        }
    }

    func virar(){
        
        UIView.transition(from: capa, to: imagem, duration: 0.5, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
    }

    // vira as duas cartas que não combinam
    func voltar(){
        
        DispatchQueue.main.asyncAfter(deadline:  DispatchTime.now() + 0.8) {
            
            UIView.transition(from: self.imagem, to: self.capa, duration: 0.5, options:[.transitionFlipFromRight,.showHideTransitionViews ], completion: nil)
            
            
        }
        
    }
    }

