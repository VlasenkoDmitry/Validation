import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var login: UITextField!
    
    let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func checkLogin() {
        let resultValidator = validator.validate(login: login.text ?? "")
        if resultValidator.result == true {
            showAlert(title:"Success", text: "login corresponds to the rules")
        } else {
            if let error = resultValidator.error {
                showAlert(title:"Fail", text: error.rawValue)
            }
        }
    }
    
    func checkLoginChainResponsibility() {
        let validation = ValidationChainResponsibility(text: login.text ?? "")
        let result = validation.start()
        if result.result == true {
            showAlert(title:"Success", text: "login corresponds to the rules")
        } else {
            guard let error = result.error else { return }
            showAlert(title:"Fail", text: error.rawValue)
        }
    }
    
    private func showAlert(title: String,text: String) {
        let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
        alert.view.tintColor = .red
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        login.resignFirstResponder()
//        checkLogin()
        checkLoginChainResponsibility()
        return true
    }
}
