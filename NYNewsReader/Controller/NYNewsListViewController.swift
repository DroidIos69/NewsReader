 
import UIKit
class NYNewsListViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var statusLabel: UILabel!
   
    var viewModel = NYNewsViewModel()
    let newsCellIdentifire = "NYNewsTableViewCell"
    
    static func loadFromNib()-> NYNewsListViewController {
        return NYNewsListViewController(nibName: "NYNewsListViewController", bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        setNavigationView(title: NYScreenText.News.title)
        newsTableView.rowHeight = UITableView.automaticDimension
        newsTableView.estimatedRowHeight = 80
        newsTableView.register(UINib(nibName: newsCellIdentifire, bundle: nil), forCellReuseIdentifier: newsCellIdentifire)
        loadNews()
        // Do any additional setup after loading the view.
    }
}
//service func
extension NYNewsListViewController {
    func loadNews() {
        activityIndicatorView.startAnimating()
        activityIndicatorView.isHidden = false
        viewModel.getMostPopularNews(completionHandler: { (isNewsLoaded) in
            DispatchQueue.main.async {
                
                self.activityIndicatorView.stopAnimating()
                self.activityIndicatorView.isHidden = true
                if isNewsLoaded {
                    self.newsTableView.reloadData()
                }
                self.statusLabel.isHidden = true
                if self.viewModel.getNewsCount() == 0 {
                    self.statusLabel.isHidden = false
                    self.statusLabel.text = NYConstant.News.noNewsFound
                }
            }
        })
    }
}
extension NYNewsListViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNewsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: newsCellIdentifire, for: indexPath) as! NYNewsTableViewCell
        let news = viewModel.getNewsAt(index: indexPath.row)
        cell.titleLabel.text = news?.title
        cell.byLineLable.text = news?.byline
        cell.publishedDateLable.text = news?.publishedDate
        cell.imgView.setCustomImage(imgURLString:news?.getThumbImage)
        cell.selectionStyle = .none
        return cell
    }
}

extension NYNewsListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let details = NYNewsDetailsViewController.loadFromNib(details: viewModel.getNewsAt(index: indexPath.row)!)
        self.navigationController?.pushViewController(details, animated: true)
    }
}
