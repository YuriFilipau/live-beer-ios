import SwiftUI

struct DetailsDialog: View {
    @Binding var isActive: Bool
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("Правила накопления баллов и литров")
                        .font(.system(size: AppLayouts.s24))
                        .lineSpacing(9)
                        .lineLimit(2)
                        .padding(.bottom, AppLayouts.s14)
                    Text("1 балл = 1 рубль")
                        .font(.system(size: AppLayouts.s16, weight: .bold))
                        .padding(.bottom, AppLayouts.s6)
                    Text("Посещайте магазины сети LiveBeer и получайте процент накоплений от суммы покупки. \nОбязательно предъявите карту, до начала оплаты.")
                        .lineSpacing(9)
                }
                .padding(AppLayouts.s24)
                .frame(maxWidth: .infinity)
                .frame(height: 304)
                .background(.white)
                .cornerRadius(AppLayouts.radius)
                .clipped()
                .overlay(
                    GeometryReader { geometry in
                        Image(.details)
                            .position(
                                x: geometry.size.width + AppLayouts.s2,
                                y: 0
                            )
                    }
                )
                .padding(.horizontal, AppLayouts.s24)
                
                Spacer()
                
                LargeButton(label: "Закрыть") {
                    isActive = false
                }
                .padding(.horizontal, AppLayouts.s16)
                .padding(.bottom, AppLayouts.s16)
            }
        }
    }
}
