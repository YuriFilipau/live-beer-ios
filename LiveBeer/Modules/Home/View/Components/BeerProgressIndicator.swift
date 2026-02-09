import SwiftUI

struct BeerProgressIndicator: View {
    let filledLiters: Int
    let totalLiters: Int
    
    var body: some View {
        HStack(spacing: 8){
            ForEach(0..<totalLiters-1, id: \.self) { index in
                Image(index < filledLiters ? "ActiveBeerCup" : "BeerCup")
                    .resizable()
                    .frame(width: 24, height: 54)
            }
            
            Image(filledLiters == totalLiters ? "ActiveBeerCup" : "PrizeBeerCup")
                .resizable()
                .frame(width: filledLiters == totalLiters ? 24 : 35, height: 54)
        }
    }
}
