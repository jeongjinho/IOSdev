//
//  MainVC.swift
//  seminar_8
//
//  Created by 하태경 on 2017. 6. 2..
//  Copyright © 2017년 addcampus. All rights reserved.
//

import Foundation
import UIKit

class MainVC : UIViewController,NetworkCallback,UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate{

    var movieList : [itemVO] = []
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
     func networkResult(resultData: Any, code: String) {
        
        if code == "move-1"{
        self.movieList = resultData as! [itemVO]
            
            tableView.estimatedRowHeight = 135.0
            tableView.rowHeight = UITableViewAutomaticDimension
            tableView.reloadData()
        }
       
    }
    
    func networkFailed() {
        print("에러")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        let model = MovieModel(self)
        model.getMoveView(title:gsno(searchBar.text))
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
        
        
    
    }
    
    
    override func viewDidLoad() {
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.searchBar.delegate = self;
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 44.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier:"HeaderCell") as! HeaderCell
        
        return cell.contentView

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row  = movieList[indexPath.row]
        let cell =  tableView.dequeueReusableCell(withIdentifier: "MovieCell")as! MovieCell
        
        cell.movie_img.imageFromUrl(row.image, defaultImgPath:"sopt")
        
        return cell
    }
}
