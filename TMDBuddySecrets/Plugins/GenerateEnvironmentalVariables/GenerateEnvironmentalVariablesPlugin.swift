import Foundation
import PackagePlugin

@main
struct GenerateEnvironmentalVariablesPlugin: BuildToolPlugin {
    func createBuildCommands(context: PackagePlugin.PluginContext, target: any PackagePlugin.Target) async throws -> [PackagePlugin.Command] {
        return [
            .buildCommand(
                displayName: "Generate environmental variables",
                executable: try context.tool(named: "GenerateEnvironmentalVariablesExec").url,
                arguments: [
                    context.pluginWorkDirectoryURL.absoluteString
                ],
                environment: [:],
                inputFiles: [],
                outputFiles: [
                    context.pluginWorkDirectoryURL.appending(path: "GeneratedEnvironmentVariables.swift")
                ]
            )
        ]
    }
}
