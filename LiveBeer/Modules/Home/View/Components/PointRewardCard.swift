import SwiftUI

struct PointsRewardCard: View {
    var score: String
    var onTap: () -> Void
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            HStack(alignment: .center, spacing: 0) {
                VStack(alignment: .leading, spacing: AppLayouts.s4) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(score)
                            .font(.system(size: AppLayouts.s32, weight: .heavy))
                            .foregroundColor(.white)
                        
                        Text("Накоплено баллов")
                            .font(.system(size: AppLayouts.s16, weight: .semibold))
                            .foregroundColor(.white)
                            .lineLimit(1)
                    }
                    
                    Text("Собирайте баллы и получайте бонусы")
                        .font(.system(size: AppLayouts.s14))
                        .foregroundColor(Color.white.opacity(0.7))
                        .lineLimit(2)
                }
                .padding(.leading, AppLayouts.s16)
                
                Spacer()
                
                Image(.beer)
                    .resizable()
                    .frame(width: 160, height: 124)
                    .clipped()
                    .padding(.trailing, AppLayouts.s14)
            }
            .frame(height: 126)
            .background(.black)
            .cornerRadius(AppLayouts.radius)
            .clipped()
            
            Button(action: onTap) {
                Image(.details)
            }
            .offset(x: 5, y: -5)
        }
    }
}
#Preview{AppView()}
