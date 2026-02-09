import Foundation
import SwiftUI

struct DatePickerTextField: UIViewRepresentable {
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter
    }()
    
    public var title: String
    public var placeholder: String
    @Binding public var date: Date?
    @Binding public var isDatePickerVisible: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        
        
        datePicker.locale = Locale(identifier: "ru_RU")
        
        datePicker.calendar = Calendar(identifier: .gregorian)
        
        datePicker.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        datePicker.addTarget(
            context.coordinator,
            action: #selector(Coordinator.dateValueChanged(_:)),
            for: .valueChanged
        )
        
        textField.placeholder = self.placeholder
        textField.font = UIFont.systemFont(ofSize: AppLayouts.s17)
        textField.textColor = UIColor.black
        textField.backgroundColor = UIColor.white
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: AppLayouts.s16, height: textField.frame.height))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        
        textField.layer.cornerRadius = 8
        textField.layer.masksToBounds = true
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.enabledBorder.cgColor
        
        textField.inputView = datePicker
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.barTintColor = .white
        toolbar.backgroundColor = .white
        
        toolbar.layer.cornerRadius = AppLayouts.radius
        toolbar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        toolbar.layer.masksToBounds = true
        
        let cancelButton = UIBarButtonItem(
            title: "Отмена",
            style: .done,
            target: context.coordinator,
            action: #selector(Coordinator.cancelButtonAction)
        )
        cancelButton.tintColor = .systemBlue
        
        let flexibleSpace = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        let titleLabel = UILabel()
        titleLabel.text = "Выберите дату"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: AppLayouts.s16, weight: .medium)
        titleLabel.sizeToFit()
        let titleButton = UIBarButtonItem(customView: titleLabel)
        
        let doneButton = UIBarButtonItem(
            title: "Готово",
            style: .done,
            target: context.coordinator,
            action: #selector(Coordinator.doneButtonAction)
        )
        doneButton.tintColor = .systemBlue
        
        toolbar.setItems([cancelButton, flexibleSpace, titleButton, flexibleSpace, doneButton], animated: true)
        
        textField.inputAccessoryView = toolbar
        
        textField.delegate = context.coordinator
        
        context.coordinator.textField = textField
        context.coordinator.datePicker = datePicker
        context.coordinator.dateFormatter = dateFormatter
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        if let selectedDate = self.date {
            uiView.text = self.dateFormatter.string(from: selectedDate)
        } else {
            uiView.text = nil
        }
        
        if let datePicker = context.coordinator.datePicker,
           let selectedDate = self.date {
            datePicker.date = selectedDate
        }
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        var parent: DatePickerTextField
        var textField: UITextField?
        var datePicker: UIDatePicker?
        var dateFormatter: DateFormatter?
        
        init(_ parent: DatePickerTextField) {
            self.parent = parent
        }
        
        @objc func dateValueChanged(_ sender: UIDatePicker) {
            parent.date = sender.date
            textField?.text = dateFormatter?.string(from: sender.date)
        }
        
        @objc func doneButtonAction() {
            if let picker = datePicker {
                parent.date = picker.date
                textField?.text = dateFormatter?.string(from: picker.date)
            }
            textField?.resignFirstResponder()
            parent.isDatePickerVisible = false
        }
        
        @objc func cancelButtonAction() {
            textField?.resignFirstResponder()
            parent.isDatePickerVisible = false
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isDatePickerVisible = true
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isDatePickerVisible = false
        }
    }
}

struct DatePickerInputField: View {
    let title: String
    let placeholder: String
    @Binding var date: Date?
    @Binding var isDatePickerActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: AppLayouts.s8) {
            Text(title)
                .font(.system(size: AppLayouts.s14))
                .foregroundColor(.gray)
            
            DatePickerTextField(
                title: title,
                placeholder: placeholder,
                date: $date,
                isDatePickerVisible: $isDatePickerActive
            )
            .frame(height: 50)
        }
        .frame(maxWidth: .infinity)
    }
}
