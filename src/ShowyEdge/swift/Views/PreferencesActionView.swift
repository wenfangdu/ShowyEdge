import SwiftUI

struct PreferencesActionView: View {
  var body: some View {
    VStack(alignment: .leading, spacing: 25.0) {
      GroupBox(label: Text("Action")) {
        VStack(alignment: .leading, spacing: 16) {
          HStack {
            Button(action: {
              Relauncher.relaunch()
            }) {
              Label("Restart ShowyEdge", systemImage: "arrow.clockwise")
            }

            Spacer()
          }

          HStack {
            Button(action: {
              NSApplication.shared.terminate(self)
            }) {
              Label("Quit ShowyEdge", systemImage: "xmark.circle.fill")
            }

            Spacer()
          }
        }.padding()
      }

      Spacer()
    }.padding()
  }
}

struct PreferencesActionView_Previews: PreviewProvider {
  static var previews: some View {
    PreferencesActionView()
      .previewLayout(.sizeThatFits)
  }
}
