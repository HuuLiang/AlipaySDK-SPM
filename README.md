# AlipaySDK-SPM
Swift Package Manager support for AlipaySDK

# AlipaySDK 本地集成说明

由于 `AlipaySDK.xcframework` 在 Xcode 26 下进行 Framework Validation 时存在资源缺失及配置问题，因此对官方 SDK 做了如下调整。

## 修改内容

### 1. 添加 Privacy Manifest

将 `PrivacyInfo.xcprivacy` 分别复制到以下目录：

```
AlipaySDK.xcframework/
├── ios-arm64/
│   └── AlipaySDK.framework/
└── ios-arm64_x86_64-simulator/
    └── AlipaySDK.framework/
```

### 2. 修正 Framework Info.plist

Framework 内部原文件名为：

```
AlipaySDK-inside-Info.plist
```

修改为：

```
Info.plist
```

确保 Framework 符合 Apple Framework Bundle 规范。

### 3. 修正 CFBundleIdentifier

修改 `Info.plist` 中的：

```xml
<key>CFBundleIdentifier</key>
<string>$(PRODUCT_BUNDLE_IDENTIFIER)</string>
```

为合法且固定的 Bundle Identifier，例如：

```xml
<key>CFBundleIdentifier</key>
<string>com.alipay.AlipaySDK</string>
```

避免 Xcode Validate Framework 时出现：

```
invalid CFBundleIdentifier:
$(PRODUCT_BUNDLE_IDENTIFIER)
```

## 修改原因

Xcode 26 对嵌入 Framework 的校验更加严格。

若 Framework：

- 缺少 `Info.plist`
- `CFBundleIdentifier` 为构建变量
- 缺少 `PrivacyInfo.xcprivacy`

均可能导致构建或验证失败。

### 4. 修正 CFBundleExecutable

修改 `Info.plist` 中的：

```xml
<key>CFBundleExecutable</key>
<string>${EXECUTABLE_NAME}</string>
```

为：

```xml
<key>CFBundleExecutable</key>
<string>AlipaySDK</string>
```

避免安装应用时出现：

```
AlipaySDK.framework is missing its bundle executable
```

本仓库中的 `AlipaySDK.xcframework` 已完成上述修正，可直接通过 Swift Package Manager 集成，无需再次修改。