import Foundation

let arguments = ProcessInfo().arguments
guard arguments.count >= 2 else {
    throw GeneratedEnvironmentVariablesError.invalidArguments
}

let outputURL = URL(filePath: arguments[1]).appending(path: "GeneratedEnvironmentVariables.swift")

let process = Process()
process.executableURL = URL(fileURLWithPath: "/bin/zsh")
process.arguments = ["-c", "echo $TMDBUDDY_API_KEY"]

let outputPipe = Pipe()
process.standardOutput = outputPipe
try process.run()
process.waitUntilExit()

let apiKey: String

guard
    let outputData = try outputPipe.fileHandleForReading.readToEnd(),
    let apiKey = String(data: outputData, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines),
    !apiKey.isEmpty
else {
    throw GeneratedEnvironmentVariablesError.missingKey
}

let code = """
/// Generated from environment variables from .zshenv file.

enum GeneratedEnvironmentVariables {
    static let apiKey = "\(apiKey)"
}
"""

guard let data = code.data(using: .utf8) else {
    throw GeneratedEnvironmentVariablesError.invalidData
}

try data.write(to: outputURL, options: .atomic)

enum GeneratedEnvironmentVariablesError: Error {
    case invalidArguments
    case missingKey
    case invalidData
}
