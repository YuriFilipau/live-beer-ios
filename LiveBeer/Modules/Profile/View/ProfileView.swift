import SwiftUI

struct ProfileView: View {
    @State private var name = "Дмитрий"
    @State private var birthday: Date? = Date.now
    @State private var phone = "+7 (999) 999-99-99"
    @State private var isDatePickerActive = false
    @State private var isOn = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(spacing: 0) {
                    ZStack(alignment: .topLeading) {
                        Image(.largeBerry)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: geometry.size.width)
                            .frame(height: 250)
                            .clipped()
                            .edgesIgnoringSafeArea(.top)
                        
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Профиль")
                                .font(.system(size: 36, weight: .semibold))
                                .foregroundColor(.black)
                                .padding(.top, 24)
                                .padding(.horizontal, 24)
                            ScrollView {
                                VStack(alignment: .leading, spacing: 8, ) {
                                    InputField(
                                        title: "Ваше имя",
                                        placeholder: "Введите ваше имя",
                                        text: $name,
                                        isEnabled: true
                                    )
                                    
                                    DatePickerInputField(
                                        title: "Дата рождения",
                                        placeholder: "Выберите дату",
                                        date: $birthday,
                                        isDatePickerActive: $isDatePickerActive
                                    )
                                    
                                    InputField(
                                        title: "Номер телефона",
                                        placeholder: "+7 (999) 999-99-99",
                                        text: $phone,
                                        keyboardType: .phonePad,
                                        isEnabled: false,
                                    )
                                    
                                    Text("Если вы хотите изменить номер телефона, то обратитесь в нашу [тех.поддержку](https://example.com)")
                                        .foregroundColor(.gray)
                                        .tint(.blue)
                                        .font(.system(size: 14))
                                        .lineLimit(2)
                                        .padding(.bottom, 24)
                                    VStack {
                                        Rectangle()
                                            .foregroundColor(.enabledBorder)
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 8)
                                            .padding(.bottom, 24)
                                        HStack {
                                            Text("Смс-уведомления")
                                            Toggle(isOn: $isOn) {
                                                EmptyView()
                                            }
                                            .tint(.blue)
                                        }
                                        Divider()
                                            .frame(height: 1)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.enabledBorder)
                                            .padding(.bottom, 8)
                                        HStack {
                                            Text("Выйти из аккаунта")
                                            Spacer()
                                            Image(.logOut)
                                                .frame(width: 24, height: 24)
                                                .padding(.trailing, 10)
                                        }
                                        Divider()
                                            .frame(height: 1)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(.enabledBorder)
                                    }
                                }
                                .padding(.top, 16)
                                .padding(.horizontal, 24)
                                
                            }
                            Spacer()
                            VStack (spacing: 8) {
                                LargeButton(label: "Сохранить") {
                                    print("fdsdf")
                                }
                                Text("Версия приложения 1.0.7")
                                    .font(.system(size: 14))
                                    .foregroundColor(.gray)
                            }
                            .padding(.horizontal, 24)
                            .padding(.bottom, 28)
                        }
                    }
                }
                .blur(radius: isDatePickerActive ? 15 : 0)
                .animation(.easeInOut(duration: 0.1), value: isDatePickerActive)
                .allowsHitTesting(!isDatePickerActive)
                
                if isDatePickerActive {
                    Color.black.opacity(0.6)
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.3), value: isDatePickerActive)
                }
            }
        }
    }
}
