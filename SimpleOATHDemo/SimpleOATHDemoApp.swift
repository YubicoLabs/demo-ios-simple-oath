import SwiftUI

@main
struct SimpleOATHDemoApp: App {
    var body: some Scene {
        WindowGroup {
            CredentialListView(credentialsProvider: CredentialsProvider())
        }
    }
}
