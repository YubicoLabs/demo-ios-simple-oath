import SwiftUI

struct CredentialListView: View {
    @ObservedObject var credentialsProvider: CredentialsProvider
    
    var body: some View {
        NavigationView {
            List {
                ForEach(credentialsProvider.credentials) { credential in
                    CredentialView(credential: credential)
                }.onDelete(perform: delete)
            }
            .navigationBarTitle(Text("Accounts"))
            .navigationBarItems(leading: Button(action: { addCredential() } ) { Text("Add credential") },
                                trailing: Button(action: { credentialsProvider.refresh() } ) { Text("Refresh") }
            )
        }
    }
    
    func delete(at offsets: IndexSet) {
        let credentialsToDelete = offsets.map { credentialsProvider.credentials[$0] }
        guard let credential = credentialsToDelete.first else { return }
        credentialsProvider.delete(credential: credential)
    }
    
    func addCredential() {
        let randomNumber = arc4random() % 100
        let credential = Credential(issuer: "Yubico", accountName: "john.doe.\(randomNumber)@yubico.com", otp: nil)
        credentialsProvider.add(credential: credential)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let credentialsProvider = CredentialsProvider()
        credentialsProvider.credentials = Credential.previewCredentials()
        return CredentialListView(credentialsProvider: credentialsProvider)
    }
}
