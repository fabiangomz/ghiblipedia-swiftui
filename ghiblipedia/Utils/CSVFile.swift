//
//  CSVFile.swift
//  ghiblipedia
//
// https://www.hackingwithswift.com/quick-start/swiftui/how-to-export-files-using-fileexporter

import SwiftUI
import UniformTypeIdentifiers

struct CSVFile: FileDocument {
    static var readableContentTypes: [UTType] = [.commaSeparatedText]

    var text: String

    init(text: String) {
        self.text = text
    }

    init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents {
            text = String(decoding: data, as: UTF8.self)
        } else {
            text = ""
        }
    }

    func fileWrapper(configuration: WriteConfiguration) throws -> FileWrapper {
        let data = Data(text.utf8)
        return FileWrapper(regularFileWithContents: data)
    }
}
