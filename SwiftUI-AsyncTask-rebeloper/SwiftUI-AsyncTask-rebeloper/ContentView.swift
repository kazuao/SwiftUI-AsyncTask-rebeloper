//
//  ContentView.swift
//  SwiftUI-AsyncTask-rebeloper
//
//  Created by kazunori.aoki on 2021/11/05.
//

import SwiftUI

struct ContentView: View {

    @StateObject var viewModel = ContentViewModel()

    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                Task {
                    do {
                        try await viewModel.fetch()
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
