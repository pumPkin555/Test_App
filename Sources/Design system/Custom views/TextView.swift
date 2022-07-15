//
//  TextView.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 15.07.2022.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    
    // MARK: - Typealiases
    
    typealias UIViewType = UITextView
    
    // MARK: - Public
    
    // MARK: Variables
    
    @Binding var text: String
    
    // MARK: Functions
    
    func makeUIView(context: Context) -> UITextView {
        makeTextView(context: context)
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }

    func makeCoordinator() -> Coordinator {
        Coordinator($text)
    }

}

// MARK: - Coordinator

extension TextView {
    
    class Coordinator: NSObject, UITextViewDelegate {
        var text: Binding<String>

        init(_ text: Binding<String>) {
            self.text = text
        }

        func textViewDidChange(_ textView: UITextView) {
            self.text.wrappedValue = textView.text
        }
    }
    
}

// MARK: - Private functions

private extension TextView {
    
    func makeTextView(context: Context) -> UITextView {
        let textView = UITextView()
        
        textView.font = Constants.font
        textView.isSelectable = true
        textView.isUserInteractionEnabled = true
        textView.backgroundColor = .clear
        textView.textColor = .label
        textView.textContainer.lineBreakMode = .byWordWrapping
        textView.textContainer.lineFragmentPadding = Constants.lineFragmentPadding
        textView.delegate = context.coordinator

        return textView
    }
    
}

// MARK: - Constants

private extension TextView {
    
    enum Constants {
        static let font = UIFont.systemFont(ofSize: 30)
        static let lineFragmentPadding: CGFloat = 15
    }
    
}
