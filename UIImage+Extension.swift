import UIKit

extension UIImage {
    static func imageFromSystemBarButton(systemItem: UIBarButtonSystemItem) -> UIImage {
        let tempItem = UIBarButtonItem(barButtonSystemItem: systemItem, target: nil, action: nil)
        
        // add to toolbar and render it
        UIToolbar().setItems([tempItem], animated: false)
        
        // got image from real uibutton
        let itemView = tempItem.valueForKey("view") as! UIView
        for view in itemView.subviews {
            if view.isKindOfClass(UIButton){
                let button = view as! UIButton
                return button.imageView!.image!
            }
        }
        
        return UIImage()
    }
}