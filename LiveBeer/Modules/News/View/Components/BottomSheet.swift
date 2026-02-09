import SwiftUI

struct BottomSheet: View {
    let title: String
    let type: NewsType
    let date: String
    let largeImage: ImageResource
    let description: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 5) {
                    Image(.back)
                        .foregroundStyle(.blue)
                    Text("Назад")
                        .font(.system(size: AppLayouts.s17))
                        .foregroundStyle(.blue)
                }
                .onTapGesture {
                    dismiss()
                }
                .padding(.vertical, AppLayouts.s32)
                
                Text(title)
                    .font(.system(size: AppLayouts.s32, weight: .semibold))
                    .lineSpacing(2)
                    .padding(.bottom, AppLayouts.s8)
                HStack(spacing: AppLayouts.s8) {
                    ZStack{
                        HStack(spacing: 3) {
                            Image(type == NewsType.news ? .mic : .discountSmall)
                            Text(type == NewsType.news ? "Новости" : "Акция")
                                .font(.system(size: AppLayouts.s12, weight: .semibold))
                        }
                    }
                    .padding(.horizontal, AppLayouts.s8)
                    .padding(.vertical, 5)
                    .background(.buttonYellow)
                    .cornerRadius(4)
                    ZStack{
                        Text(date)
                            .font(.system(size: AppLayouts.s12, weight: .semibold))
                    }
                    .padding(.horizontal, AppLayouts.s8)
                    .padding(.vertical, AppLayouts.s6)
                    .background(.buttonYellow)
                    .cornerRadius(AppLayouts.s4)
                }
                Image(largeImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxWidth: .infinity)
                    .frame(height: 196)
                    .clipped()
                    .cornerRadius(AppLayouts.radius)
                    .padding(.vertical, AppLayouts.s16)
                Text(description)
                    .font(.system(size: AppLayouts.s15))
                    .lineSpacing(5)
                Spacer()
            }
        }
        .padding(.horizontal, AppLayouts.s24)
        .scrollIndicators(.hidden)
    }
}
