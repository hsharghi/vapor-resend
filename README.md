# VaporResend

<p align="center">
    <a href="https://vapor.codes">
        <img src="http://img.shields.io/badge/Vapor-4-brightgreen.svg" alt="Vapor Logo">
    </a>
    <a href="https://swift.org">
        <img src="http://img.shields.io/badge/Swift-5.10-brightgreen.svg" alt="Swift 5.10 Logo">
    </a>
    <a href="https://raw.githubusercontent.com/lloople/vapor-maker-commands/main/LICENSE">
        <img src="https://img.shields.io/badge/license-MIT-blue.svg" alt="MIT License">
    </a>
</p>

**VaporResend** is a wrapper for the [SwiftResend](https://github.com/hsharghi/swift-resend.git) package, 
designed for use with the Vapor framework to communicate with the [Resend](https://resend.com) email sending platform API.


## Setup

### Add Dependency
Add the dependency to your Package.swift:

~~~~swift
dependencies: [
	...
	.package(url: "https://github.com/hsharghi/vapor-resend.git", from: "1.0.0")
],
targets: [
    .target(name: "App", dependencies: [
        .product(name: "VaporResend", package: "vapor-resend"),
    ]),
~~~~

### Configure Environment Variable
Provide the `RESEND_API_KEY` environment variable for authentication.

## Usage

### Sending Emails
Import `VaporResend` modules and configure your routes:

~~~~swift
import Vapor
import VaporResend

func routes(_ app: Application) throws {
    app.get("send") { req async throws -> String in
        let id = try await req.resend.emails.send(email: .init(from: .init(email: "hadi@domain.com", name: "Hadi"),
                                            to: [.init(email: "john@apple.com")],
                                            subject: "Sending email from Vapor",
                                           text: "Email sent using ResendVapor"))
        
        return id
    }
}
~~~~
For full SDK documentation check out [SwiftResend](https://github.com/hsharghi/swift-resend.git) Package.


## License

This package is released under the MIT license. See [LICENSE](https://github.com/hsharghi/vapor-resend/blob/main/LICENSE) for details.

