import Foundation

/// A wrapper to facilitate downloading a schema with the Apollo node CLI
public struct ApolloSchemaDownloader {
  
  /// Runs code generation from the given folder with the passed-in options
  ///
  /// - Parameter folder: The folder to run the script from
  /// - Parameter binaryFolderURL: The folder where the Apollo binaries have been unzipped.
  /// - Parameter options: The options object to use to download the schema.
  public static func run(from folder: URL,
                         binaryFolderURL: URL,
                         options: ApolloSchemaOptions) throws -> String {
    try FileManager.default.apollo_createContainingFolderIfNeeded(for: options.outputURL)
    
    let cli = ApolloCLI(binaryFolderURL: binaryFolderURL)
    return try cli.runApollo(with: options.arguments, from: folder)
  }
}
