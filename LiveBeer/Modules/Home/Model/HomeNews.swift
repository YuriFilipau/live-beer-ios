import Foundation
import SwiftUI

extension HomeView {
    struct HomeNews: Identifiable{
        let id = UUID()
        let title: String
        let date: String
        let type: NewsType
    }
}
