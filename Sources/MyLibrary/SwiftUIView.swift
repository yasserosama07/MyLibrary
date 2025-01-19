//
//  SwiftUIView.swift
//  MyLibrary
//
//  Created by Yasser Osama on 10/29/24.
//

import SwiftUI
import Lottie
import FirebaseCrashlytics

public struct SwiftUIView: View {
    
    var viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text(viewModel.title)
            .padding()
            .background(viewModel.color)
            .foregroundColor(.white)
            .cornerRadius(10)
        Image(systemName: "person.2.circle.fill")
            .font(.largeTitle)
            .foregroundStyle(.red)
        LottieView(animation: .named("StarAnimation"))
            .frame(width: 200, height: 200)
            .background(.red)
            .clipShape(Circle())
        HStack {
            Button("Button") {
                someFunction()
            }
            Button("Fatal error") {
                fatalError("Test crash")
            }
            Button("Log error") {
                logError(NSError(domain: "Test", code: 1, userInfo: nil))
            }
        }
    }
    
    func someFunction() {
        let x: Int? = nil
        print(x!)
    }
    
    public func logError(_ error: Error) {
        Crashlytics.crashlytics().record(error: error)
    }

    public func logMessage(_ message: String) {
        Crashlytics.crashlytics().log(message)
    }
}

@Observable
public class ViewModel {
    public var title: String = ""
    public var color: Color = .blue
    
    public init(title: String, color: Color = .blue) {
        self.title = title
        self.color = color
    }
}

#Preview {
    SwiftUIView(viewModel: ViewModel(title: "Hello SwiftUI"))
}
