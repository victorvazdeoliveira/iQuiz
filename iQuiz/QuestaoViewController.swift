//
//  QuestaoViewController.swift
//  iQuiz
//
//  Created by Victor Vaz de Oliveira on 30/11/24.
//

import UIKit

class QuestaoViewController: UIViewController {
    @IBOutlet weak var tituloQuestaoLabel: UILabel!
    
    @IBOutlet var botoesResposta: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        configurarLayout()
    }
    
    func configurarLayout() {
        navigationItem.hidesBackButton = true
        
        for botao in botoesResposta {
            botao.layer.cornerRadius = 12
        }
    }
    
    @IBAction func respostaBotaoPressionado(_ sender: UIButton) {
        print(sender.tag)
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
