//
//  CompletedListViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/25.
//

import UIKit

class CompletedListViewController: UIViewController {

    // MARK: - Properties
    private var todoListTable: UITableView!
    private var plusBtn: UIButton!
    private var todoList: [Task] = []

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataFromUserDefaults()
        configureUI()
        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)

    }

    // MARK: - UI
    private func configureUI() {
        view.backgroundColor = .white
        setNavigationBarItem()
        setTodoListTable()
    }

    private func setNavigationBarItem() {
        let customBackButton = UIBarButtonItem(title: "← 오은영 박사님께 가기(메인으로)", style: .plain, target: self, action: #selector(backButtonTapped))
        customBackButton.tintColor = UIColor.black
        navigationItem.leftBarButtonItem = customBackButton
        let titleAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 10)
        ]
        customBackButton.setTitleTextAttributes(titleAttributes, for: .normal)
    }

    private func setTodoListTable() {
        todoListTable = UITableView()
        todoListTable.register(TodoListCell.self, forCellReuseIdentifier: "todoListCell")
        todoListTable.delegate = self
        todoListTable.dataSource = self
        view.addSubview(todoListTable)
        todoListTable.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            todoListTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            todoListTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            todoListTable.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            todoListTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }

    // MARK: - Methods & Selectors
    private func loadDataFromUserDefaults () {
        if let savedData = UserDefaults.standard.object(forKey: "toDoListKey") as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([Task].self, from: savedData) {
                todoList = savedObject
            }
        }
    }

    private func saveDataToUserDefaults() {
        let encoder = JSONEncoder()
        if let encodedToDoTasks = try? encoder.encode(self.todoList) {
            UserDefaults.standard.set(encodedToDoTasks, forKey: "toDoListKey")
        }
    }

    @objc private func showAddTaskModal() {
        let addTaskModalVC = AddTaskModalViewController()
        addTaskModalVC.modalPresentationStyle = .pageSheet

        if let presentationController = addTaskModalVC.presentationController as? UISheetPresentationController {
            presentationController.detents = [.medium()]
        }
        self.present(addTaskModalVC, animated: true, completion: nil)
    }

    @objc private func loadList(notification: NSNotification){
        loadDataFromUserDefaults()
        todoListTable.reloadData()
    }

    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }


}

extension CompletedListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let sectionText = view as? UITableViewHeaderFooterView else { return }
        sectionText.textLabel?.font = UIFont.systemFont(ofSize: 11)

        if section == 0 {
            sectionText.textLabel?.textColor = UIColor(red: 0.80, green: 0.45, blue: 0.42, alpha: 1.00)
        } else if section == 1 {
            sectionText.textLabel?.textColor = UIColor(red: 0.85, green: 0.67, blue: 0.46, alpha: 1.00)
        } else if section == 2 {
            sectionText.textLabel?.textColor = UIColor(red: 0.56, green: 0.59, blue: 0.65, alpha: 1.00)
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CompletedListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.filter { $0.isCompleted }.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as! TodoListCell

        let completedTasks = todoList.filter { $0.isCompleted }
        cell.configure(completedTasks[indexPath.row])

        return cell
    }

}
