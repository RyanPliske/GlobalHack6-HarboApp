import UIKit

class AddUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    let model = AddUserModel()
    
    @IBOutlet weak var addUserTab: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ssn.delegate = self
        dateOfBirth.delegate = self
//        dateOfBirth.userInteractionEnabled = false
        lastName.delegate = self
        middleName.delegate = self
        firstName.delegate = self
    }
    
    internal func textFieldShouldReturn(textField: UITextField) -> Bool {
        switch (textField) {
        case firstName:
            model.setFirstName(textField.text!)
            middleName.becomeFirstResponder()
        case middleName:
            model.setMiddleName(textField.text!)
            lastName.becomeFirstResponder()
        case lastName:
            model.setLastName(textField.text!)
//            dateOfBirth.becomeFirstResponder()
            DatePickerDialog().show("Choose birthdate", callback: { (date) in
                let dateText = date!.returnDateAsString() //{
                    self.dateOfBirth.text = dateText
                    self.model.setDateOfBirth(dateText)
//                }
                print(date)
                self.ssn.becomeFirstResponder()
            })
        case ssn:
            break
        default:
            break
        }
        return true
    }
    
    
    @IBAction func dateOfBirthTapped(sender: AnyObject) {
        DatePickerDialog().show("Choose birthdate", callback: { (date) in
            let dateText = date!.returnDateAsString() //{
                self.dateOfBirth.text = dateText
                self.model.setDateOfBirth(dateText)
//            }
            print(date)
        })
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        switch (textField) {
        case dateOfBirth:
            return false
        default:
            return true
        }
    }
}
