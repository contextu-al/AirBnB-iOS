//
//  TextFieldWithDone.swift
//  Contextual
//
//  Created by Marc Stroebel on 31/3/2023.
//  Copyright © 2023 Contextual. All rights reserved.
//

import SwiftUI

struct TextFieldWithDone: UIViewRepresentable {
    
    let placeHolder : String
    @Binding var text: String
    var keyType: UIKeyboardType
    let showToolbar = false
    
    func makeCoordinator() -> Coordinator {
        Coordinator(text: $text)
    }

    func makeUIView(context: Context) -> UITextField {
        let textfield = UITextField()
        textfield.placeholder = placeHolder
        textfield.keyboardType = keyType
        textfield.borderStyle = .roundedRect
        textfield.returnKeyType = .done
        textfield.autocorrectionType = .no
        textfield.text = text
        
        textfield.addTarget(textfield, action: #selector(textfield.doneButtonTapped(button:)), for: .editingDidEndOnExit)
        
        if showToolbar {
            let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: textfield.frame.size.width, height: 44))
            let doneButton = UIBarButtonItem(title: "Dismiss", style: .done, target: self, action: #selector(textfield.doneButtonTapped(button:)))
            let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            toolBar.items = [spacer, doneButton]
            textfield.inputAccessoryView = toolBar
        }
                
        textfield.delegate = context.coordinator
        return textfield
    }

    func updateUIView(_ view: UITextField, context: Context) {
        view.text = text
    }
}

extension TextFieldWithDone {
    class Coordinator: NSObject, UITextFieldDelegate {
        @Binding var text: String

        init(text: Binding<String>) {
            _text = text
        }

        func textFieldDidChangeSelection(_ textField: UITextField) {
            DispatchQueue.main.async {
                self.text = textField.text ?? ""
            }
        }
    }
}

extension  UITextField {
    @objc func doneButtonTapped(button:UIBarButtonItem) -> Void {
       self.resignFirstResponder()
    }
}
