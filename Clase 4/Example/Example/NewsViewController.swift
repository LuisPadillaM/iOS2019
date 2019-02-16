//
//  NewsViewController.swift
//  Example
//
//  Created by Luis Padilla  on 2/11/19.
//  Copyright © 2019 Cenfotec. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    let customTableIdentifier = "NewsTableViewCell"
     let addNewsViewControllerIdentifier = "AddNewsViewController"
    var currentCategory: Category = Category()

    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addRightNavigationBarButtonItem()
        registerCustomTableView()
    }
    
    func addRightNavigationBarButtonItem(){
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(displayAddNewsItem(sender:)))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc func displayAddNewsItem(sender: UIBarButtonItem){
        self.goToAddCategoryNews()
    }
    
    func removeNewsItem(index : Int?){
        if let newIndex = index  {
            self.currentCategory.news.remove(at: newIndex)
            newsTableView.reloadData()
        }
    }
    
//    @objc func goToBackView(sender: UIBarButtonItem){
//        navigationController?.popViewController(animated: true)
//    }
    
    func registerCustomTableView(){ // primero registro celda
        let nib = UINib(nibName: customTableIdentifier, bundle: nil)
        newsTableView.register(nib, forCellReuseIdentifier : self.customTableIdentifier)
    }
    
    func goToAddCategoryNews() {
        if let AddNewsController = storyboard?.instantiateViewController(withIdentifier: self.addNewsViewControllerIdentifier) as? AddNewsViewController{
            AddNewsController.delegate = self
            navigationController?.pushViewController(AddNewsController, animated: true)
        }
    }
    
    func formatDate(date : Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    @IBAction func addNewsItem(_ sender: UIButton) {
        goToAddCategoryNews();
    }

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.currentCategory.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableIdentifier) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        let categoryNews = self.currentCategory.news[indexPath.row]
        cell.newsTitle.text = categoryNews.title
        cell.newsDate.text = self.formatDate(date : categoryNews.createdAt)
        cell.delegate = self
//        cell.deleteBtn.addTarget(self, action : #selector(self.removeNewsItem), for: .touchUpInside)
        return cell
    }
    
}

extension NewsViewController : AddNewsViewControllerDelegate {
    func addNews(news: News) {
        //        dismiss(animated: true, completion: nil)
        self.currentCategory.news.append(news)
        newsTableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
}

extension NewsViewController : NewsTableViewCellDelegate {
    func btnDeleteClicked(cell: NewsTableViewCell) {
        let indexPath = self.newsTableView.indexPath(for: cell)
        self.removeNewsItem(index : indexPath?.row)
    }
    
}

