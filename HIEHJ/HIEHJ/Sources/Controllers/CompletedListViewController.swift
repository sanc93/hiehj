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
    private var todoList: [Task] = []

    private let sections: [String] = ["● 긴급", "● 중요", "● 일반"]

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTodoListTable()
    }

    // MARK: - 테이블 뷰 설정
    func setTodoListTable() {
        // 테이블 뷰 초기화
        todoListTable = UITableView()
        // 테이블 뷰에 클래스 등록
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
}
extension CompletedListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
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

        let selectedTask = self.todoList[indexPath.row]
        if let index = todoList.firstIndex(where: { $0.taskId == selectedTask.taskId }) {
            print("전", todoList[index].isCompleted)
            todoList[index].isCompleted.toggle()
            print("후", todoList[index].isCompleted)
            print("------", todoList[index].isCompleted)
            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.todoList) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: "toDoListKey")
            }


        }
    }


    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        tableView.deselectRow(at: indexPath, animated: true)
    //
    //        var tasksInSection: [Task]
    //        if indexPath.section == 0 {
    //            tasksInSection = self.todoList.filter { $0.priority == "High" }
    //        } else if indexPath.section == 1 {
    //            tasksInSection = self.todoList.filter { $0.priority == "Medium" }
    //        } else if indexPath.section == 2 {
    //            tasksInSection = self.todoList.filter { $0.priority == "Low" }
    //        } else {
    //            tasksInSection = []
    //        }
    //        print("indexPath : ", indexPath)
    //        print("indexPath.section : ", indexPath.section)
    //        print("tasksInSection[indexPath.row] : ", tasksInSection[indexPath.row].taskId)
    //        let selectedTask = tasksInSection[indexPath.row]
    //
    //        if let index = todoList.firstIndex(where: { $0.taskId == selectedTask.taskId }) {
    //            todoList[index].isCompleted.toggle()
    //
    //            let encoder = JSONEncoder()
    //            if let encodedToDoTasks = try? encoder.encode(self.todoList) {
    //                UserDefaults.standard.set(encodedToDoTasks, forKey: "toDoListKey")
    //            }
    //
    //            tableView.reloadData()
    //        }
    //    }
}

extension CompletedListViewController: UITableViewDataSource {


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


            let encoder = JSONEncoder()
            if let encodedToDoTasks = try? encoder.encode(self.todoList) {
                UserDefaults.standard.set(encodedToDoTasks, forKey: "toDoListKey")
            }

            tableView.reloadData()
            success(true)

        }

        delete.backgroundColor = .red
        delete.image = UIImage(systemName: "trash")

        return UISwipeActionsConfiguration(actions: [delete])
    }
}
