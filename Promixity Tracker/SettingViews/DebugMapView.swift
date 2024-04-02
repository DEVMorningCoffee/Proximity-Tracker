//
//  DebugMapView.swift
//  Promixity Tracker
//
//  Created by user238598 on 4/2/24.
//

import SwiftUI
import CoreLocation

struct DebugMapView: View {
    
    @FetchRequest(
        sortDescriptors: []
    ) var elems: FetchedResults<Location>
    
    var body: some View {
        let connections = elems.map({CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)})
        
        let annotations = connections.map({MapAnnotation(clusteredLocation: ClusteredLocation(location: $0, startDate: .distantPast, endDate: .distantPast, worstAccuracy: 0))})
        
        MapView(annotations: annotations, connections: [], mapFinishedLoading: .constant(true))
    }
}
