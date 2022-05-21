//
//  GeneralHelper.swift
//  qubix
//
//  Created by Chris McElroy on 5/20/22.
//

import Foundation

extension Sequence where Element: AdditiveArithmetic {
	func sum() -> Element { reduce(.zero, +) }
}

func bound<N: Numeric>(_ l: N, _ m: N, _ u: N) -> N where N: Comparable {
	min(u, max(l, m))
}

extension Date {
	func isYesterday() -> Bool {
		Calendar.current.isDateInYesterday(self)
	}
	
	func isToday() -> Bool {
		Calendar.current.isDateInToday(self)
	}
	
	static var int: Int {
		let midnight = Calendar.current.startOfDay(for: Date())
		return Calendar.current.ordinality(of: .day, in: .era, for: midnight) ?? 0
	}
	
	static var now: TimeInterval {
		timeIntervalSinceReferenceDate
	}
	
	static var ms: Int {
		Int(now*1000)
	}
}

extension Timer {
	@discardableResult static func after(_ delay: TimeInterval, run: @escaping () -> Void) -> Timer {
		scheduledTimer(withTimeInterval: delay, repeats: false, block: { _ in run() })
	}
	
	@discardableResult static func every(_ delay: TimeInterval, run: @escaping () -> Void) -> Timer {
		scheduledTimer(withTimeInterval: delay, repeats: true, block: { _ in run() })
	}
}
