import SwiftUI
import CoreImage.CIFilterBuiltins

struct AccountView: View {
    private static let cardCornerRadius: CGFloat = 20
    private static let cardSize: CGSize = .init(width: 360, height: 480)
    private let viewModel = AccountViewModel()
    
    @State private var isSharing: Bool = false
    @State var developer: Developer
    @State private var nowCard = 0
    
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    HStack{
                        Spacer()
                        Text("Gitagram")
                            .font(.title)
                        Spacer()
                            .frame(width: 90)
                        Button(action: {
                            isSharing.toggle()
                        }) {
                            Image(systemName: "square.and.arrow.up")
                        }
                        Spacer()
                            .frame(width: 30)
                    }
                    Picker("", selection: $nowCard) {
                        Text("1").tag(0)
                        Text("2").tag(1)
                    }
                    .frame(width: 300)
                    .pickerStyle(.segmented)
                    
                    Spacer()
                }
                
                if nowCard == 0 {
                    AccountCardTypeOneView(developer: developer)
                } else if nowCard == 1 {
                    AccountCardTypeTwoView(developer: developer)
                }
            }
            
            Spacer()
                .frame(height: 580)
        }
        .sheet(isPresented: $isSharing, content: {
            ShareSheet(activityItems: [viewModel.captureViewAsImage()])
        })
    }
}

#Preview {
    AccountView(developer: Developer(githubId: "Rino1011"))
}

