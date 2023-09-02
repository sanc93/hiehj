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
    private var todoList: [Task] = []
    private var complimentMeme: UIImageView!

    private let sections: [String] = ["● 긴급", "● 중요", "● 일반"]

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
        setPlusBtn()
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

    private func setPlusBtn() {
        plusBtn = UIButton()
        plusBtn.setTitle("+", for: .normal)
        plusBtn.setTitleColor(.white, for: .normal)
        plusBtn.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        plusBtn.backgroundColor = UIColor(red: 0.27, green: 0.31, blue: 0.41, alpha: 1.00)
        plusBtn.contentVerticalAlignment = .top
        plusBtn.addTarget(self, action: #selector(showAddTaskModal), for: .touchUpInside)
        view.addSubview(plusBtn)

        plusBtn.layer.cornerRadius = 30
        plusBtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plusBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            plusBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            plusBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            plusBtn.heightAnchor.constraint(equalToConstant: 80)
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

    private func showComplimentMeme() {
        let complimentMeme = UIImageView()
        let shuffleMemes = ["compliment_1", "compliment_2", "compliment_3"]
        let randomIndex = Int.random(in: 0..<shuffleMemes.count)
        complimentMeme.image = UIImage(named: shuffleMemes[randomIndex])
        complimentMeme.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(complimentMeme)
        NSLayoutConstraint.activate([
            complimentMeme.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            complimentMeme.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            complimentMeme.widthAnchor.constraint(equalToConstant: 150),
            complimentMeme.heightAnchor.constraint(equalToConstant: 150),
        ])

        complimentMeme.alpha = 0.0

        UIView.animate(withDuration: 0.3, animations: {
            complimentMeme.alpha = 0.95
        }) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                UIView.animate(withDuration: 0.5, animations: {
                    complimentMeme.alpha = 0.0
                }, completion: { _ in
                    complimentMeme.removeFromSuperview()
                })
            }
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

extension TodoListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            if todoList.filter({ $0.priority == "High" }).isEmpty {
                return nil
            }
            return sections[section]
        } else if section == 1 {
            if todoList.filter({ $0.priority == "Medium" }).isEmpty {
                return nil
            }
            return sections[section]
        } else if section == 2 {
            if todoList.filter({ $0.priority == "Low" }).isEmpty {
                return nil
            }
            return sections[section]
        } else {
            return nil
        }
    }

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

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        var tasksInSection: [Task]
        if indexPath.section == 0 {
            tasksInSection = self.todoList.filter { $0.priority == "High" }
        } else if indexPath.section == 1 {
            tasksInSection = self.todoList.filter { $0.priority == "Medium" }
        } else if indexPath.section == 2 {
            tasksInSection = self.todoList.filter { $0.priority == "Low" }
        } else {
            tasksInSection = []
        }

        let selectedTask = tasksInSection[indexPath.row]

        if let index = todoList.firstIndex(where: { $0.taskId == selectedTask.taskId }) {
            todoList[index].isCompleted.toggle()
            if todoList[index].isCompleted {
                todoList[index].completedDate = Date()
                showComplimentMeme()
            }
            saveDataToUserDefaults()
            tableView.reloadData()
        }
    }
}

extension TodoListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return todoList.filter { $0.priority == "High" }.count
        } else if section == 1 {
            return todoList.filter { $0.priority == "Medium" }.count
        } else if section == 2 {
            return todoList.filter { $0.priority == "Low" }.count
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "todoListCell", for: indexPath) as! TodoListCell

        if indexPath.section == 0 {
            let highPriortyTasks = todoList.filter { $0.priority == "High" }
            cell.configure(highPriortyTasks[indexPath.row])
        } else if indexPath.section == 1 {
            let mediumPriortyTasks = todoList.filter { $0.priority == "Medium" }
            cell.configure(mediumPriortyTasks[indexPath.row])
        } else if indexPath.section == 2 {
            let lowPriortyTasks = todoList.filter { $0.priority == "Low" }
            cell.configure(lowPriortyTasks[indexPath.row])
        } else {
            return UITableViewCell()
        }
        return cell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: nil) { (_, _, success) in

            var tasksInSection: [Task]
            if indexPath.section == 0 {
                tasksInSection = self.todoList.filter { $0.priority == "High" }
            } else if indexPath.section == 1 {
                tasksInSection = self.todoList.filter { $0.priority == "Medium" }
            } else if indexPath.section == 2 {
                tasksInSection = self.todoList.filter { $0.priority == "Low" }
            } else {
                tasksInSection = []
            }

            let deletedTask = tasksInSection[indexPath.row]
            self.todoList.removeAll { $0.taskId == deletedTask.taskId }

            self.saveDataToUserDefaults()
            tableView.reloadData()
            success(true)

        }

        delete.backgroundColor = UIColor(red: 0.80, green: 0.45, blue: 0.42, alpha: 1.00)
        delete.image = UIImage(systemName: "trash")

        return UISwipeActionsConfiguration(actions: [delete])
    }
}
