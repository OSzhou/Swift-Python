

# Swift-Python

This is a demo for swift use python in iOS app

### Step 1
- import `python.xcframework` to app, and select `Embed&Sign`
- framework can get from: [Python-Apple-support](https://github.com/beeware/Python-Apple-support)
- import [PythonKit](https://github.com/pvieito/PythonKit.git), use `Swift package`:
  ```
  .package(url: "https://github.com/pvieito/PythonKit.git", branch: "master"),
  ```



### Step 2

Config script in `TARGETS`->`Build Phases`, look for demo and coyp those to your project:

> `Install Target Specific Python Standard Library`

> `Sign Python Binary Modules`

- import `dylib-Info-template.plist`to your project, and go`Build Settings`set`User Script SandBoxing`to`NO`



### Step 3

Add `app_packages`file to project. this file contain test code like `script.py`. and file`rubicon`, `rubicon_objc-0.4.9.dist-info` get from [BeeWare](https://docs.beeware.org/zh-cn/latest/tutorial/tutorial-5/iOS.html)-iOS program, can use for python call oc code.


