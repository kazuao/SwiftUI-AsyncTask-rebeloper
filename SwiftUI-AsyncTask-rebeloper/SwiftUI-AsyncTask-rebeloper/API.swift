//
//  API.swift
//  SwiftUI-AsyncTask-rebeloper
//
//  Created by kazunori.aoki on 2021/11/05.
//

import Foundation

struct API {
    static func fetchNumbers(count: Int, in range: ClosedRange<Int>) async throws -> [Int] {
        try await withCheckedContinuation({ continuation in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                var numbers = [Int]()
                for _ in 0..<count {
                    let number = Int.random(in: range)
                    numbers.append(number)
                }
                continuation.resume(returning: numbers)
            }
        })
    }
}
