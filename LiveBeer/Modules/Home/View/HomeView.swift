import SwiftUI

struct HomeView: View {
    @Binding var isActive: Bool
    @Binding var activeTab: Int
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                BarcodeCard(userName: "Дмитрий", barcodeName: "1234567010356443")
                    .padding(.horizontal, 16)
                BeerRewardCard()
                    .padding(.top, 8)
                    .padding(.horizontal, 16)
                PointsRewardCard(score: "3017") {
                    isActive = true
                }
                .padding(.top, 8)
                .padding(.horizontal, 16)
                
                HStack {
                    Text("Будь в курсе")
                        .font(.system(size: 24, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 20))
                }
                .padding(.top, 24)
                .padding(.horizontal, 16)
                .onTapGesture {
                    activeTab = 1
                }
                
                ScrollView(.horizontal) {
                    HStack(spacing: 8) {
                        ForEach(viewModel.sampleData) { news in
                            NewsCard(title: news.title, date: news.date, type: news.type)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .contentMargins(.leading, 16, for: .scrollContent)
                .contentMargins(.trailing, 16, for: .scrollContent)
                .scrollIndicators(.hidden)
                .padding(.top, 16)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.bgGrey)
        }
    }
}
