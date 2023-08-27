//
//  TodoListViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/25.
//

import UIKit

class TodoListViewController: UIViewController {

    // MARK: - Properties
    private var todoListTable: UITableView!
    private var plusBtn: UIButton!
    private let sections: [String] = ["긴급", "중요", "일반"]

    // (더미데이터)
    private var priorityHigh = ["1", "2", "3", "4", "5"]
    private var priorityMedium = ["a"]
    private var priorityLow = ["ㄱ", "ㄴ", "ㄷ"]

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setTodoListTable()
        setPlusBtn()


    }

    // MARK: - 테이블 뷰 설정
    private func setTodoListTable() {
        // 테이블 뷰 초기화
        todoListTable = UITableView()
        // 테이블 뷰에 클래스 등록
        todoListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        todoListTable.delegate = self
        todoListTable.dataSource = self
        view.addSubview(todoListTable)
        todoListTable.translatesAutoresizingMaskIntoConstraints = false
        todoListTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        todoListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        todoListTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        todoListTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }

    // MARK: - "+(플러스)" 버튼
    private func setPlusBtn() {
        plusBtn = UIButton()
        plusBtn.setTitle("+", for: .normal)
        plusBtn.setTitleColor(.white, for: .normal)
        plusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        plusBtn.backgroundColor = UIColor(red: 0.27, green: 0.31, blue: 0.41, alpha: 1.00)
        plusBtn.contentVerticalAlignment = .top
        view.addSubview(plusBtn)

        plusBtn.layer.cornerRadius = 30
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        plusBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        plusBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        plusBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        plusBtn.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }


}

extension TodoListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TodoListViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return priorityHigh.count
        } else if section == 1 {
            return priorityMedium.count
        } else if section == 2 {
            return priorityLow.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //        cell.textLabel?.text = dummyTest[indexPath.row]
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(priorityHigh[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(priorityMedium[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.textLabel?.text = "\(priorityLow[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        return cell
    }
}
