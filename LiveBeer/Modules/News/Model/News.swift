import Foundation
import SwiftUI

extension NewsView {
    struct News: Hashable{
        let title: String
        let date: String
        let type: NewsType
        let image: ImageResource
        let largeImage: ImageResource
        let description: String
    }
}
