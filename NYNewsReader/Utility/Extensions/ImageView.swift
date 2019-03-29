 
import Foundation
import UIKit
class TempCache {
    static var shared = TempCache()
    private init(){}
    var cacheInfo = [String:UIImage]()
}
extension UIImageView {
    func setCustomImage(imgURLString: String?) {
        guard let imageURLString = imgURLString else {
             return
        }
        let temp = TempCache.shared
        if let imageVal = temp.cacheInfo[imageURLString] {
            self.image = imageVal
        } else {
            DispatchQueue.global().async {
                if imgURLString != "" {
                    if let data = try? Data(contentsOf: URL(string: imageURLString)!){
                        let imageVal = UIImage(data: data)
                        DispatchQueue.main.async {
                            if imageVal != nil {
                                temp.cacheInfo[imageURLString] = imageVal
                                self.image = UIImage(data: data)
                            }
                        }
                    }
                }
            }
        }
    }
}
