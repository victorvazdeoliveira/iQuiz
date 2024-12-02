//
//  ViewController.swift
//  iQuiz
//
//  Created by Victor Vaz de Oliveira on 29/11/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var botaoIniciarQuiz: UIButton!
    
    func corHexadecimal(hex: String) -> UIColor {
        var hexSanitizado = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitizado = hexSanitizado.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitizado).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }

    func configuraLayout() {
        botaoIniciarQuiz.layer.cornerRadius = 12
        botaoIniciarQuiz.backgroundColor = corHexadecimal(hex: "#7432FF")
    }
    
    @IBAction func botaoPressionado(_ sender: Any) {
        print("O botão foi pressionado!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuraLayout()
    }
}

