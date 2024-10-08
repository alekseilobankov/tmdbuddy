import Foundation

let arguments = ProcessInfo().arguments
guard arguments.count >= 2 else {
    throw GeneratedEnvironmentVariablesError.invalidArguments
}

try generateSwiftCode(outputURL: arguments[1])

// MARK: - Functions

func generateSwiftCode(outputURL: String) throws {
    let apiKey = try retrieve(environmentVariable: .apiKey)
    let salt = try generateRandomSalt()
    let obfuscatedApiKey = try obfuscate(key: apiKey, salt: salt)

    let code = """
    /// Generated environment variables from .zshenv file.
    /// Do not modify manually.

    enum GeneratedEnvironmentVariables {
        static let apiKey: [UInt8] = \(obfuscatedApiKey)
    
        static let salt: [UInt8] = \(salt)
    }
    """

    guard let data = code.data(using: .utf8) else {
        throw GeneratedEnvironmentVariablesError.invalidData
    }

    let outputURL = URL(filePath: outputURL).appending(path: "GeneratedEnvironmentVariables.swift")
    try data.write(to: outputURL, options: .atomic)
}

func retrieve(environmentVariable key: EnvironmentKeys) throws -> String {
    let process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/zsh")
    process.arguments = ["-c", "echo $\(key.rawValue)"]

    let outputPipe = Pipe()
    process.standardOutput = outputPipe
    try process.run()
    process.waitUntilExit()

    guard
        let outputData = try outputPipe.fileHandleForReading.readToEnd(),
        let environmentVariable = String(data: outputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
        !environmentVariable.isEmpty
    else {
        throw GeneratedEnvironmentVariablesError.missingKey(key.rawValue)
    }

    return environmentVariable
}

func generateRandomSalt() throws(GeneratedEnvironmentVariablesError) -> [UInt8] {
    let length = Int.random(in: 16...64)
    var salt = [UInt8](repeating: 0, count: length)
    let result = SecRandomCopyBytes(kSecRandomDefault, length, &salt)
    guard result == errSecSuccess else {
        throw GeneratedEnvironmentVariablesError.saltGenerationFailed
    }
    return salt
}

func obfuscate(key: String, salt: [UInt8]) throws(GeneratedEnvironmentVariablesError) -> [UInt8] {
    key.utf8
        .enumerated()
        .map { index, byte in
            byte ^ salt[index % salt.count]
        }
}

// MARK: - Utility types

enum EnvironmentKeys: String {
    case apiKey = "TMDBUDDY_API_KEY"
}

enum GeneratedEnvironmentVariablesError: Error {
    case invalidArguments
    case missingKey(String)
    case saltGenerationFailed
    case obfuscationFailed
    case invalidData
}
