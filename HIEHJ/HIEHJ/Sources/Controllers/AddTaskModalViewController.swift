//
//  AddTaskModalViewController.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/27.
//

import UIKit

class AddTaskModalViewController: UIViewController {

    // MARK: - Properties

    private var selectedPriority: String = "Low"
    private var navigationBar = UINavigationBar()
    private var descriptionLbl: UILabel!
    private var deadlineLbl: UILabel!
    private var priorityLbl: UILabel!

    private var descriptionTxtfl: UITextField!
    private var deadlineTxtfl: UITextField!

    private var highPriorityBtn: UIButton!
    private var mediumPriorityBtn: UIButton!
    private var lowPriorityBtn: UIButton!

    private var selectedDate: Date = Date()

    var todoList: [Task] = []

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let savedData = UserDefaults.standard.object(forKey: "toDoListKey") as? Data {
            let decoder = JSONDecoder()
            if let savedObject = try? decoder.decode([Task].self, from: savedData) {
                todoList = savedObject
            }
        }
        setNavigationBar()
        setInputForm()



    }

    private func setNavigationBar() {
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
        addBtn.tintColor = UIColor(red: 0.36, green: 0.60, blue: 0.54, alpha: 1.00)
        navigationItem.leftBarButtonItem = cancelBtn
        navigationItem.rightBarButtonItem = addBtn
        navigationBar.setItems([navigationItem], animated: false)

    }
    @objc private func cancelBtnTapped() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc private func addBtnTapped() {
        // TODO: 사용자가 description 미입력시 안내문구띄우기
        let newTask = Task(
            taskId: UUID(),
            description: descriptionTxtfl.text ?? "기본값 테스트",
            createdDate: Date(),
            completedDate: Date(),
            deadlineDate: selectedDate,
            isCompleted: false,
            priority: selectedPriority
        )

        todoList.append(newTask)

        let encoder = JSONEncoder()
        if let encodedToDoTasks = try? encoder.encode(todoList) {
            UserDefaults.standard.setValue(encodedToDoTasks, forKey: "toDoListKey")
        }

        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)
        }

    }

    private func setInputForm() {

        descriptionLbl = UILabel()
        deadlineLbl = UILabel()
        priorityLbl = UILabel()

        descriptionTxtfl = UITextField()
        deadlineTxtfl = UITextField()

        highPriorityBtn = UIButton()
        mediumPriorityBtn = UIButton()
        lowPriorityBtn = UIButton()

        descriptionLbl.text = "할 일"
        descriptionLbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        descriptionLbl.textColor = UIColor(red: 0.36, green: 0.60, blue: 0.54, alpha: 1.00)

        descriptionTxtfl.placeholder = "예) 밥 먹기"
        descriptionTxtfl.backgroundColor = .systemGray6
        descriptionTxtfl.borderStyle = .none
        descriptionTxtfl.layer.cornerRadius = 15
        descriptionTxtfl.addLeftPadding()

        deadlineLbl.text = "마감기한"
        deadlineLbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        deadlineLbl.textColor = UIColor(red: 0.36, green: 0.60, blue: 0.54, alpha: 1.00)

        //        let calendarButton = UIButton(type: .system)
        //        calendarButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        //        calendarButton.tintColor = UIColor(red: 0.15, green: 0.16, blue: 0.27, alpha: 1.00)
        //        calendarButton.addTarget(self, action: #selector(calendarButtonTapped), for: .touchUpInside)






        deadlineTxtfl.placeholder = "터치하여 날짜와 시간을 입력"
        deadlineTxtfl.backgroundColor = .systemGray6
        deadlineTxtfl.borderStyle = .none
        deadlineTxtfl.layer.cornerRadius = 15
        deadlineTxtfl.addLeftPadding()
        deadlineTxtfl.addTarget(self, action: #selector(deadlineTxtflTapped), for: .editingDidBegin)


        priorityLbl.text = "우선도"
        priorityLbl.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        priorityLbl.textColor = UIColor(red: 0.36, green: 0.60, blue: 0.54, alpha: 1.00)

        highPriorityBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        highPriorityBtn.setTitle("🚴🏻‍\n긴급", for: .normal)
        highPriorityBtn.titleLabel?.numberOfLines = 0
        highPriorityBtn.titleLabel?.textAlignment = .center
        highPriorityBtn.backgroundColor = UIColor(red: 0.80, green: 0.45, blue: 0.42, alpha: 1.00)
        highPriorityBtn.alpha = 0.3
        highPriorityBtn.layer.cornerRadius = 20
        highPriorityBtn.addTarget(self, action: #selector(highPriorityBtnTapped), for: .touchUpInside)


        mediumPriorityBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        mediumPriorityBtn.setTitle("🏃🏻\n중요", for: .normal)
        mediumPriorityBtn.titleLabel?.numberOfLines = 0
        mediumPriorityBtn.titleLabel?.textAlignment = .center
        mediumPriorityBtn.backgroundColor = UIColor(red: 0.85, green: 0.67, blue: 0.46, alpha: 1.00)
        mediumPriorityBtn.alpha = 0.3
        mediumPriorityBtn.layer.cornerRadius = 20
        mediumPriorityBtn.addTarget(self, action: #selector(mediumPriorityBtnTapped), for: .touchUpInside)


        lowPriorityBtn.frame = CGRect(x: 100, y: 100, width: 50, height: 50)
        lowPriorityBtn.setTitle("🚶🏻\n일반", for: .normal)
        lowPriorityBtn.titleLabel?.numberOfLines = 0
        lowPriorityBtn.titleLabel?.textAlignment = .center
        lowPriorityBtn.backgroundColor = UIColor(red: 0.35, green: 0.39, blue: 0.48, alpha: 1.0)
        lowPriorityBtn.layer.cornerRadius = 20
        lowPriorityBtn.addTarget(self, action: #selector(lowPriorityBtnTapped), for: .touchUpInside)


        let horizontalStackView = UIStackView()
        horizontalStackView.axis = .horizontal
        horizontalStackView.spacing = 10
        horizontalStackView.alignment = .fill
        horizontalStackView.distribution = .equalSpacing

        horizontalStackView.addArrangedSubview(highPriorityBtn)
        horizontalStackView.addArrangedSubview(mediumPriorityBtn)
        horizontalStackView.addArrangedSubview(lowPriorityBtn)

        let verticalStackView = UIStackView()
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 15
        verticalStackView.alignment = .fill
        verticalStackView.distribution = .fill

        verticalStackView.addArrangedSubview(descriptionLbl)
        verticalStackView.addArrangedSubview(descriptionTxtfl)
        verticalStackView.addArrangedSubview(deadlineLbl)
        verticalStackView.addArrangedSubview(deadlineTxtfl)
        verticalStackView.addArrangedSubview(priorityLbl)
        verticalStackView.addArrangedSubview(horizontalStackView)

        view.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            highPriorityBtn.widthAnchor.constraint(equalToConstant: 100),
            highPriorityBtn.heightAnchor.constraint(equalToConstant: 100),
            mediumPriorityBtn.widthAnchor.constraint(equalToConstant: 100),
            mediumPriorityBtn.heightAnchor.constraint(equalToConstant: 100),
            lowPriorityBtn.widthAnchor.constraint(equalToConstant: 100),
            lowPriorityBtn.heightAnchor.constraint(equalToConstant: 100),
            descriptionTxtfl.heightAnchor.constraint(equalToConstant: 50),
            descriptionTxtfl.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            deadlineTxtfl.heightAnchor.constraint(equalToConstant: 50),
            deadlineTxtfl.widthAnchor.constraint(equalTo: verticalStackView.widthAnchor),
            verticalStackView.topAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: 20),
            verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])

    }

    @objc private func deadlineTxtflTapped(sender: UIDatePicker) {

        let deadlinePicker = UIDatePicker()
        deadlinePicker.preferredDatePickerStyle = .wheels
        deadlinePicker.datePickerMode = .dateAndTime
        deadlinePicker.locale = Locale(identifier: "ko-KR")
        deadlinePicker.addTarget(self, action: #selector(handleDatePicker(_:)), for: .valueChanged)
        deadlinePicker.date = selectedDate

        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = .white

        let doneImageConfig = UIImage.SymbolConfiguration(pointSize: 20, weight: .medium)
        let doneImage = UIImage(systemName: "chevron.compact.down", withConfiguration: doneImageConfig)
        let done = UIBarButtonItem(image: doneImage, style: .plain, target: self, action: #selector(doneBtnTapped))
        done.tintColor = UIColor(red: 0.36, green: 0.60, blue: 0.54, alpha: 1.00)

        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)

        toolbar.setItems([space, done, space], animated: true)

        deadlineTxtfl.inputView = deadlinePicker
        deadlineTxtfl.inputAccessoryView = toolbar
        deadlineTxtfl.becomeFirstResponder()
        deadlineTxtfl.text = dateFormat(date: deadlinePicker.date)

        deadlinePicker.translatesAutoresizingMaskIntoConstraints = false
        deadlinePicker.backgroundColor = .white
    }

    @objc private func handleDatePicker(_ sender: UIDatePicker) {
        selectedDate = sender.date
        let formattedDate = dateFormat(date: selectedDate)
        deadlineTxtfl.text = formattedDate
    }

    private func dateFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy / MM / dd   a h:mm"

        return formatter.string(from: date)
    }

    @objc private func highPriorityBtnTapped() {
        highPriorityBtn.alpha = 1.0
        mediumPriorityBtn.alpha = 0.3
        lowPriorityBtn.alpha = 0.3
        selectedPriority = "High"
        print("우선도 [긴급] 선택")
    }
    @objc private func mediumPriorityBtnTapped() {
        highPriorityBtn.alpha = 0.3
        mediumPriorityBtn.alpha = 1.0
        lowPriorityBtn.alpha = 0.3
        selectedPriority = "Medium"
        print("우선도 [중요] 선택")
    }
    @objc private func lowPriorityBtnTapped() {
        highPriorityBtn.alpha = 0.3
        mediumPriorityBtn.alpha = 0.3
        lowPriorityBtn.alpha = 1.0
        selectedPriority = "Low"
        print("우선도 [일반] 선택")
    }
    @objc private func doneBtnTapped() {
        deadlineTxtfl.resignFirstResponder()
    }

}
