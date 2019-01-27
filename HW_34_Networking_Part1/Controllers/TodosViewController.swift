//
//  TodosViewController.swift
//  HW_34_Networking_Part1
//
//  Created by Oleg Dynnikov on 1/27/19.
//  Copyright © 2019 Oleg Dynnikov. All rights reserved.
//

import UIKit
import Alamofire

class TodosViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    private var dataSource: [Post] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Posts"
        tableView.delegate = self
        tableView.dataSource = self

        AF.request("https://jsonplaceholder.typicode.com/todos").responseJSON { (dataResponse) in
            switch dataResponse.result {
            case .success(let value):
                guard let array = value as? [Any] else { return }
                guard let jsonArray = array as? [[String: Any]] else { return }
                var posts = [Post]()
                for item in jsonArray {
                    guard let post = Post(jsonDict: item) else { return }
                    posts.append(post)
                }
                self.dataSource = posts
                self.tableView.reloadData()
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension TodosViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        let post = dataSource[indexPath.row]
        return cell
    }
}
