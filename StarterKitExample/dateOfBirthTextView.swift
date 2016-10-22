
import UIKit

class dateOfBirthTextView: UITextView {
    
    var model: AddUserModel?
    

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        DatePickerDialog().show("Choose birthdate", defaultDate: model!.getDateOfBirth(), callback: { (date) in
            if let date = date {
                let dateText = date.returnDateAsString()
                self.text = dateText
                self.model!.setDateOfBirth(date)
            }
        })
        self.resignFirstResponder()
    }
}
