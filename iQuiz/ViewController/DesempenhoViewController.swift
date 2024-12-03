//
//  DesempenhoViewController.swift
//  iQuiz
//
//  Created by Victor Vaz de Oliveira on 03/12/24.
//

import UIKit

class DesempenhoViewController: UIViewController {
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var percentualLabel: UILabel!
    @IBOutlet weak var botaoReiniciarQuiz: UIButton!
    
    var pontuacao: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configurarLayout()
        configurarDesempenho()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        botaoReiniciarQuiz.layer.cornerRadius = 12
    }
    
    func configurarDesempenho() {
        guard let pontuacao = pontuacao else {
            return
        }
        let percentual = Int(Double(pontuacao) / Double(questoes.count) * 100)
        
        resultadoLabel.text = "Você acertou \(pontuacao) de \(questoes.count)"
        
        percentualLabel.numberOfLines = 0
        percentualLabel.textAlignment = .center
        percentualLabel.text = "Percentual final: \(percentual)%"
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
