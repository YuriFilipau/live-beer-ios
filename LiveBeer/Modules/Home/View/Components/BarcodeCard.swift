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
                    .font(.system(size: AppLayouts.s24, weight: .semibold))
                
            }
            Spacer()
            VStack {
                Image(uiImage: generateBarcode(from: "\(barcodeName)"))
                    .resizable()
                    .interpolation(.none)
                    .frame(height: 45)
                Text(barcodeName)
                    .tracking(AppLayouts.s11)
                    .frame(maxWidth: .infinity)
                    .font(.system(size: AppLayouts.s15))
            }.padding(.horizontal, 23)
            Spacer()
        }
        .frame(height: 166, alignment: .topLeading)
        .background(.white)
        .cornerRadius(AppLayouts.radius)
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
                by: CGAffineTransform(scaleX: 50, y: AppLayouts.s10)
            )
            
            let context = CIContext()
            if let cgImage = context.createCGImage(
                transformed,
                from: transformed.extent.insetBy(dx: AppLayouts.s10, dy: 0)
            ) {
                return UIImage(cgImage: cgImage)
            }
        }
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
}

#Preview{AppView()}
