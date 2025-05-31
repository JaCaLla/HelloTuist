import Kingfisher
import SwiftUI

struct ContentView: View {
    var appVersion: String {
        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "?"
        let build = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "?"
        return "Version \(version) (\(build))"
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Information")) {
                    HStack {
                        Label("App versusion", systemImage: "number")
                        Spacer()
                        Text(appVersion)
                            .foregroundColor(.secondary)
                    }
                }
                KFImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyfYoLcb2WNoStJH01TT2TLAf_JbD_FhIJng&s")!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .cornerRadius(12)
                    .shadow(radius: 5)
                    .padding()
            }
            .navigationTitle("Hello Tuist!")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
