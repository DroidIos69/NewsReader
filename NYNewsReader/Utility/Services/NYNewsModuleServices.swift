 
import Foundation
struct NYNewsModuleServices {
    func loadNews(completionHandler:@escaping ([NYNews]?,String?)->Void) {
        NYNetworkManager.shared.performRequest(serviceType: NYNetworkAPIS.mostPopularNews()) { (result) in
            if let response = result.value as? Data {
                do {
                    let parser = try NYNewsParser.decode(data: response)
                    if let results = parser.results {
                        completionHandler(results, nil)
                    }
                } catch _ {
                }
            }
            completionHandler(nil, result.error)
        }
    }
}
