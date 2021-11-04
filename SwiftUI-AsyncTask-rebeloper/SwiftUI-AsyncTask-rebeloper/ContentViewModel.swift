//
//  ContentViewModel.swift
//  SwiftUI-AsyncTask-rebeloper
//
//  Created by kazunori.aoki on 2021/11/05.
//

import SwiftUI

class ContentViewModel: ObservableObject {

    func fetch() async throws {
        let firstNumbers = try await API.fetchNumbers(count: 10, in: 0...9)
//        print(firstNumbers)

        let secondNumbers: [[Int]] = try await withThrowingTaskGroup(of: [Int].self, body: { group in
            var returnSecondNumbers = [[Int]]()

            firstNumbers.forEach { firstNumber in
                group.addTask {
                    return try await API.fetchNumbers(count: firstNumber, in: 10...99)
                }
            }

            for try await secondNumbers in group {
                returnSecondNumbers.append(secondNumbers)
            }

            return returnSecondNumbers
        })

        for i in 0..<firstNumbers.count {
            print("\(i + 1). \(firstNumbers[i]) - \(secondNumbers[i])")
        }
    }
}
