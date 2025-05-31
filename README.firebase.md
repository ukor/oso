> [!IMPORTANT]
> Command in this file has already been ran during project setup and does not need to be re-ran.
> .
> After this initial running of flutterfire configure, you need to re-run the command any time that you:
> Start supporting a new platform in your Flutter app.
> Start using a new Firebase service or product in your Flutter app, especially if you start using sign-in with Google, Crashlytics, Performance Monitoring, or Realtime Database.
> Re-running the command ensures that your Flutter app's Firebase configuration is up-to-date and (for Android) automatically adds any required Gradle plugins to your app.
> Firebase Documentation
> See - https://firebase.google.com/docs/flutter/setup?platform=ios

---

## Firebase Configuration
Ensure you have Firebase CLI installed
[FlutterFire CLI](https://firebase.flutter.dev/docs/cli/)
[Firebase Plugins](https://firebase.google.com/docs/flutter/setup?platform=android#available-plugins)
[Firebase Documentation](https://firebase.google.com/docs/flutter/setup?platform=ios)

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

---

## Reference

- Understanding Firebase Project - https://firebase.google.com/docs/projects/learn-more
- Mange Installations - https://firebase.google.com/docs/projects/manage-installations
- Discover Firebase for Flutter - https://firebase.google.com/docs/flutter
- IOS - Mange files - https://developer.apple.com/documentation/xcode/managing-files-and-folders-in-your-xcode-project
