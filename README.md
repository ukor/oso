# oso

Health tracking app

## Getting Started
---

### Set up FVM
This project uses FVM and assume you have your flutter and dart locked at this version

```yaml

environment:
    sdk: ^3.7.2  # Dart version
    flutter: ^3.29.3

```

---

### Updating flutter version
> [!IMPORTANT]
> A resolution has to be reached before this change is made.
>

The new versions should be change in the following files
- .fvm/fvm_config.json
- pubspec.yml
- .github/workflows/build_main_apk.yml
- README.md

Then run the code below to update the version
```sh

make clean

fvm use <version>

make install
```
---

### Build App
- Development
```bash
make build-dev-android
```

---

- Staging
```bash
make build-stg-android
```  

---

- Production Build
```bash
# android
make build-android 

# ios
make build-ios
```

---

### DTO vs Model
`Dtos` are object that transfer data between two layer; example `Service` to `Repository` or `state` to `service`.
`Dtos` technically don't contain any business logic

`Models` on the other hand can contain business logic.

In this project treat `Dtos` like `model` - Keep things simple till it is important to abstract.

Business Logic in the context of `Dtos` means derivation of field base on other field; for example
a field `isBirthday` can be derived/computed from a `dateOfBirth` field.

Fields in `Dtos` can be `immutable` and `mutable` - Set this according to your needs
In most cases you want `dtos` to be immutable.

### Repositories vs Service
In this project, repositories are classes that connect to the data store or APIs,
while services are class where business logic are done

---

> [!IMPORTANT]
> In no situation should implementation be done in view or screen -
> all implementation or business logic should be move to either `state` or respective `service`
>

---

### Conventions and Dogmas

See the `lib/modules/_example` folder for examples of

- file naming convention
- folder structure
- dto

---

### JDKs
- [Azul Zulu JDK](https://www.azul.com/downloads/?package=jdk#zulu)
- [Microsoft JDK](https://learn.microsoft.com/en-us/java/openjdk/download)
- [Gradle Matrix Compatibility](https://docs.gradle.org/current/userguide/compatibility.html)


### Stack Overflow
- [Incompatible Gradle Fix](https://stackoverflow.com/a/76383993/3501729)