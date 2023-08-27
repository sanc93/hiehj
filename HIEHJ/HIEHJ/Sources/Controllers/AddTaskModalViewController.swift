//
//  AddTaskModalViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/27.
//

import UIKit

class AddTaskModalViewController: UIViewController {

    // MARK: - Properties

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()

    }

    private func setNavigationBar() {
        let navigationBar = UINavigationBar()
        view.addSubview(navigationBar)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        let navigationItem = UINavigationItem(title: "할일 추가")
        let cancelBtn = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelBtnTapped))
        let addBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(addBtnTapped))
        cancelBtn.tintColor = .lightGray
        addBtn.tintColor = .black
        navigationItem.leftBarButtonItem = cancelBtn
        navigationItem.rightBarButtonItem = addBtn
        navigationBar.setItems([navigationItem], animated: false)

    }
    @objc private func cancelBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func addBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }




}
