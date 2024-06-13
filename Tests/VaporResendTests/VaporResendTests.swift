import XCTest
import Vapor
@testable import VaporResend
@testable import Resend


final class VaporResendTests: XCTestCase {
    
    private var app: Application!
    
    override func setUp() {
        app = Application.init(.testing)
    }
    
    func testSend() async throws {
        let id = try await app.resend.emails.send(email: .init(
            from: .init(email: "hadi@example.com", name: "Hadi"),
            to: ["hadi@domain.com"],
            subject: "running xctest",
            replyTo: [
                "hadi@example.com",
                "manager@example.com"
            ],
            text: "sending email from XCTest suit",
            headers: [
                .init(name: "X-Entity-Ref-ID", value: "234H3-44"),
                .init(name: "X-Entity-Dep-ID", value: "SALE-03"),
            ],
            attachments: [
                .init(content: .init(data: .init(contentsOf: .init(filePath: "path/to/a/file"))), 
                      filename: "filename.pdf")
            ],
            tags: [
                .init(name: "priority", value: "medium"),
                .init(name: "department", value: "sales")
            ]
        ))
        XCTAssertNotNil(id)
        
    }
    
}
