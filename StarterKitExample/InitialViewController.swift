import UIKit

class InitialViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor.magentaColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.view.backgroundColor = UIColor.magentaColor()
    }
    
}