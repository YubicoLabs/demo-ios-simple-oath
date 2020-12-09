import Foundation

struct Credential: Identifiable, Equatable {
    let id = UUID()
    let issuer: String?
    let accountName: String
    let otp: String?
}

extension Credential {
    static func previewCredentials() -> [Credential] {
        [Credential(issuer: "Behemoth", accountName: "camina.drummer@opa.space", otp: "314159"),
         Credential(issuer: "Tachi", accountName: "amos.burton@opa.space", otp: "265358"),
         Credential(issuer: "Razorback", accountName: "clarissa.mao@opa.space", otp: "979323"),
         Credential(issuer: "Canterbury", accountName: "naomi.nagata@opa.space", otp: "846264")]
    }
}
