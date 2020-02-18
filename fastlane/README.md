fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew cask install fastlane`

# Available Actions
## iOS
### ios make_debug_ipa
```
fastlane ios make_debug_ipa
```
デバッグ用のIPAファイルを作成
### ios test_all
```
fastlane ios test_all
```
全テスト実行
### ios test_XcodeGenTestApp
```
fastlane ios test_XcodeGenTestApp
```
XcodeGenTestAppテスト実行
### ios test_Petstore
```
fastlane ios test_Petstore
```
Petstoreテスト実行

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
