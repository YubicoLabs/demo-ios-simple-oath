import Foundation

class CredentialsProvider: ObservableObject {
    
    @Published var credentials = Credential.previewCredentials()

    func refresh() {
        credentials = Credential.previewCredentials()
    }
    
    func delete(credential: Credential) {
        credentials.removeAll { $0.id == credential.id }
    }
    
    func add(credential: Credential) {
        credentials.append(credential)
    }
}


extension CredentialsProvider {
    static func previewCredentialsProvider() -> CredentialsProvider {
        let provider = CredentialsProvider()
        provider.credentials = Credential.previewCredentials()
        return provider
    }
}
