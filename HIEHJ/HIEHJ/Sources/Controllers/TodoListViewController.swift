//
//  TodoListViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/25.
//

import UIKit

class TodoListViewController: UIViewController {

    // MARK: - Properties
    var todoListTableView: UITableView!


    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        //        setupTableView()

    }

    // MARK: - Table View Setup
    //    private func setupTableView() {
    //        todoListTableView = UITableView(frame: view.bounds, style: .plain)
    //        todoListTableView.delegate = self
    //        todoListTableView.dataSource = self
    //        view.addSubview(todoListTableView)
    //        todoListTableView.reloadData()
    //    }

}

// extension TodoListViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
// }
//
// extension TodoListViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
//        cell.textLabel?.text = "Todo Item"
//        return cell
//    }
// }
