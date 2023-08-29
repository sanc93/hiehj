//
//  TodoListCell.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/27.
//

import UIKit

class TodoListCell: UITableViewCell {

    var completeOrNotBtn: UIButton!
    var descriptionLabel: UILabel!
    var createdAndCompletedDateLabel: UILabel!
    var deadlineLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        completeOrNotBtn = UIButton()
        completeOrNotBtn.setTitle("완료", for: .normal)

        descriptionLabel = UILabel()
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)

        createdAndCompletedDateLabel = UILabel()
        createdAndCompletedDateLabel.font = UIFont.systemFont(ofSize: 10)
        createdAndCompletedDateLabel.textColor = UIColor.gray

        deadlineLabel = UILabel()
        deadlineLabel.font = UIFont.systemFont(ofSize: 10)
        deadlineLabel.textColor = UIColor.gray

        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 2
        verticalStackView.alignment = .leading
        verticalStackView.distribution = .fill

        verticalStackView.addArrangedSubview(descriptionLabel)
        verticalStackView.addArrangedSubview(createdAndCompletedDateLabel)
        verticalStackView.addArrangedSubview(deadlineLabel)

        contentView.addSubview(verticalStackView)


        // 프레임 및 레이아웃 설정
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configure(_ task: Task) {
        descriptionLabel.text = task.description

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        // TODO: 값 없을 시 빈값 표시하도록..
        createdAndCompletedDateLabel.text = "작성일시 : \(dateFormatter.string(from: task.createdDate)) - 완료일시 : \(dateFormatter.string(from: task.completedDate))"
        deadlineLabel.text = "마감기한 : \(dateFormatter.string(from: task.deadlineDate))"

        descriptionLabel.numberOfLines = 0
        createdAndCompletedDateLabel.numberOfLines = 0
        deadlineLabel.numberOfLines = 0
    }

}
