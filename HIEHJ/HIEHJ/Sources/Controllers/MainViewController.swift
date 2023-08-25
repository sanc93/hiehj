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

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        mainImage = UIImageView()
        mainImage.load(url: URL(string: "https://postfiles.pstatic.net/MjAyMTA4MDFfMjI2/MDAxNjI3ODI5MDA3MTYy.PWggNrdrSWN0qXiDSF42AGJyZebylWfZysEWx8VP510g.aBK-TzmRmMYss3eVNsShel271kS0O2CVaJ8YY5B_wtEg.JPEG.chamji33/%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpg?type=w773")!)

        view.addSubview(mainImage)

        mainImage.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainImage.widthAnchor.constraint(equalToConstant: 200),
            mainImage.heightAnchor.constraint(equalToConstant: 200),

        ])
    }



}
