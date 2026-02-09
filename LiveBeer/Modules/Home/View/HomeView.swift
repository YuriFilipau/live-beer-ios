import SwiftUI

struct HomeView: View {
    @Binding var isActive: Bool
    @Binding var activeTab: Int
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                BarcodeCard(userName: "Дмитрий", barcodeName: "1234567010356443")
                    .padding(.horizontal, AppLayouts.s16)
                BeerRewardCard()
                    .padding(.top, AppLayouts.s8)
                    .padding(.horizontal, AppLayouts.s16)
                PointsRewardCard(score: "3017") {
                    isActive = true
                }
                .padding(.top, AppLayouts.s8)
                .padding(.horizontal, AppLayouts.s16)
                
                HStack {
                    Text("Будь в курсе")
                        .font(.system(size: AppLayouts.s24, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: AppLayouts.s20))
                }
                .padding(.top, AppLayouts.s24)
                .padding(.horizontal, AppLayouts.s16)
                .onTapGesture {
                    activeTab = 1
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: AppLayouts.s8) {
                        ForEach(viewModel.sampleData) { news in
                            NewsCard(title: news.title, date: news.date, type: news.type)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.leading, AppLayouts.s16, for: .scrollContent)
                .contentMargins(.trailing, AppLayouts.s16, for: .scrollContent)
                .scrollIndicators(.hidden)
                .padding(.top, AppLayouts.s16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.bgGrey)
        }
    }
}
