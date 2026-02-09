import SwiftUI

struct DetailsDialog: View {
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Правила накопления баллов и литров")
                        .font(.system(size: 24))
                        .lineSpacing(9)
                        .lineLimit(2)
                        .padding(.bottom, 14)
                    Text("1 балл = 1 рубль")
                        .font(.system(size: 16, weight: .bold))
                        .padding(.bottom, 6)
                    Text("Посещайте магазины сети LiveBeer и получайте процент накоплений от суммы покупки. \nОбязательно предъявите карту, до начала оплаты.")
                        .lineSpacing(9)
                }
                .padding(24)
                .frame(maxWidth: .infinity)
                .frame(height: 304)
                .background(.white)
                .cornerRadius(10)
                .clipped()
                .overlay(
                    GeometryReader { geometry in
                        Image(.details)
                            .position(
                                x: geometry.size.width + 2,
                                y: 0
                            )
                    }
                )
                .padding(.horizontal, 24)
                
                Spacer()
                
                LargeButton(label: "Закрыть") {
                    isActive = false
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}
