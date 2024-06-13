//
//  File.swift
//  
//
//  Created by Hadi Sharghi on 6/13/24.
//

import Vapor
import Resend

extension Request {
    public var resend: ResendClient {
        self.application.resend
    }
}
