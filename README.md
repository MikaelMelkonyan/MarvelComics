# Marvel Comics Application
<img src="./Assets/Characters.png" height="400">
<img src="./Assets/CharacterDetails.png" height="400">

This application is built to explore and interact with the Marvel Comics API available at [developer.marvel.com](https://developer.marvel.com). It is designed with the Model-View-ViewModel (MVVM) architecture pattern in mind, ensuring that the View only receives state updates from the ViewModel when necessary. The application is implemented without additional libraries or dependencies.

## Setup Instructions

To run the application, you need to provide your private and public keys from the Marvel API. These keys should be added to the `Keys.plist` file.

1. Sign up at [developer.marvel.com](https://developer.marvel.com) and get your API keys.
2. Add your Marvel API keys to the `Keys.plist` file in the following format:

```plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>PublicKey</key>
    <string>YOUR_PUBLIC_KEY</string>
    <key>PrivateKey</key>
    <string>YOUR_PRIVATE_KEY</string>
</dict>
</plist>
```

## Features

- **Characters**: Displays a list of Marvel Characters.
- **Character Details**: Shows detailed information about a selected character.
- **State Management**: Implements a basic MVVM architecture pattern for state management.

## Known Issues and Improvements

### Improvements
- **Thumbnail Performance**: Implement changeable image sizes in the Thumbnail component for better performance.
- **Pagination**: Add pagination support to the Characters List.
- **Loading State**: Implement a loading state for the Characters List and Character Details.
- **Empty List State**: Implement an empty list state for the ComicList.
- **Caching**: Implement caching for offline access and performance improvements.
- **Test Coverage**: Increase the test coverage to ensure reliability.

## Running the Application

After setting up your API keys, you can run the application using Xcode. Open the project in Xcode and build the application. Ensure that your simulator or connected device has internet access to fetch data from the Marvel API.

## Contributing

If you wish to contribute to the project, feel free to fork the repository and submit a pull request. Ensure that your code follows the existing architecture and is well-documented.

## License

This project is licensed under the MIT License. See the LICENSE file for more details.
