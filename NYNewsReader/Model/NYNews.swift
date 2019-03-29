 
import Foundation
struct NYNewsParser:Codable {
    var results : [NYNews]?
    enum CodingKeys: String,CodingKey {
        case results = "results"
     }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let results = try container.decodeIfPresent([NYNews].self, forKey: .results) {
            self.results = results
        }
    }
}

struct NYNews:Codable {
    
    var byline : String?
    var title : String?
    var publishedDate : String?
    var source : String?
    var details : String?
    var media : [Media]?
    var id : Int?
    var views : Int?

    enum CodingKeys: String,CodingKey {
        case byline = "byline"
        case title = "title"
        case publishedDate = "published_date"
        case source = "source"
        case details = "abstract"
        case media = "media"
        case id = "id"
        case views = "views"
    }
    init(){
        
    }
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let byline = try container.decodeIfPresent(String.self, forKey: .byline) {
            self.byline = byline
        }
        
        if let title = try container.decodeIfPresent(String.self, forKey: .title) {
            self.title = title
        }
        
        if let publishedDate = try container.decodeIfPresent(String.self, forKey: .publishedDate) {
            self.publishedDate = publishedDate
        }
        
        if let source = try container.decodeIfPresent(String.self, forKey: .source) {
            self.source = source
        }
        
        if let details = try container.decodeIfPresent(String.self, forKey: .details) {
            self.details = details
        }
        
        if let media = try container.decodeIfPresent([Media].self, forKey: .media) {
            self.media = media
        }
        
        if let id = try container.decodeIfPresent(Int.self, forKey: .id) {
            self.id = id
        }
        
        if let views = try container.decodeIfPresent(Int.self, forKey: .views) {
            self.views = views
        }
    }
    var getThumbImage:String {
        if media?.count ?? 0 > 0 {
            if let url = media?[0].thumbImage {
                return url
            }
        }
        return ""
    }
    var getBigImage:String {
        if media?.count ?? 0 > 0 {
            if let url = media?[0].bigImage {
                return url
            }
            return self.getThumbImage
        }
        return ""
    }
}

struct Media:Codable {
    
    var metaData:[MetaData]?
    
    enum CodingKeys: String,CodingKey {
        case metaData = "media-metadata"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        if let metaData = try container.decodeIfPresent([MetaData].self, forKey: .metaData) {
            self.metaData = metaData
        }
    }
    var thumbImage :String {
        if metaData?.count ?? 0 > 0 {
            if let url = metaData?[0].url {
                return url
            }
        }
        return ""
    }
    var bigImage :String? {
        if metaData?.count ?? 2 > 0 {
            if let url = metaData?[2].url {
                return url
            }
        }
        return nil
    }
}
struct MetaData:Codable {
    var url : String?
    var format : String?
    var height : Int?
    var width : Int?
    enum CodingKeys: String,CodingKey {
        case url = "url"
        case format = "format"
        case height = "height"
        case width = "width"
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        if let url = try container.decodeIfPresent(String.self, forKey: .url) {
            self.url = url
        }
        
        if let format = try container.decodeIfPresent(String.self, forKey: .format) {
            self.format = format
        }
        
        if let height = try container.decodeIfPresent(Int.self, forKey: .height) {
            self.height = height
        }
        
        if let width = try container.decodeIfPresent(Int.self, forKey: .width) {
            self.width = width
        }
        
    }
}

