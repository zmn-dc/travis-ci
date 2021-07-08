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
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios custom_lane
```
fastlane ios custom_lane
```
Description of what the lane does
### ios textTimeConsuming
```
fastlane ios textTimeConsuming
```
耗时秒数文案
### ios xm_build_debug
```
fastlane ios xm_build_debug
```
build 小码宝贝 debug 包
### ios xm_build_release
```
fastlane ios xm_build_release
```
build 小码宝贝 release 包
### ios xm_build_appstore
```
fastlane ios xm_build_appstore
```
build 小码宝贝 app-store 包
### ios pg_debug_dc
```
fastlane ios pg_debug_dc
```
蒲公英-debug-打包 戴超
### ios pg_release_dc
```
fastlane ios pg_release_dc
```
蒲公英-release-打包 戴超
### ios fir_debug_dc
```
fastlane ios fir_debug_dc
```
Fir.im-debug-打包 戴超
### ios pg_debug
```
fastlane ios pg_debug
```
蒲公英-debug-打包 小码宝贝
### ios pg_release
```
fastlane ios pg_release
```
蒲公英-release-打包 小码宝贝
### ios mail
```
fastlane ios mail
```
发送邮件
### ios mail_test
```
fastlane ios mail_test
```
发送测试邮件，发送给自己
### ios ding_talk
```
fastlane ios ding_talk
```

### ios test
```
fastlane ios test
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
