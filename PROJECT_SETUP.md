> [!IMPORTANT]
> Command in this file has already been ran during project setup and does not need to be re-ran.
> .
### Flutter Icons
This project uses Flutter Icons CLI to generate Icons

> [!IMPORTANT]
> Flutter Icons and splash screen CLI commands only need to be ran once
> Only run this command again if the icon changes
```bash
make generate-launcher-icons
```

### Flutter Splash
```bash
make generate-splash-screens 
```

## Firebase Configuration
Ensure you have Firebase CLI installed
[FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)

[Firebase Plugins](https://firebase.google.com/docs/flutter/setup?platform=android#available-plugins)

- Login to firebase
```bash
firebase login
```

- Configure firebase for different environment

Run the following command to generate configuration the different environment

- Development
```bash
make firebase-dev
```

- Staging
```bash
make firebase-stg
```

- Production
```bash
make friebase-prd
```

## Build app

- Run codegen
```bash
make build-runner
```  

---