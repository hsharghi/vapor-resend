//
//  File.swift
//  
//
//  Created by Hadi Sharghi on 6/12/24.
//

import Vapor
import Resend

extension Application {
    public struct Resend {
        private final class Storage {
            let apiKey: String
            
            init(apiKey: String) {
                self.apiKey = apiKey
            }
        }

        private struct Key: StorageKey {
            typealias Value = Storage
        }

        private var storage: Storage {
            if self.application.storage[Key.self] == nil {
                self.initialize()
            }
            return self.application.storage[Key.self]!
        }
        
        public func initialize(apiKey: String? = nil) {
            if let apiKey {
                self.application.storage[Key.self] = .init(apiKey: apiKey)
                return
            }
            guard let apiKey = Environment.process.RESEND_API_KEY else {
                fatalError("No Resend API key provided")
            }
            self.application.storage[Key.self] = .init(apiKey: apiKey)
        }

        fileprivate let application: Application

        public var client: ResendClient {
            .init(httpClient: self.application.http.client.shared, apiKey: self.storage.apiKey)
        }
    }

    public var resend: ResendClient {
        let resend = Resend(application: self)
        return resend.client
    }
}

