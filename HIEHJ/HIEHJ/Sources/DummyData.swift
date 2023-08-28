//
//  DummyData.swift
//  HIEHJ
//
//  Created by Sanghun K. on 2023/08/28.
//

import Foundation

struct TodoList {
    static let tasks = [
        Task(description: "밥먹기", createdDate: Date(), completedDate: Date(), deadlineDate: Date(), isCompleted: false, priority: "High"),
        Task(description: "과자먹기", createdDate: Date(), completedDate: Date(), deadlineDate: Date(), isCompleted: false, priority: "High"),
        Task(description: "화장실 가기", createdDate: Date(), completedDate: Date(), deadlineDate: Date(), isCompleted: true, priority: "Low"),
        Task(description: "산책하기", createdDate: Date(), completedDate: Date(), deadlineDate: Date(), isCompleted: false, priority: "Medium")
    ]
}
