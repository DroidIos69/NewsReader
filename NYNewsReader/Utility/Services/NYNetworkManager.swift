 

import Foundation
class NYNetworkManager {
    
    static var shared = NYNetworkManager()
    private init() {
    }
    
    func performRequest(serviceType:NYNetworkAPIS, completionHandler:@escaping CompletionHandler) {
        var request = URLRequest(url: URL(string:serviceType.path)!)
        request.httpMethod = serviceType.method.rawValue        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            let message = error?.localizedDescription ?? NYConstant.Services.processError
            if let responseVal = response as? HTTPURLResponse, let responseData = data {
                switch responseVal.statusCode {
                case NYHTTPErrorCodes.SuccessCodeMin.rawValue...NYHTTPErrorCodes.SuccessCodeMax.rawValue:
                    completionHandler(.success(responseData))
                    return
                default:
                    break
                }
            }
            completionHandler(.failure(message))
        }
        task.resume()
     }
 }
