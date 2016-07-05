//
//  Extensions.swift
//  Postgres
//
//  Created by Chris on 01/07/16.
//  Copyright © 2016 postgresapp. All rights reserved.
//

import Foundation

extension URL {
	
	public var isFinderAlias: Bool {
		get {
			var isAlias: AnyObject?
			do {
				try (self as NSURL).getResourceValue(&isAlias, forKey: .isAliasFileKey)
			} catch _ {}
			guard let result = isAlias as! Bool! else { return false }
			return result
		}
	}
	
}





extension FileManager {
	
	public func applicationSupportDirectoryURL(createIfNotExists: Bool) -> URL {
		let appSupportDirURL = URL.init(string:
			String(FileManager.default().urlsForDirectory(.applicationSupportDirectory, inDomains: .userDomainMask)[0]).appending(
				Bundle.main().infoDictionary?[kCFBundleNameKey as String] as! String
			)
		)
		
		if !FileManager.default().fileExists(atPath: appSupportDirURL!.path!) && createIfNotExists {
			do {
				try FileManager.default().createDirectory(at: appSupportDirURL!, withIntermediateDirectories: false, attributes: nil)
			}
			catch let error as NSError  {
				print("Error creating directory: ", error)
			}
		}
		
		return appSupportDirURL!
	}
	
}
