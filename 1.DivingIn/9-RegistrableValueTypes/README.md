# 9-RegistrableValueTypes

Resource:
- [https://doc.qt.io/qt-6/qtqml-cppintegration-definetypes.html](https://doc.qt.io/qt-6/qtqml-cppintegration-definetypes.html)
  
## Value Types 
[Gadgets just generate meta data so that you can access their members from QML and pass around, that's about it](https://stackoverflow.com/questions/42797359/how-to-create-new-instance-of-a-q-gadget-struct-in-qml)
- Useful as storage types only. 
- Should not have signals
- Uncreatable in QML (since they are not QObject-derived)

## Accessing Gadgets 

- Can be accessed via signals or slots of Object types(QObject-derived)