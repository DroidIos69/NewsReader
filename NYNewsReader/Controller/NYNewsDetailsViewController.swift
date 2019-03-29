 
import UIKit

class NYNewsDetailsViewController: UIViewController {
    var news:NYNews!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var byLineLable: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var publishedDateLable: UILabel!
    @IBOutlet weak var imgView: UIImageView!


    static func loadFromNib(details:NYNews)-> NYNewsDetailsViewController {
        let newsDetails = NYNewsDetailsViewController(nibName: "NYNewsDetailsViewController", bundle: nil)
        newsDetails.news = details
        return newsDetails
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationView(title: NYScreenText.News.details)
        titleLabel.text = news?.title
        byLineLable.text = news?.byline
        publishedDateLable.text = news?.publishedDate
        imgView.setCustomImage(imgURLString:news?.getBigImage)
        detailsLabel.text = news?.details
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
