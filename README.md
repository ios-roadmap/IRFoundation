# IRFoundation

*A lightweight, opinionated foundation layer for the **iOSRoadmap** ecosystem*

---

<!-- Outline -->
1. Overview
2. Features
3. Installation
4. Quick‑Start Examples
5. Architectural Principles
6. Prerequisites & Compatibility
7. Ecosystem
8. Documentation Status
9. Contributing
10. Roadmap
11. Licence
12. Changelog

---

## 1. Overview
`IRFoundation` is the **single source of truth** for foundational utilities, design tokens, and UIKit extensions used across the entire iOSRoadmap suite.  
Every app (**dozens**) and module (**20 + features**, **30 + packages**) within the organisation builds on this package — so you can focus on business logic, not boilerplate.

## 2. Features
* **Safe optional handling** – ergonomic `unwrapped(or:)`, `guarded()` and assertive runtime helpers.  
* **Extensive `String` toolkit** – case conversion, crypto hashes, encoding ↔︎ decoding, regex, metrics, validation & more.  
* **Colour & icon resources** – centralised asset catalogue for light, dark & tinted themes.  
* **Design‑system primitives** – `Typography`, `Spacing`, `ButtonStyle`, `TextTransform`, etc.  
* **UIKit power‑ups** – fluent `addSubviews`, stack/collection helpers, layout sugar.  
* **Zero external dependencies** – pure Swift 5.9, fully test‑covered.

## 3. Installation
IRFoundation is distributed via **Swift Package Manager**.

### Xcode
1. **File ▸ Add Packages…**
2. Enter the repo URL:
   ```
   https://github.com/ios-roadmap/IRFoundation.git
   ```
3. Select **Up to Next Major Version** (starting from **0.0.1**).

### Package.swift
```swift
// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    // …
    dependencies: [
        .package(url: "https://github.com/iosroadmap/IRFoundation.git", from: "0.0.1")
    ],
    targets: [
        .target(
            name: "YourApp",
            dependencies: ["IRFoundation"]
        )
    ]
)
```

## 4. Quick‑Start Examples
### Safe optional unwrap
```swift
let email: String? = fetchEmail()
let resolved = email.unwrapped(or: "unknown@example.com")
```

### Regex search
```swift
let hasNumbers = "iOSRoadmap06".matches(#"\d+"#) // true
```

### Button styling
```swift
import IRFoundation

let runButton = UIButton(style: .primary(icon: .wolf, title: "Run"))
runButton.addTarget(self, action: #selector(runTapped), for: .touchUpInside)
```

### View composition helper
```swift
view.addSubviews(titleLabel, runButton)
stackView.spacing = .spacing(.medium)
```

## 5. Architectural Principles
* **Module isolation** – clear folder boundaries minimise coupling; higher‑level modules never import UI‑agnostic code.  
* **Protocol‑oriented & value types** – lightweight, testable APIs.  
* **No magic** – discoverable, predictable behaviours with sane defaults.  
* **British English naming** – e.g. `colour` over `color`.

## 6. Prerequisites & Compatibility
|                      | Minimum |
|----------------------|---------|
| iOS deployment target| **18.0**|
| Swift                | **6.0** |
| Xcode                | **16**  |

IRFoundation is UIKit‑focused but plays nicely with SwiftUI projects.

## 7. Ecosystem
The iOSRoadmap organisation maintains:
* **30 + Swift packages** – networking, analytics, AI, etc.
* **20 + feature modules** – reusable vertical slices (auth, payments, chat…).
* **Multiple production apps** – consumer, enterprise & internal tools.

Every one of these depends on **IRFoundation** as the canonical base layer.

## 8. Documentation Status
Comprehensive API docs & tutorials are **coming soon**.  
Until then, the public headers and inline `///` comments are your primary reference.

## 9. Contributing
1. **Fork** → create a branch (`feature/awesome`)  
2. Ensure *swift test* passes & run `swiftformat .`  
3. Submit a Pull Request – we review quickly.

Please follow existing coding conventions and add tests where sensible.

## 10. Roadmap
- [ ] Primitive extensions for `Date`, `URL`, `Result`  
- [ ] Combine‑friendly publishers in upcoming `IRNetworking`  
- [ ] SwiftUI adapters for **StyleKit**  
- [ ] SPM plugin for automated asset validation

## 11. Licence
Released under the **MIT Licence** – see `LICENCE`.

## 12. Changelog
### 0.0.1 – *2025‑05‑02*
* 🚀 Initial public release.  
* Common, Primitive.String, Resources, StyleKit & UIKit, SwiftUI components.  
* 100 % unit‑tested, GitHub Actions CI.
