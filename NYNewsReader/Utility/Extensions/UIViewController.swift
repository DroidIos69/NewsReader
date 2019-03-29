import Foundation
import UIKit
extension UIViewController {
   
    func setNavigationView(title: String){
        let label = UILabel()
        label.text = title
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.clear
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.sizeToFit()
        navigationItem.titleView = label
        label.textAlignment = NSTextAlignment.center
        self.navigationItem.titleView = label
    }
}
