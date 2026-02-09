import SwiftUI

struct BeerRewardCard: View {
    let filledLiters = 8
    let totalLiters = 10
    var body: some View {
        VStack {
            BeerProgressIndicator(filledLiters: filledLiters, totalLiters: totalLiters)
                .frame(maxWidth: .infinity)
            
            Spacer()
            
            HStack(spacing: AppLayouts.s16) {
                VStack(alignment: .leading) {
                    Text("\(filledLiters)/\(totalLiters)")
                        .font(.system(size: AppLayouts.s32, weight: .heavy))
                        .foregroundColor(.white)
                    Text("Накоплено литров")
                        .font(.system(size: AppLayouts.s16, weight: .semibold))
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(width: 1, height: 41)
                    .background(.white.opacity(0.1))
                
                Text("Копите литры \nи получайте пиво \nбесплатно")
                    .font(.system(size: AppLayouts.s14, weight: .regular))
                    .lineSpacing(1)
                    .foregroundColor(.white.opacity(0.7))
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .frame(height: 120, alignment: .topLeading)
        .padding(AppLayouts.s16)
        .background(.black)
        .cornerRadius(AppLayouts.radius)
        .clipped()
    }
}

#Preview{AppView()}
