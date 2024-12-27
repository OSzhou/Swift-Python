# Pyhton 调用 OC
from rubicon.objc import ObjCClass
# Import the Objective-C class we created
MyObjectiveCClass = ObjCClass('MyOCWrapper')

# Create an instance of the Objective-C class
objc_instance = MyObjectiveCClass.alloc().init()

# OC 调用 Python
def greet(name):
    print("Swift call Python succeed! Swift: Hello, " + name + "!")
    # call OC function
    greeting = objc_instance.greet('Swift')
    print(greeting)
    
#greet("World")

def add(a, b):
    return a + b
