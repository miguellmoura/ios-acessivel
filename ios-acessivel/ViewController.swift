import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var somaButton: UIButton!
    
    @IBOutlet weak var resultadoLabel: UILabel!
    
    @IBOutlet weak var num1TextField: UITextField!
    
    @IBOutlet weak var num2TextField: UITextField!
    
    @IBOutlet weak var somaLabel: UILabel!
    
    @IBAction func somaButton(_ sender: UIButton) {
        
        num1TextField.delegate = self
        
        num1TextField.endEditing(true)
        num2TextField.endEditing(true)
        
        resultadoLabel.isHidden = false
        
        resultadoLabel.font = .boldSystemFont(ofSize: 24)
        
        resultadoLabel.textColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .systemYellow : .orange
        }
        
        let texto1 = num1TextField.text ?? ""
        let texto2 = num2TextField.text ?? ""
        
        if let numero1 = Double(texto1), let numero2 = Double(texto2) {
            let resultado = numero1 + numero2
            resultadoLabel.text = "Resultado: \(resultado)"
            resultadoLabel.accessibilityValue = "\(resultado)"
        } else {
            resultadoLabel.text = "Digite números válidos!"
        }
    }
    
    override func viewDidLoad() {
        
        view.backgroundColor = .systemBackground
        
        somaLabel.accessibilityLabel = "Olá! Esse é um app para realizar a soma de dois números! Digite os dois números no campo de texto e aperte no botão para ver o resultado!"
        
        resultadoLabel.isHidden = true
        
        somaLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        somaLabel.adjustsFontForContentSizeCategory = true
        
        somaLabel.textColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .systemYellow : .orange
        }
        
        somaButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        somaButton.titleLabel?.adjustsFontForContentSizeCategory = true
        
        somaButton.backgroundColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .systemYellow : .orange
        }
        
        somaButton.titleLabel?.textColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .black : .orange
        }
        
        somaButton.tintColor = UIColor { trait in
            trait.userInterfaceStyle == .dark ? .black : .white
        }
        
        num1TextField.layer.cornerRadius = 30
        num2TextField.layer.cornerRadius = 30
        
        num1TextField.attributedPlaceholder = NSAttributedString(
            string : "Número 1",
            attributes: [.foregroundColor: UIColor { trait in
                trait.userInterfaceStyle == .dark ? .yellow : .orange
            }]
        )
        
        num2TextField.attributedPlaceholder = NSAttributedString(
            string : "Número 2",
            attributes: [.foregroundColor: UIColor { trait in
                trait.userInterfaceStyle == .dark ? .yellow : .orange
            }]
        )
        
        somaButton.setTitle("Calcular resultado", for: .normal)
        
        
        super.viewDidLoad()
        resultadoLabel.font = UIFont.preferredFont(forTextStyle: .body)
        resultadoLabel.adjustsFontForContentSizeCategory = true
        
        somaButton.accessibilityTraits = .button
        somaButton.layer.cornerRadius = 5
        
        num1TextField.accessibilityTraits = .keyboardKey
        num2TextField.accessibilityTraits = .keyboardKey
        
        num1TextField.accessibilityHint = "Digite o primeiro número para somar"
        
        num2TextField.accessibilityHint = "Digite o segundo número para somar"
        
        somaButton.accessibilityLabel = "Botão de somar"
        
        somaButton.accessibilityHint = "Toque para calcular a soma dos dois números"
        
        resultadoLabel.accessibilityLabel = "Resultado da soma"
        
        view.accessibilityElements = [num1TextField!, num2TextField!, somaButton!, resultadoLabel!]
        
    }
}
