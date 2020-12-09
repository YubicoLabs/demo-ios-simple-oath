import SwiftUI

struct CredentialView: View {
    
    let credential: Credential
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(credential.otp ?? "*** ***").font(.title)
            Text("\(credential.issuer ?? "") \(credential.accountName)").font(.headline).foregroundColor(.gray)
        }.padding(10)
    }
}


struct CredentialView_Previews: PreviewProvider {
    static var previews: some View {
        CredentialView(credential:Credential.previewCredentials().randomElement()!)
    }
}
