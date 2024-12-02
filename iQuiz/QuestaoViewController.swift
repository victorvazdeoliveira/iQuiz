//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Victor Vaz de Oliveira on 30/11/24.
//

import UIKit

class QuestaoViewController: UIViewController {
    // MARK: Propriedades
    var pontuação = 0
    var numeroQuestao = 0
    
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    @IBOutlet var botoesResposta: [UIButton]!
    
    // MARK: View
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configurarLayout()
        configurarQuestao()
    }
    
    // MARK: Configuração de Layout
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        
        tituloQuestaoLabel.numberOfLines = 0
        tituloQuestaoLabel.textAlignment = .center
        
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12
        }
    }
    
    // MARK: Funções
    @objc func configurarQuestao() {
        tituloQuestaoLabel.text = questoes[numeroQuestao].titulo
        
        for botao in botoesResposta {
            let tituloBotao = questoes[numeroQuestao].respostas[botao.tag]
            
            botao.setTitle(tituloBotao, for: .normal)
            botao.backgroundColor = UIColor(red: 116/255, green: 50/255, blue: 255/255, alpha: 1)
        }
        
    }
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        let usuarioAcertouResposta =  questoes[numeroQuestao].respostaCorreta == sender.tag
        
//        pontuação += usuarioAcertouResposta ? 1 : 0
        if usuarioAcertouResposta {
            pontuação += 1
            sender.backgroundColor = UIColor(red: 11/255, green: 161/255, blue: 53/255, alpha: 1)
        } else {
            sender.backgroundColor = UIColor(red: 211/255, green: 17/255, blue: 17/255, alpha: 1)
        }
        
//        numeroQuestao = numeroQuestao < questoes.count - 1 ? numeroQuestao + 1 : 0
//        configurarQuestao()
        if numeroQuestao < questoes.count - 1 {
            numeroQuestao += 1
            
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(configurarQuestao), userInfo: nil, repeats: false)
        }
        
        print(usuarioAcertouResposta ? "Usuário acertou a resposta, a pontuação é de: \(pontuação)" : "Usuário errou a resposta, a pontuação é de: \(pontuação)")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
