//
//  CKHandler.swift
//  NotesOnline
//
//  Created by Zac Holland on 8/29/17.
//  Copyright © 2017 Bandwidth Bandits. All rights reserved.
//

import Foundation
import CloudKit

typealias FetchRecordsCallback = ([CKRecord]) -> Void

class CKHandler {
    //get the cloudkit container from our current General and Capabilities settings
    static let container = CKContainer.default()
    //gets the public database from container
    static let publicDB = CKHandler.container.publicCloudDatabase
    //gets the private database from container
    static let privateDB = CKHandler.container.privateCloudDatabase
    
    static func FetchAllPublicNotes(onComplete: @escaping FetchRecordsCallback) {
        print("Fetching all public notes...")
        
        //set up the query
        let query = CKQuery(recordType: "Note", predicate: NSPredicate(value: true))
        
        CKHandler.container.publicCloudDatabase.perform(query, inZoneWith: nil) { (records, error) in
            
            //check for error, if so print and then end
            if error != nil {
                print("Erorr fetching notes: \(error.debugDescription)")
                return
            }
            
            //There were for sure no errors at this point
            //So deal with the records we got
            guard let records = records else {
                print("Records array was empty!")
                return
            }
            onComplete(records)
            
        }
    }
}
