import UIKit

class AddUserViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    
    
    @IBOutlet weak var dateOfBirth: UITextView!
    
//    @IBOutlet weak var dateOfBirth: UITextView!
    @IBOutlet weak var ssn: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var middleName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var takePhotoButton: UIButton!
    @IBOutlet weak var photoImageView: UIImageView!
    
    let model = AddUserModel()
    
    @IBOutlet weak var addUserTab: UITabBarItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ssn.delegate = self
        if let dob = dateOfBirth as? dateOfBirthTextView {
            dob.model = model
        }
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
            DatePickerDialog().show("Choose birthdate", defaultDate: model.getDateOfBirth(), callback: { (date) in
                if let date = date {
                    let dateText = date.returnDateAsString()
                    self.dateOfBirth.text = dateText
                    self.model.setDateOfBirth(date)
                }
                self.ssn.becomeFirstResponder()
            })
        case ssn:
            break
        default:
            break
        }
        return true
    }
    
    @IBAction func takePhotoPressed(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let imagePC = UIImagePickerController()
            imagePC.delegate = self
            imagePC.sourceType = .Camera
            imagePC.showsCameraControls = true
            imagePC.allowsEditing = false
            presentViewController(imagePC, animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Camera Needed", message: "This app requires your device to have a camera.", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        // Pull out JPEG Information
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentsPath = urls[urls.count-1].path!
        let pathToImage = documentsPath + "/" + NSUUID().UUIDString
        UIImageJPEGRepresentation(image, 1.0)?.writeToFile(pathToImage as String, atomically : true)
        photoImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
    }
}
