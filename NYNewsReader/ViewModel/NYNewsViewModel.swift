 
import Foundation
class NYNewsViewModel {
    private var popularNews = [NYNews]()
    lazy var mostPapularNewsService:NYNewsModuleServices = {
        return NYNewsModuleServices()
    }()
}

extension NYNewsViewModel {
    func getMostPopularNews(completionHandler:@escaping(Bool)->Void) {
        mostPapularNewsService.loadNews { (news,error) in
            if let newsVal = news {
                self.popularNews = newsVal
                completionHandler(true)
                return
            }
            completionHandler(false)
        }
    }
}
extension NYNewsViewModel {
    func getNewsCount()-> Int {
        return popularNews.count
    }
    func getNewsAt(index:Int)->NYNews? {
        return  popularNews.count > index ? popularNews[index] : nil
    }
}
