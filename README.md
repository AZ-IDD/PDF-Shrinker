## Links
[Last installer file & bin folder ](https://drive.google.com/drive/folders/1EEy2rzZw--ag5PKtAgoubQoeMGxaxUZQ?usp=sharing)



## Features

- **Installation**: The installer supports with parameters for tracking affiliates via affid and subid.
- **Custom Installer**: The project includes a custom installer with an icon, desktop shortcuts, and automatic launch after installation.
- **Cross-Platform Deployment**: Utilizes .NET 8.0 for building the application with Windows WPF support.

## Prerequisites

- **Ghostscript**: Ensure that Ghostscript SDK is installed.

## Building the Project

1. Open the `Installer.iss` 
2. Change the parameter `CodeFile` at the top of the ISS file to the local path where the source code files are.
3. Change the parameter `ThankYou` to your thank you page link.
4. Change the parameter `Affid`.
5. Change the parameter `Subid`.
6. Run `Installer.iss`.
7. After run `Installer.iss` you can find the install file (.exe) on `PdfShrinker/Installers`.


## Installation

1. End users will get the exe file in the `PdfShrinker/Installers` folder.
2. Run the installer. (silent installation).
3. The application will automatically launch after installation and a thank you page will be opened in a browser.
4. Users will also be able to run the app at any time via a shortcut on their desktop.
5. The file `PdfShrinker` will be installed in folder .




