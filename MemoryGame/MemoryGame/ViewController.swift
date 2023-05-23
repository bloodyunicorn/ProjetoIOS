//
//  ViewController.swift
//  MemoryGame
//
//  Created by Joana Elisa on 18/05/2023.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var baralho = Baralho()
    var listaCartas = [Carta]()
    
    var cartaVirada : IndexPath?
    
    @IBAction func repor(_ sender: Any) {
       
        collectionView.reloadData()  //limpa a tabela
        
        listaCartas = baralho.getCarta()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listaCartas = baralho.getCarta()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return listaCartas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // determina o campo na tabela
        let campo = collectionView.dequeueReusableCell(withReuseIdentifier: "Carta", for: indexPath) as! MovimentoCartas
        
        //determina a carta a usar
        let carta = listaCartas[indexPath.row]
        
        
        //atribui uma imagem ao campo
        campo.setImagem(carta)
        
                return campo
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        
       let campo =  collectionView.cellForItem(at: indexPath) as! MovimentoCartas
        
        //seleciona a carta
        let carta = listaCartas[indexPath.row]
        
        if carta.vira == false && carta.combina == false {
           
            campo.virar()
            
            carta.vira = true
            
            //confirma se é a primeira carta a ser virada
            if cartaVirada == nil {
                
                cartaVirada = indexPath
                
            } else {
                
                confirmaPar(indexPath)
                
            }
        }
        
    }
    
    //logica de jogo
    func confirmaPar(_ segundaCartaVirada: IndexPath){
        //verifica o campo onde estão as cartas (tabela)
        let campoCarta1 = collectionView.cellForItem(at: cartaVirada!) as? MovimentoCartas
        
        let campoCarta2 = collectionView.cellForItem(at: segundaCartaVirada) as? MovimentoCartas
        
        //verifica as cartas viradas
        let cartaUm = listaCartas[cartaVirada!.row]
        let cartaDois = listaCartas[segundaCartaVirada.row]
        
        //compara cartas
        if cartaUm.nomeImagem == cartaDois.nomeImagem {
        
            cartaUm.combina = true
            cartaDois.combina = true
        
            confirmaFim()
        
        } else {

            cartaUm.vira = false
            cartaDois.vira = false
            
            //vira as duas cartas
            campoCarta1?.voltar()
            campoCarta2?.voltar()
            
        }
        
        if campoCarta1 == nil {
            collectionView.reloadItems(at: [cartaVirada!])
        }
        
        //"limpa" o campo
        cartaVirada = nil
    }
    
    func confirmaFim() {
        
        var ganhou = true
        
        for carta in listaCartas {
            
            if carta.combina == false {
                ganhou = false
                break
            }
        }
       
        
        if ganhou == true {
            
            let alert = UIAlertController(title: "Parabéns!", message: "Ganhaste o jogo :)", preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "YEI!!!", style: .default, handler: nil)
            
            alert.addAction(alertAction)
            present(alert, animated: true, completion: nil)
            
        }
    }
}
   


