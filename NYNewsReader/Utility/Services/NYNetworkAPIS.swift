 

import Foundation
enum  NYNetworkAPIS {
    
    fileprivate var networkEnvironment:NYNetworkEnvironment {
        return .development
    }
    
    fileprivate var baseURL:String {
        switch  networkEnvironment {
        case .development:
            return "https://api.nytimes.com/svc/"
        case .stagingQA:
            return ""
        default:
            return ""
        }
    }
    case mostPopularNews()
}

let apiKey = "lCchGtsbsytJE0j9aIpTXpjy3N5bvZtx"
extension NYNetworkAPIS {
    
    var path :String {
        var servicePath = ""
        switch self  {
        case  .mostPopularNews:
            servicePath = "mostpopular/v2/viewed/7.json?api-key=\(apiKey)"
        }
        return baseURL + servicePath
    }
    
    var method: NYHTTPMethod {
         return .get
    }
}
