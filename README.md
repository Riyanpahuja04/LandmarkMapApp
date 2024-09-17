# Travel Journal App

## Overview
The travel journal app lets you search for a location you have travelled to and add images and notes to remember your travel.

## Features
- **Search for Location**: The interactive map lets you search for a location you have travelled to.
- **Add Journal**: Add the location, some accompanying pictures, and detailed notes to remember the best parts of your journey.
- **Read Journal**: You can reflect on your travels and remanence in one convenient place.

## Technical Overview
- **SwiftUI & MVVM**: Built using SwiftUI for modern, reactive UI design, following the MVVM (Model-View-ViewModel) architecture to separate concerns clearly.
- **State Management**: Utilises `@StateObject`, `@Binding`, and `@Published` for seamless state updates across views.
- **Custom Protocol**: Implements a protocol to ensure all models related to the Map contain location coordinates.
- **ImagePicker**: A custom ImagePicker view integrates `UIImagePickerController` to allow image selection from the user's device.
- **Map**: An interactive map lets the user scroll and search for locations.
- **Error Handling**: Input validation ensures users provide valid book data, displaying error alerts when needed.

## Future Improvements
- **Core Data**: Utilise Core Data to save user data.
- **Filtering**: Letting users filter by travel type and search for locations from saved journals.
- **Cloud Sync**: Add cloud synchronization (e.g., iCloud) to sync journals across multiple devices.

## GitHub
[https://github.com/Riyanpahuja04/LandmarkMapApp.git](https://github.com/Riyanpahuja04/LandmarkMapApp.git)
