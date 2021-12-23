//
//  Extensions+FlutterStreamHandler.swift
//  health_kit_reporter
//
//  Created by Victor Kachalov on 09.12.20.
//

import Foundation

extension FlutterStreamHandler where Self: NSObject & StreamHandlerProtocol {
    private func executePlannedQueries() {
        for plannedQuery in plannedQueries {
            reporter.manager.executeQuery(plannedQuery)
            activeQueries.insert(plannedQuery)
        }
        plannedQueries.removeAll()
    }

    func handleOnListen(
        withArguments arguments: Any?,
        eventSink events: @escaping FlutterEventSink
    ) -> FlutterError? {
        guard let arguments = arguments as? [String: Any] else {
            return FlutterError(
                code: self.className,
                message: "Error call arguments.",
                details: "No arguments"
            )
        }
        do {
            try setQueries(
                arguments: arguments,
                events: events
            )
            executePlannedQueries()
        } catch {
            return FlutterError(
                code: className,
                message: "Error setting query.",
                details: error
            )
        }
        return nil
    }
    func handleOnCancel(withArguments arguments: Any?) -> FlutterError? {
        activeQueries.forEach { reporter.manager.stopQuery($0) }
        return nil
    }
}
