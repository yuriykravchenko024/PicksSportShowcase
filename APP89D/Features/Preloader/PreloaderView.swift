import SwiftUI

struct PreloaderView: View {
    @State private var percentage: Int = 0
        @State private var scale: CGFloat = 1.0
        @State private var opacity: Double = 0.4
        
        var body: some View {
            ZStack {
                Image(.bg)
                    .scaleAspectFill()
                    .ignoresSafeArea()
                
                ZStack {
                    ForEach(1...4, id: \.self) { i in
                        let size = 140 + (20 * CGFloat(i))
                        Circle()
                            .frame(width: size, height: size)
                            .foregroundColor(.white.opacity(0.1 * CGFloat(i)))
                            .scaleEffect(scale)
                    }
                    
                    ZStack {
                        Circle()
                            .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))

                        Circle()
                            .strokeBorder(LinearGradient(colors: [Color("9C37FF"), Color("8216CD")], startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    }
                        .frame(width: 180, height: 180)
                    
                    VStack(spacing: 4) {
                        Text("\(percentage)%")
                            .font(.ADLaMDisplay(size: 60))
                            .foregroundColor(.white)
                            .shadow(color: Color("00003A"), radius: 0, x: 0, y: 3)
                        Text("LOADING...")
                            .font(.ADLaMDisplay(size: 20))
                            .foregroundColor(.white)
                            .shadow(color: Color("00003A"), radius: 0, x: 0, y: 3)
                    }
                }
            }
            .onAppear {
                let totalDuration: Double = 2.0
                let totalSteps = 100
                let interval = totalDuration / Double(totalSteps)
                
                Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { timer in
                    if percentage < 100 {
                        percentage += 1
                    } else {
                        timer.invalidate()
                    }
                }
                
                withAnimation(.easeInOut(duration: 1).repeatForever(autoreverses: true)) {
                    scale = 1.2
                    opacity = 0.8
                }
            }
        }
}

#Preview {
    PreloaderView()
}
