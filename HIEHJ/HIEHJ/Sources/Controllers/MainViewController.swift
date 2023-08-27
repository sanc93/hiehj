//
//  MainViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/25.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - Properties
    private var mainImage: UIImageView!
    private var todoListBtn: UIButton!
    private var completedListBtn: UIButton!

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        mainImage = UIImageView()
        mainImage.load(url: URL(string: "https://postfiles.pstatic.net/MjAyMTA4MDFfMjI2/MDAxNjI3ODI5MDA3MTYy.PWggNrdrSWN0qXiDSF42AGJyZebylWfZysEWx8VP510g.aBK-TzmRmMYss3eVNsShel271kS0O2CVaJ8YY5B_wtEg.JPEG.chamji33/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpg?type=w773")!)

        todoListBtn = UIButton(type: .system)
        todoListBtn.setTitle("해야할 일", for: .normal)
        todoListBtn.addTarget(self, action: #selector(moveToTodoListVC), for: .touchUpInside)


        completedListBtn = UIButton(type: .system)
        completedListBtn.setTitle("처리한 일", for: .normal)
        completedListBtn.addTarget(self, action: #selector(moveToCompletedListVC), for: .touchUpInside)


        view.addSubview(mainImage)
        view.addSubview(todoListBtn)
        view.addSubview(completedListBtn)

        mainImage.translatesAutoresizingMaskIntoConstraints = false
        todoListBtn.translatesAutoresizingMaskIntoConstraints = false
        completedListBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 200),
            mainImage.heightAnchor.constraint(equalToConstant: 200),

            todoListBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoListBtn.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: 20),

            completedListBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedListBtn.topAnchor.constraint(equalTo: todoListBtn.bottomAnchor, constant: 20)
        ])
    }

    // MARK: - Methods
    @objc func moveToTodoListVC() {
        let todoListVC = TodoListViewController()
        navigationController?.pushViewController(todoListVC, animated: true)
    }


    @objc func moveToCompletedListVC() {
        let completedListVC = CompletedListViewController()
        navigationController?.pushViewController(completedListVC, animated: true)
    }



}
