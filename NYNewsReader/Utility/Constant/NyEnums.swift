 
 
import Foundation
 
enum NYNetworkEnvironment:String {
    case development
    case stagingQA
    case production
}
 
enum NYHTTPErrorCodes:Int {
    case SuccessCodeMin = 200
    case SuccessCodeMax = 299
}
 
enum NYHTTPMethod: String {
    case get     = "GET"
    case post    = "POST"
    case put     = "PUT"
    case delete  = "DELETE"
 }
 
public enum NYResult<Value> {
    
    case success(Value)
    case failure(String)
    
    public var value: Value? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
    
    public var error: String? {
        switch self {
        case .success:
            return nil
        case .failure(let error):
            return error
        }
    }
}
