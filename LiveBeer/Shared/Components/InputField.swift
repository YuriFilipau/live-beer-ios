import SwiftUI
import Foundation

struct TextField: UIViewRepresentable {
    public var placeholder: String
    @Binding public var text: String
    public var keyboardType: UIKeyboardType = .default
    public var isEnabled: Bool = true
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        
        textField.placeholder = self.placeholder
        textField.font = UIFont.systemFont(ofSize: AppLayouts.s17)
        textField.textColor = isEnabled ? UIColor.black : UIColor.enabledBorder
        textField.backgroundColor = isEnabled ? UIColor.white : UIColor.enabledBorder
        textField.keyboardType = keyboardType
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .sentences
        textField.returnKeyType = .done
        textField.isEnabled = isEnabled
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: AppLayouts.s16, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.layer.cornerRadius = AppLayouts.s8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = isEnabled ? UIColor.enabledBorder.cgColor : UIColor.clear.cgColor
        
        textField.delegate = context.coordinator
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if uiView.text != self.text {
            uiView.text = self.text
        }
        
        uiView.keyboardType = keyboardType
        uiView.isEnabled = isEnabled
        
        uiView.textColor = UIColor.black
        uiView.backgroundColor = isEnabled ? UIColor.white : UIColor.enabledBorder
        uiView.layer.borderColor = isEnabled ? UIColor.enabledBorder.cgColor : UIColor.clear.cgColor
        
        if uiView.placeholder != self.placeholder {
            uiView.placeholder = self.placeholder
        }
        
        context.coordinator.parent = self
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: TextField
        
        init(_ parent: TextField) {
            self.parent = parent
        }
        
        func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
            guard parent.isEnabled else {
                return false
            }
            
            return true
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            if parent.isEnabled {
                DispatchQueue.main.async {
                    self.parent.text = textField.text ?? ""
                }
            }
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            guard parent.isEnabled else {
                textField.resignFirstResponder()
                return
            }
        }
    }
}

struct InputField: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    var keyboardType: UIKeyboardType = .default
    var isEnabled: Bool = true
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppLayouts.s8) {
            Text(title)
                .font(.system(size: AppLayouts.s14))
                .foregroundColor(.gray)
            
            TextField(
                placeholder: placeholder,
                text: $text,
                keyboardType: keyboardType,
                isEnabled: isEnabled
            )
            .frame(height: 50)
        }
        .frame(maxWidth: .infinity)
    }
}
