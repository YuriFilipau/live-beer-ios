import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct BarcodeCard: View {
    var userName: String
    @State private var context = CIContext()
    var barcodeName: String
    var body: some View {
        VStack {
            ZStack {
                Image(.berry)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 61)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .overlay(
                        .buttonYellow.opacity(0.85)
                    )
                Text ("Привет, \(userName)!")
                    .font(.system(size: 24, weight: .semibold))
                
            }
            Spacer()
            VStack {
                Image(uiImage: generateBarcode(from: "\(barcodeName)"))
                    .resizable()
                    .interpolation(.none)
                    .frame(height: 45)
                Text(barcodeName)
                    .tracking(11)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: 15))
            }.padding(.horizontal, 23)
            Spacer()
        }
        .frame(height: 166, alignment: .topLeading)
        .background(.white)
        .cornerRadius(10)
        .clipped()
    }
    
    func generateBarcode(from string: String) -> UIImage {
        let filter = CIFilter.code128BarcodeGenerator()
        
        
        guard let data = string.data(using: .ascii) else {
            return UIImage(systemName: "xmark.circle") ?? UIImage()
        }
        
        filter.message = data
        filter.quietSpace = 0
        
        if let output = filter.outputImage {
            let transformed = output.transformed(
                by: CGAffineTransform(scaleX: 50, y: 10)
            )
            
            let context = CIContext()
            if let cgImage = context.createCGImage(
                transformed,
                from: transformed.extent.insetBy(dx: 10, dy: 0)
            ) {
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview{AppView()}
