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
        todoListBtn.setTitle("네..\n(해야할 일 보러가기)", for: .normal)
        todoListBtn.titleLabel?.numberOfLines = 0
        todoListBtn.setTitleColor(.white, for: .normal)
        todoListBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        todoListBtn.backgroundColor = UIColor(red: 0.27, green: 0.31, blue: 0.41, alpha: 1.00)
        todoListBtn.layer.cornerRadius = 25
        todoListBtn.addTarget(self, action: #selector(moveToTodoListVC), for: .touchUpInside)


        completedListBtn = UIButton(type: .system)
        completedListBtn.setTitle("다했는데요?\n(처리한 일 보러가기)", for: .normal)
        completedListBtn.titleLabel?.numberOfLines = 0
        completedListBtn.setTitleColor(.white, for: .normal)
        completedListBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        completedListBtn.backgroundColor = UIColor(red: 0.15, green: 0.17, blue: 0.28, alpha: 1.00)
        completedListBtn.layer.cornerRadius = 25
        completedListBtn.addTarget(self, action: #selector(moveToCompletedListVC), for: .touchUpInside)


        view.addSubview(mainImage)
        view.addSubview(todoListBtn)
        view.addSubview(completedListBtn)

        mainImage.translatesAutoresizingMaskIntoConstraints = false
        todoListBtn.translatesAutoresizingMaskIntoConstraints = false
        completedListBtn.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            mainImage.widthAnchor.constraint(equalToConstant: 200),
            mainImage.heightAnchor.constraint(equalToConstant: 200),

            todoListBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            todoListBtn.bottomAnchor.constraint(equalTo: completedListBtn.topAnchor, constant: -20),
            todoListBtn.widthAnchor.constraint(equalToConstant: 300),
            todoListBtn.heightAnchor.constraint(equalToConstant: 100),




            completedListBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            completedListBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            completedListBtn.widthAnchor.constraint(equalToConstant: 300),
            completedListBtn.heightAnchor.constraint(equalToConstant: 100),
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
