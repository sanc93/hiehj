//
//  TodoListCell.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/27.
//

import UIKit

class TodoListCell: UITableViewCell {

    var IsCompleteOrNotBtn: UIButton!
    var descriptionLabel: UILabel!
    var createdAndCompletedDateLabel: UILabel!
    var deadlineLabel: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        IsCompleteOrNotBtn = UIButton()
        IsCompleteOrNotBtn.setTitle("미완료", for: .normal)
        IsCompleteOrNotBtn.backgroundColor = UIColor(red: 0.56, green: 0.59, blue: 0.65, alpha: 0.6)
        IsCompleteOrNotBtn.layer.cornerRadius = 10
        IsCompleteOrNotBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 8)

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

        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 15
        horizontalStackView.alignment = .center


        horizontalStackView.addArrangedSubview(IsCompleteOrNotBtn)
        horizontalStackView.addArrangedSubview(verticalStackView)


        contentView.addSubview(horizontalStackView)


        // 프레임 및 레이아웃 설정
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            IsCompleteOrNotBtn.widthAnchor.constraint(equalToConstant: 35),
            IsCompleteOrNotBtn.heightAnchor.constraint(equalToConstant: 20),
            horizontalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            horizontalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            horizontalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            horizontalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            verticalStackView.topAnchor.constraint(equalTo: horizontalStackView.topAnchor),
            verticalStackView.bottomAnchor.constraint(equalTo: horizontalStackView.bottomAnchor)
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
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        // TODO: 값 없을 시 빈값 표시하도록..
        createdAndCompletedDateLabel.text = "작성일시 : \(dateFormatter.string(from: task.createdDate)) - 완료일시 : \(dateFormatter.string(from: task.completedDate))"
        deadlineLabel.text = "마감기한 : \(dateFormatter.string(from: task.deadlineDate))"

        descriptionLabel.numberOfLines = 0
        createdAndCompletedDateLabel.numberOfLines = 0
        deadlineLabel.numberOfLines = 0

        if task.isCompleted {
            IsCompleteOrNotBtn.setTitle("완료", for: .normal)
            IsCompleteOrNotBtn.backgroundColor = UIColor(red: 0.68, green: 0.84, blue: 0.56, alpha: 1.00)
        }
    }

}
