//
//  Secrets.swift
//  TMDBuddySecrets
//
//  Created by Aleksei Lobankov on 08.10.2024.
//

public enum Secrets {
    public static let apiKey: String = {
        return Self.decode(GeneratedEnvironmentVariables.apiKey, salt: GeneratedEnvironmentVariables.salt)
    }()

    private static func decode(_ encodedVariable: [UInt8], salt: [UInt8]) -> String {
        String(
            decoding: encodedVariable.enumerated()
                .map { index, byte in
                    byte ^ salt[index % salt.count]
                },
            as: UTF8.self
        )
    }
}
