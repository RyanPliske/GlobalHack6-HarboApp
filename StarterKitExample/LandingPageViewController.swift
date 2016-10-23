import UIKit

class LandingPageViewController: UITabBarController {

    var model: AddUserModel!
    
    @IBOutlet weak var landingPageTabBar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        landingPageTabBar.items![2].image = UIImage.imageFromSystemBarButton(.Add)
        let darkGreenColor = UIColor(red: 17/255, green: 94/255, blue: 3/255, alpha: 1.0)
        landingPageTabBar.tintColor = darkGreenColor
    }
}
